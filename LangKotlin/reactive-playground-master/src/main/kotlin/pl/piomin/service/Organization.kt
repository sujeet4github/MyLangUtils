package pl.piomin.service

class Organization(var id: Int, var name: String) {
    var employees: MutableList<Employee> = ArrayList()
    var departments: MutableList<Department> = ArrayList()

    constructor(id: Int, name: String, employees: MutableList<Employee>, departments: MutableList<Department>) : this(id, name){
        this.employees.addAll(employees)
        this.departments.addAll(departments)
    }

    constructor(id: Int, name: String, employees: MutableList<Employee>) : this(id, name){
        this.employees.addAll(employees)
    }

    override fun toString(): String{
		val address2Str = "Organization {id = ${id}, name = ${name}, e = ${employees.joinToString()}, d = ${departments.joinToString()} }"
		return address2Str
	}
}