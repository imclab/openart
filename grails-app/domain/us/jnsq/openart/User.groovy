package us.jnsq.openart

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

/**
 * User domain class.
 */
class User {
	String username
	String userRealName
    String title
    String avatar = ",default.png"
	String passwd
	String pass = '[secret]'
	boolean enabled
	String email
    String profile
    Species species
    License preferedLicense
    Integer memberType = CH.config.openart.user.types.lurker
    Integer memberClass = CH.config.openart.user.classes.bronze
    Integer maxViewableRating = CH.config.openart.ratings.low
    Integer preferedTheme
    Long interactionCount = 1 // for joining
    Long pennies = 10
    Integer warningLevel = 0
    Date watchlistCursorUltimate = new Date()
    Date watchlistCursorPenultimate = new Date()
    Date watchlistCursorBookmark
    Date watchlistCursorBookmarkDate
    Boolean commissionStatus = false
    Boolean tradeStatus = false
    Boolean giftStatus = false

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: true)
        title(blank: true, nullable: true)
		passwd(blank: false)
		enabled()
        profile(blank: true, nullable: true)
        preferedLicense(nullable: true)
        memberType(range: 0..9)
        memberClass(range: 0..4)
        maxViewableRating(range: 0..2)
        preferedTheme(nullable: true)
        pennies()
        warningLevel(min: 0, max: 100)
        watchlistCursorUltimate(nullable: true)
        watchlistCursorPenultimate(nullable: true)
        watchlistCursorBookmark(nullable: true)
        watchlistCursorBookmarkDate(nullable: true)
    }

    static mapping = {
        table 'auth_user'
        profile type: "text"
	}

	static transients = ['pass']
	static hasMany = [
        authorities: Role, 
        votes: IssueVote, 
        userObjects: UserObject, 
        likes: UserObject,
        favorites: UserObject,
        friends: User,
        watches: User,
        watchedTags: Tag,
        comments: Comment, 
        statuses: UserStatus,
        groups: UserGroup,
        messages: UserMessage,
        props: UserProperty,
        trinkets: UserTrinket,
    ]
	static belongsTo = Role
    static mappedBy = [trinkets: 'owner', messages: 'userTo']

    String toString() {
        "${this.userRealName} (~${this.username})"
    }
}
