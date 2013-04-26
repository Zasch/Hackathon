package de.clubi.recipe

class Ingredient {

    Date dateCreated
    Date lastUpdated
    String name

    static hasMany = [pictures: Picture]

    static constraints = {
        name blank: false, nullable: false
    }
}
