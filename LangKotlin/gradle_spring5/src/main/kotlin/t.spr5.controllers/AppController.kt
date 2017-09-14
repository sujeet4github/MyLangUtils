package t.spr5.controllers

import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.concurrent.atomic.AtomicLong
import java.time.Instant
import t.spr5.resources.comment.*
import t.spr5.resources.greeting.*

@RestController
class AppController {

    val counter = AtomicLong()

    @RequestMapping("/")
    fun index() = "This is home!"

    @RequestMapping("/comment")
    fun getComment() : Comment {
        val comment = Comment(
            author = "codebeast",
            content = "codebeast loves kotlin",
            created = Instant.now()
        )
        return comment
    }

    @RequestMapping(
        value   = "/comment",
        method  = arrayOf(RequestMethod.POST))
    fun createComment(@RequestBody newComment: NewComment) : Comment {
        val comment = Comment(
            author = newComment.author,
            content = newComment.content,
            created = Instant.now()
        )
        return comment
    }

    @GetMapping("/greeting")
    fun greeting(@RequestParam(value = "name", defaultValue = "World") name: String) =
            Greeting(counter.incrementAndGet(), "Hello, $name")

}
