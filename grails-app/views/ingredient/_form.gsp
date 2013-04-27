<%@ page import="de.clubi.recipe.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'nutritionInfo', 'error')} required">
	<label for="nutritionInfo">
		<g:message code="ingredient.nutritionInfo.label" default="Nutrition Info" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nutritionInfo" name="nutritionInfo.id" from="${de.clubi.recipe.NutritionInfo.list()}" optionKey="id" required="" value="${ingredientInstance?.nutritionInfo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'pictures', 'error')} ">
	<label for="pictures">
		<g:message code="ingredient.pictures.label" default="Pictures" />
		
	</label>
	<g:select name="pictures" from="${de.clubi.recipe.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${ingredientInstance?.pictures*.id}" class="many-to-many"/>
</div>

