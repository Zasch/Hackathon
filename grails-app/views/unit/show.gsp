
<%@ page import="de.clubi.recipe.Unit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unit.label', default: 'Unit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unit">
			
				<g:if test="${unitInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="unit.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${unitInstance}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unitInstance?.ingredient}">
				<li class="fieldcontain">
					<span id="ingredient-label" class="property-label"><g:message code="unit.ingredient.label" default="Ingredient" /></span>
					
						<span class="property-value" aria-labelledby="ingredient-label"><g:link controller="ingredient" action="show" id="${unitInstance?.ingredient?.id}">${unitInstance?.ingredient?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${unitInstance?.measurement}">
				<li class="fieldcontain">
					<span id="measurement-label" class="property-label"><g:message code="unit.measurement.label" default="Measurement" /></span>
					
						<span class="property-value" aria-labelledby="measurement-label"><g:fieldValue bean="${unitInstance}" field="measurement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unitInstance?.recipe}">
				<li class="fieldcontain">
					<span id="recipe-label" class="property-label"><g:message code="unit.recipe.label" default="Recipe" /></span>
					
						<span class="property-value" aria-labelledby="recipe-label"><g:link controller="recipe" action="show" id="${unitInstance?.recipe?.id}">${unitInstance?.recipe?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${unitInstance?.id}" />
					<g:link class="edit" action="edit" id="${unitInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
