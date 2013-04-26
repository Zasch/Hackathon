package de.clubi.recipe

class SecUser {

	transient springSecurityService

	String username
    String firstName
    String lastName
    String email
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static hasMany = [recipes: Recipe]

	static constraints = {
		username blank: false, unique: true
        firstName blank: false
        lastName blank: false
        email email: true, blank: false
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
