package de.clubi.recipe

class Tag {

    Date dateCreated
    Date lastUpdated
    String name

    static constraints = {
        name blank: false, nullable: false, maxSize: 50
    }
}
