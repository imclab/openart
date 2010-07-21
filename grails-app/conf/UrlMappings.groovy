class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}

        "/$id" {
            controller = "view"
            action = "show"
            constraints {
                id(matches: /\d+/)
            }
        }

        "/edit/$id" {
            controller = "submit"
            action = "edit"
            constraints {
                id(matches: /\d+/)
            }
        }

        "/~$username" {
            controller = "person"
            action = "show"
            constraints {
            }
        }

        // Needed for when browsers convert ~
        "/%7E$username" {
            controller = "person"
            action = "show"
            constraints {
            }
        }

        "/tag/$id" {
            controller = "tag"
            action = "show"
            constraints {
            }
        }
        "/tags/" {
            controller = "tag"
            action = "list"
            constraints {
            }
        }

        "/issues/$id" {
            controller = "issues"
            action = "show"
            constraints {
                id(matches: /\d+/)
            }
        }

        "/th/$id" {
            controller = "theme"
            action = "show"
            constraints {
            }
        }

        "/info/$slug" {
            controller = "flatpage"
            action = "show"
            constraints {
            }
        }

		"/"(view:"/index")
		"500"(view:'/error')
        "404"(view:'/notFound')
	}
}
