package de.clubi.recipe

class Picture {

    Date dateCreated
    Date lastUpdated
    def fileName

    static constraints = {
        fileName blank: false
    }
}
