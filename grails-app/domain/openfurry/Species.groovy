package openfurry

class Species {
    String speciesName
    Species parent

    static constraints = {
        speciesName(maxSize: 60, blank: false)
        parent(blank: true, nullable: true)
    }

    static hasMany = [subSpecies: Species, users: Person]

    static belongsTo = Species
}
