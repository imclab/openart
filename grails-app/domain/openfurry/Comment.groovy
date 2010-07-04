package openfurry

class Comment {
    String parentType
    String parentId
    Person owner
    Comment parentComment
    String title
    String comment
    Boolean flagged = false
    Boolean visible = true

    static constraints = {
        parentType(maxSize: 60, blank: false)
        parentId(maxSize: 60, blank: false)
        title(maxSize: 120, blank: true)
        comment(maxSize: 5000, blank: false)
    }

    static hasMany = [children: Comment]

    static belongsTo = Comment
}
