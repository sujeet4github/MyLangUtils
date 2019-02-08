package pl.piomin.service

import org.junit.Assert
import org.junit.Test
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono

class HelloTest {

    @Test
    fun testScenario3() {
        // We have two API methods that emits Flux with the same object types.
        // First of them contains list of employees having id, name, salary properties,
        // while the second id, organizationId, departmentId properties.
        // 
        // We want to convert it into a single stream emitting employees with full set of properties
        //
        // NOTE: Note these work because these are ordered - employee 1 comes first in both the streams etc
        // and zipWith is not like a SQL join: {1, 2} zipWith {a, b} = {(1, a), (2, b)}

        val employees : Flux<Employee> = getEmployeesBasic()
                .zipWith(getEmployeesRelationships())
                .map { t -> Employee(t.t1.id, t.t1.name, t.t1.salary, t.t2.organizationId!!, t.t2.departmentId!!) }
        Assert.assertEquals(2, employees.toStream().count())
    }

    @Test
    fun testScenario1 () {

        // return the single stream emitting organization that contains list of employees as shown below.
        // Organization(id=1) {
        //     Employee(id=1),
        //     Employee(id=2),
        // }
        //
        // getOrganizationByName returns a Mono.
        // The zipWhen waits for result from this Mono and then calls collectList (on getEmployeesByOrganization).
        // The zipWhen then combines the two Mono streams into a tuple
        //  
        val organization : Mono<Organization> = getOrganizationByName("test")
                .zipWhen { organization ->
                    getEmployeesByOrganization(organization.id!!).collectList()
                        // collectList converts Flux<Employee> into Mono<MutableList<Employee>>
                }
                // Above zipWhen results in a tuple of 1. Mono<> and 2. Mono<MutableList<Employee>>
                .map { tuple -> Organization(tuple.t1.id, tuple.t1.name, tuple.t2) }

        val org = organization.block()
        Assert.assertEquals("test", org.name)
        Assert.assertEquals(1, org.id)
        Assert.assertEquals(2, org.employees.size)
        org.employees.stream()
                .forEach { e -> Assert.assertEquals("Employee${e.id}", e.name) }
    }

    @Test
    fun testScenario5() {
        // We have a single input stream Mono<Organization> that contains list of departments.
        //  Each of department inside that list also contains the list of all employees
        //  assigned to the given department
        //
        // Get a list of all employees and add it to a Organization entity.

        var organization: Mono<Organization> = getDepartmentsByOrganization(1)
                .flatMapIterable { department -> department.employees }
                .collectList()
                .map { t -> Organization(1, "X", t) }
        Assert.assertEquals(4, organization.block().employees.size)

        val employees : Flux<Employee> = organization.
                flatMapIterable { organization -> organization.employees }
        Assert.assertEquals(4, employees.toStream().count())
    }

    @Test
    fun testScenario4() {
        // In this scenario we have two independent Flux stream that emit the same type of objects – Employee.
        // We would like to merge those two stream into a single stream ordered by id

        val persons: Flux<Employee> = getEmployeesFirstPart()
                .mergeOrderedWith(getEmployeesSecondPart(), Comparator { o1, o2 -> o1.id.compareTo(o2.id) })
                .map {
                    Employee(it.id, it.name, it.salary, 1, 1)
                }
        persons.toIterable().forEachIndexed { index, employee ->
            Assert.assertEquals(index + 1, employee.id)
        }
    }

    @Test
    fun testScenario2() {
        // Now, we have to Flux streams that emits
        // 1. employees - getEmployees
        // and 2. departments - getDepartments
        //
        // Every employee has property departmentId responsible for assignment to the department.
        //
        // The goal is to merge those two streams and return the single Flux stream emitting
        // departments that contains all employees assigned to the given department.
        //

        // We can do it in 2 ways

        // Approach 1
        //  1 .flatMap function on stream with departments.
        //    1. zip every single Department with stream of employees filtered by departmentId and converted into Mono type.
        //    2. Finally, we are creating Mono type using map function that emits department containing list of employees.
        val departments: Flux<Department> = getDepartments()
                .flatMap { department ->
                    Mono.just(department)
                            .zipWith(getEmployees().filter { it.departmentId == department.id }.collectList())
                            .map { t -> t.t1.addEmployees(t.t2) }
                }
        departments.toStream().forEach {
            Assert.assertEquals(2, it.employees.size)
        }

        // Approach 2
        // 1. group employees by departmentId
        // 2. zip with this list the departments
        val departments2: Flux<Department> = getEmployees()
                .groupBy { it.departmentId }
                .flatMap { t -> getDepartments().filter { it.id == t.key() }.elementAt(0)
                        .zipWith(t.collectList())
                        .map { it.t1.addEmployees(it.t2) }
                }
        departments2.toStream().forEach {
            Assert.assertEquals(2, it.employees.size)
        }
    }

    private fun getEmployeesBasic() : Flux<Employee> {
        return Flux.just(Employee(1, "AA", 1000),
                Employee(2, "BB", 2000))
    }

    private fun getEmployeesRelationships() : Flux<Employee> {
        return Flux.just(Employee(1, 1, 1),
                         Employee(2, 1, 2))
    }

    private fun getOrganizationByName(name: String) : Mono<Organization> {
        return Mono.just(Organization(1, name))
    }

    private fun getEmployeesByOrganization(id: Int) : Flux<Employee> {
        return Flux.just(Employee(1, "Employee1", 1000, id),
                         Employee(2, "Employee2", 2000, id))
    }

    private fun getDepartmentsByOrganization(id: Int) : Flux<Department> {
        val dep1 = Department(1, "A", id, mutableListOf(
                Employee(1, "Employee1", 1000, id, 1),
                Employee(2, "Employee2", 2000, id, 1)
                )
        )
        val dep2 = Department(2, "B", id, mutableListOf(
                Employee(3, "Employee3", 1000, id, 2),
                Employee(4, "Employee4", 2000, id, 2)
                )
        )
        return Flux.just(dep1, dep2)
    }

    private fun getDepartments() : Flux<Department> {
        return Flux.just(Department(1, "X", 1),
                         Department(2, "Y", 1))
    }

    private fun getEmployees() : Flux<Employee> {
        return Flux.just(Employee(1, "Employee1", 1000, 1, 1),
                Employee(2, "Employee2", 2000, 1, 1),
                Employee(3, "Employee3", 1000, 1, 2),
                Employee(4, "Employee4", 2000, 1, 2))
    }

    private fun getEmployeesFirstPart() : Flux<Employee> {
        return Flux.just(Employee(1, "AA", 1000), Employee(3, "BB", 3000))
    }

    private fun getEmployeesSecondPart() : Flux<Employee> {
        return Flux.just(Employee(2, "CC", 2000), Employee(4, "DD", 4000))
    }

}
