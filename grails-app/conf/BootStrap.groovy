import sun.management.counter.Units;
import de.clubi.recipe.Ingredient
import de.clubi.recipe.NutritionInfo
import de.clubi.recipe.Recipe;
import de.clubi.recipe.SecRole
import de.clubi.recipe.SecUser
import de.clubi.recipe.SecUserSecRole
import de.clubi.recipe.Tag
import de.clubi.recipe.Unit

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
		
		new Recipe(title: "Rezept#1", servings: 8, preparation: "fertig!").save(flush:true)
		def nutrInf = new NutritionInfo(calories: 500, protein: 12, carbohydrates: 2, fat: 999).save(flush:true)
		def ing = new Ingredient(name: "Zitrone", nutritionInfo: nutrInf).save(flush:true)
		def thetag = new Tag(name: "lecker").save(flush:true)
		def cakeRecipe = new Recipe(title: "Kuchen-Rezept", servings: 8, preparation: "fertig!", tags:[thetag]).save(flush:true)
		def num = new Unit(ingredient: ing, measurement: 50, unit: "Messerspitzen", recipe: cakeRecipe).save(flush:true)
		
    }

    def destroy = {
    }
}
