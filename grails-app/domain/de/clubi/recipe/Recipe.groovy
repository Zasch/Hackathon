package de.clubi.recipe

class Recipe {

    Date lastUpdated
    Date dateCreated
    String title
    String subtitle
    String comment
    String preparation
    Integer servings = 4
    Boolean alreadyMade =false
    Boolean favorite = false
    Boolean bookmark = false
    Integer cookTime = 0
    Integer prepTime = 0

    static hasMany = [tags: Tag, units: Unit, pictures: Picture]
    static belongsTo = [SecUser]

    static constraints = {
        title blank: false, nullable: false
        subtitle blank: true, nullable: true
        preparation blank: false, nullable: false
        comment blank: false, nullable: true
        servings nullable: false
    }

    String toString(){
        title
    }
}
