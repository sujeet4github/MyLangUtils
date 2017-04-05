package idiomaticKotlin

//Destructuring useful for

//
// a) returning multiple values from a function.
//    another option is to define an own data class or use Pair
//    (but this is less expressive, no semantics)
//
data class ServiceConfig(val host: String, val port: Int)
fun createServiceConfig(): ServiceConfig {
    return ServiceConfig("api.domain.io", 9389)
}

fun bla(){
    val (host, port) = createServiceConfig()
}

//
// b) iterate over maps
fun foo(){

    val map = mapOf("api.domain.io" to 9389, "localhost" to 8080)

    for ((host, port) in map){
        //...
    }
}
