package de.clubi.recipe

class NutritionInfo {

    Date dateCreated
    Date lastUpdated
    Float calories
    Float carbohydrates
    Float fat
    Float protein

    static belongsTo = Ingredient

    static constraints = {
        calories nullable: false
        carbohydrates nullable: false
        fat nullable: false
        protein nullable: false
    }

    String toString() {
        "Staub hat ${calories} Kalorien"
    }
}
