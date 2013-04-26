<%@ page import="de.clubi.recipe.Recipe" %>



<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="recipe.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="title" cols="40" rows="5" maxlength="255" required="" value="${recipeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'subtitle', 'error')} ">
    <label for="subtitle">
        <g:message code="recipe.subtitle.label" default="Subtitle"/>

    </label>
    <g:textArea name="subtitle" cols="40" rows="5" maxlength="1023" value="${recipeInstance?.subtitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'preparation', 'error')} required">
    <label for="preparation">
        <g:message code="recipe.preparation.label" default="Preparation"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="preparation" cols="40" rows="5" maxlength="100000" required="" value="${recipeInstance?.preparation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'comment', 'error')} ">
    <label for="comment">
        <g:message code="recipe.comment.label" default="Comment"/>

    </label>
    <g:textArea name="comment" cols="40" rows="5" maxlength="100000" value="${recipeInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'servings', 'error')} required">
    <label for="servings">
        <g:message code="recipe.servings.label" default="Servings"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="servings" from="${1..999}" class="range" required="" value="${fieldValue(bean: recipeInstance, field: 'servings')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'alreadyMade', 'error')} ">
    <label for="alreadyMade">
        <g:message code="recipe.alreadyMade.label" default="Already Made"/>

    </label>
    <g:checkBox name="alreadyMade" value="${recipeInstance?.alreadyMade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'ingredients', 'error')} ">
    <label for="ingredients">
        <g:message code="recipe.ingredients.label" default="Ingredients"/>

    </label>
    <g:select name="ingredients" from="${de.clubi.recipe.Ingredient.list()}" multiple="multiple" optionKey="id" size="5" value="${recipeInstance?.ingredients*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'picturs', 'error')} ">
    <label for="picturs">
        <g:message code="recipe.picturs.label" default="Picturs"/>

    </label>
    <g:select name="picturs" from="${de.clubi.recipe.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${recipeInstance?.picturs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'tags', 'error')} ">
    <label for="tags">
        <g:message code="recipe.tags.label" default="Tags"/>

    </label>
    <g:select name="tags" from="${de.clubi.recipe.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${recipeInstance?.tags*.id}" class="many-to-many"/>
</div>
