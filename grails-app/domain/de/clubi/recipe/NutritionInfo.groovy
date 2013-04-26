package de.clubi.recipe

class NutritionInfo {

    Date dateCreated
    Date lastUpdated
    def calories
    def carbohydrates
    def fat
    def protein

    static belongsTo = [Ingredient]

    static constraints = {

    }
}
