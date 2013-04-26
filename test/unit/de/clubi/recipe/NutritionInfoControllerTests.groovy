package de.clubi.recipe



import org.junit.*
import grails.test.mixin.*

@TestFor(NutritionInfoController)
@Mock(NutritionInfo)
class NutritionInfoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nutritionInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nutritionInfoInstanceList.size() == 0
        assert model.nutritionInfoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nutritionInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nutritionInfoInstance != null
        assert view == '/nutritionInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nutritionInfo/show/1'
        assert controller.flash.message != null
        assert NutritionInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nutritionInfo/list'

        populateValidParams(params)
        def nutritionInfo = new NutritionInfo(params)

        assert nutritionInfo.save() != null

        params.id = nutritionInfo.id

        def model = controller.show()

        assert model.nutritionInfoInstance == nutritionInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nutritionInfo/list'

        populateValidParams(params)
        def nutritionInfo = new NutritionInfo(params)

        assert nutritionInfo.save() != null

        params.id = nutritionInfo.id

        def model = controller.edit()

        assert model.nutritionInfoInstance == nutritionInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nutritionInfo/list'

        response.reset()

        populateValidParams(params)
        def nutritionInfo = new NutritionInfo(params)

        assert nutritionInfo.save() != null

        // test invalid parameters in update
        params.id = nutritionInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nutritionInfo/edit"
        assert model.nutritionInfoInstance != null

        nutritionInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nutritionInfo/show/$nutritionInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nutritionInfo.clearErrors()

        populateValidParams(params)
        params.id = nutritionInfo.id
        params.version = -1
        controller.update()

        assert view == "/nutritionInfo/edit"
        assert model.nutritionInfoInstance != null
        assert model.nutritionInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nutritionInfo/list'

        response.reset()

        populateValidParams(params)
        def nutritionInfo = new NutritionInfo(params)

        assert nutritionInfo.save() != null
        assert NutritionInfo.count() == 1

        params.id = nutritionInfo.id

        controller.delete()

        assert NutritionInfo.count() == 0
        assert NutritionInfo.get(nutritionInfo.id) == null
        assert response.redirectedUrl == '/nutritionInfo/list'
    }
}
