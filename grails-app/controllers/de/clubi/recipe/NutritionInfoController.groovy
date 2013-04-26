package de.clubi.recipe

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(["ROLE_ADMIN", "ROLE_USER"])
class NutritionInfoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [nutritionInfoInstanceList: NutritionInfo.list(params), nutritionInfoInstanceTotal: NutritionInfo.count()]
    }

    def create() {
        [nutritionInfoInstance: new NutritionInfo(params)]
    }

    def save() {
        def nutritionInfoInstance = new NutritionInfo(params)
        if (!nutritionInfoInstance.save(flush: true)) {
            render(view: "create", model: [nutritionInfoInstance: nutritionInfoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), nutritionInfoInstance.id])
        redirect(action: "show", id: nutritionInfoInstance.id)
    }

    def show(Long id) {
        def nutritionInfoInstance = NutritionInfo.get(id)
        if (!nutritionInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "list")
            return
        }

        [nutritionInfoInstance: nutritionInfoInstance]
    }

    def edit(Long id) {
        def nutritionInfoInstance = NutritionInfo.get(id)
        if (!nutritionInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "list")
            return
        }

        [nutritionInfoInstance: nutritionInfoInstance]
    }

    def update(Long id, Long version) {
        def nutritionInfoInstance = NutritionInfo.get(id)
        if (!nutritionInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (nutritionInfoInstance.version > version) {
                nutritionInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'nutritionInfo.label', default: 'NutritionInfo')] as Object[],
                        "Another user has updated this NutritionInfo while you were editing")
                render(view: "edit", model: [nutritionInfoInstance: nutritionInfoInstance])
                return
            }
        }

        nutritionInfoInstance.properties = params

        if (!nutritionInfoInstance.save(flush: true)) {
            render(view: "edit", model: [nutritionInfoInstance: nutritionInfoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), nutritionInfoInstance.id])
        redirect(action: "show", id: nutritionInfoInstance.id)
    }

    def delete(Long id) {
        def nutritionInfoInstance = NutritionInfo.get(id)
        if (!nutritionInfoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "list")
            return
        }

        try {
            nutritionInfoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'nutritionInfo.label', default: 'NutritionInfo'), id])
            redirect(action: "show", id: id)
        }
    }
}
