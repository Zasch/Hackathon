package de.clubi.recipe

class Tag {

    Date dateCreated
    Date lastUpdated
    String name

	static searchable = {
		root false
	}
	
    static constraints = {
        name blank: false, nullable: false, maxSize: 50
    }

    String toString(){
        name
    }
}
