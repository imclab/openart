package us.jnsq.openart

class MessagingTagLib {
    
    static namespace = "of"

    def messagingService

    def authenticateService

    def messagesForUser = { attrs ->
        out << messagingService.userTransientMessages(authenticateService.principal().domainClass).collect {
            "<div class=\"${grailsApplication.config.openart.user.messageTypes.repr[it.type]}\">${message(code: it.code, default: it.defaultMessage, args: [it.argument])}</div>"
        }.join("")
    }
}
