<%@ page import="de.clubi.recipe.NutritionInfo" %>



<div class="fieldcontain ${hasErrors(bean: nutritionInfoInstance, field: 'calories', 'error')} required">
	<label for="calories">
		<g:message code="nutritionInfo.calories.label" default="Calories" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="calories" value="${fieldValue(bean: nutritionInfoInstance, field: 'calories')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInfoInstance, field: 'carbohydrates', 'error')} required">
	<label for="carbohydrates">
		<g:message code="nutritionInfo.carbohydrates.label" default="Carbohydrates" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="carbohydrates" value="${fieldValue(bean: nutritionInfoInstance, field: 'carbohydrates')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInfoInstance, field: 'fat', 'error')} required">
	<label for="fat">
		<g:message code="nutritionInfo.fat.label" default="Fat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fat" value="${fieldValue(bean: nutritionInfoInstance, field: 'fat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInfoInstance, field: 'protein', 'error')} required">
	<label for="protein">
		<g:message code="nutritionInfo.protein.label" default="Protein" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="protein" value="${fieldValue(bean: nutritionInfoInstance, field: 'protein')}" required=""/>
</div>

