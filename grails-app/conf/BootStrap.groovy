import de.clubi.recipe.SecRole
import de.clubi.recipe.SecUser
import de.clubi.recipe.SecUserSecRole

class BootStrap {

    def init = { servletContext ->

        def userRole = new SecRole(authority: "ROLE_USER").save(flush: true)
        def adminRole = new SecRole(authority: "ROLE_ADMIN").save(flush: true)

        def stefan = new SecUser(username: "stefan", password: "stefan", firstName: "Stefan", lastName: "Lindel", email: "stefan@famlindel.de", enabled: true).save(flush: true)
        def flo = new SecUser(username: "flo", password: "flo", firstName: "Florian", lastName: "Heerdegen", email: "afage@web.de", enabled: true).save(flush: true)
        def ingo = new SecUser(username: "ingo", password: "ingo", firstName: "Ingo", lastName: "Witzky", email: "ich@01fetischist.de", enabled: true).save(flush: true)
        def zasch = new SecUser(username: "zasch", password: "zasch", firstName: "Sascha", lastName: "Müller", email: "ich@sascha-mueller.net", enabled: true).save(flush: true)
        def user = new SecUser(username: "user", password: "user", firstName: "userfirst", lastName: "userlast", email: "user@user.com", enabled: true).save(flush: true)

        SecUserSecRole.create stefan, userRole, true
        SecUserSecRole.create stefan, adminRole, true
        SecUserSecRole.create ingo, userRole, true
        SecUserSecRole.create ingo, adminRole, true
        SecUserSecRole.create flo, userRole, true
        SecUserSecRole.create flo, adminRole, true
        SecUserSecRole.create zasch, userRole, true
        SecUserSecRole.create zasch, adminRole, true
        SecUserSecRole.create user, userRole, true
    }

    def destroy = {
    }
}
