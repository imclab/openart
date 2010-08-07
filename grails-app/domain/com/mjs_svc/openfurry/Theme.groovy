package com.mjs_svc.openfurry

class Theme {
    String name
    String description
    String style
    User creator

    static constraints = {
        name(maxSize: 30, blank: false)
        description(maxSize: 500, nullable: true)
        style(blank: false)
    }

    static mapping = {
        style type: "text"
    }

    String staticFile() {
        "theme/${id}/main.css"
    }
}