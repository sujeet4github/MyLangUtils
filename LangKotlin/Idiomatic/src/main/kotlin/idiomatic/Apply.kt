package idiomaticKotlin

import org.apache.commons.dbcp2.BasicDataSource

// Don't do this
fun blub(){
    val dataSource = BasicDataSource()
    dataSource.driverClassName = "com.mysql.jdbc.Driver"
    dataSource.url = "jdbc:mysql://domain:3309/db"
    dataSource.username = "username"
    dataSource.password = "password"
    dataSource.maxTotal = 40
    dataSource.maxIdle = 40
    dataSource.minIdle = 4
}

// The extension function apply() helps to group and centralize
// initialization code for an object.
// Besides, we don’t have to repeat the variable name over and over again.

// Do this instead
val dataSource = BasicDataSource().apply {
    driverClassName = "com.mysql.jdbc.Driver"
    url = "jdbc:mysql://domain:3309/db"
    username = "username"
    password = "password"
    maxTotal = 40
    maxIdle = 40
    minIdle = 4
}