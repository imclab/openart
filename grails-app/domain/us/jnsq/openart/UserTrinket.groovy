package us.jnsq.openart

class UserTrinket {
    String name
    OAUser userFrom
    OAUser owner
    Trinket trinket
    Date dateCreated

    static constraints = {
        name(maxSize: 120, blank: true, nullable: true)
        userFrom(nullable: true)
    }
}
