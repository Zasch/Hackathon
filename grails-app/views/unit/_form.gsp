<%@ page import="de.clubi.recipe.Unit" %>



<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'unit', 'error')} required">
	<label for="unit">
		<g:message code="unit.unit.label" default="Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unit" required="" value="${unitInstance?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="unit.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${de.clubi.recipe.Ingredient.list()}" optionKey="id" required="" value="${unitInstance?.ingredient?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'measurement', 'error')} required">
	<label for="measurement">
		<g:message code="unit.measurement.label" default="Measurement" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="measurement" value="${fieldValue(bean: unitInstance, field: 'measurement')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'recipe', 'error')} required">
	<label for="recipe">
		<g:message code="unit.recipe.label" default="Recipe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="recipe" name="recipe.id" from="${de.clubi.recipe.Recipe.list()}" optionKey="id" required="" value="${unitInstance?.recipe?.id}" class="many-to-one"/>
</div>

