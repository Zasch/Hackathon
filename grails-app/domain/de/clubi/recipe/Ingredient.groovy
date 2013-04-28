package de.clubi.recipe

class Ingredient {

    Date dateCreated
    Date lastUpdated
    String name
    NutritionInfo nutritionInfo

	static searchable = {
		root false
	}
	
    static hasMany = [pictures: Picture]
    static belongsTo = Unit

    static constraints = {
        name blank: false, nullable: false
    }

    String toString(){
        name
    }
}
