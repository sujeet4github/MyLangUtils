## Reactive programming with Project Reactor 

Detailed description can be found here: [Reactive programming with Project Reactor](https://piotrminkowski.wordpress.com/2018/10/22/reactive-programming-with-project-reactor/)

Reactive Core gives us two data types that enable us to produce a stream of data: Mono and Flux.
With Flux we can emit 0..nelements,
while with Mono we can create a stream of 0..1elements.
Both those types implement Publisher interface.
Both these types are lazy, which means they won’t be executed until you consume it.
