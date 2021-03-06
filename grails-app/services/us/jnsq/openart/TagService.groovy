package us.jnsq.openart

class TagService {

    static transactional = true

    def tagObject(UserObject uo, String tags) {
        tags.split(/(?!(?<=\\)),/)                     // Split on a comma not followed by a '\'
        .collect { it.trim().replaceAll(/\\,/, ",") }  // Trim leading/trailing space, replace '\,' with ','
        .each {                                        // Start tagging for real
            if (it.size() > 0) { 
                uo.tags.each { uotag ->
                    if (uotag.tag == it) {
                        // Skip if we already have it tagged
                        return
                    }
                }
                def t
                if (Tag.countByTag(it) > 0) {
                    t = Tag.findByTag(it)
                } else {
                    t = new Tag(tag: it)
                    t.save(flush: true)
                }
                uo.addToTags(t).save(flush: true)
            }
        }
    }
}
