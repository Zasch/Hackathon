package de.clubi.recipe

class Picture {

    Date dateCreated
    Date lastUpdated
    String fileName

    static constraints = {
        fileName blank: false
    }
}
