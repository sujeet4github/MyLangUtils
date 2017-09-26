Links
=====
* https://ssouris.github.io/2017/06/02/petclinic-spring-5-kotlin-reactive-mongodb.html

Technologies Used:
-----------------
* Language			:	Kotlin(https://kotlin.link/)
* Web Framework		:	Spring Boot(https://projects.spring.io/spring-boot/)
* 						Spring Web Reactive Functional (https://spring.io/blog/2016/09/22/new-in-spring-5-functional-web-framework)
* Engine			:	Netty used for client and server (http://netty.io/)
* Reactive API		:	Reactor (http://projectreactor.io/)
* Persistence		:	Spring Data Reactive Mongo (https://spring.io/blog/2016/11/28/going-reactive-with-spring-data)
* Build				:	Gradle Script Kotlin (https://github.com/gradle/gradle-script-kotlin)
* Testing			:	Junit (http://junit.org/)

Wrapper created using
---------------------
* In a terminal ``gradle wrapper --gradle-version 4.1``

Running the app:
---------------
* In a terminal ``gradlew bootRun (in a terminal)``
* http://localhost:8080/
* If you want to debug the app, add --debug-jvm parameter to Gradle command line
* To Package and Run:
<br/>``  ./gradlew clean build``
<br/>``  java -jar build/libs/petclinic-spring5-kotlin-1.0.0-SNAPSHOT.jar``

