package de.clubi.recipe

class Unit {

    Float measurement
    String unit
    Recipe recipe
    Ingredient ingredient

    static constraints = {
        unit nullable: false, blank: false
    }

    String toString(){
        "$measurement $unit"
    }
}
