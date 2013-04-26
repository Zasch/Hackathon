package de.clubi.recipe

class Recipe {

    Date lastUpdated
    Date dateCreated
    String title
    String subtitle
    String comment
    String preparation
    Integer servings
    Boolean alreadyMade

    static hasMany = [tags: Tag, ingredients: Ingredient, picturs: Picture]
    static belongsTo = [SecUser]

    static constraints = {
        title blank: false, nullable: false, maxSize: 255
        subtitle blank: true, nullable: true, maxSize: 1023
        preparation blank: false, nullable: false, maxSize: 100000
        comment blank: false, nullable: true, maxSize: 100000
        servings range: 1..999, nullable: false
    }

    String toString(){
        title
    }
}
