package t.spr5.resources.comment

import java.time.Instant
import com.fasterxml.jackson.annotation.JsonCreator

typealias AuthorNameType    = String
typealias ContentString     = String

data class Comment (
    val author: AuthorNameType,
    val content: ContentString,
    val created: Instant
)

data class NewComment @JsonCreator constructor(
    val author: AuthorNameType,
    val content: ContentString
)