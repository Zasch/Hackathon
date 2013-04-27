
<%@ page import="de.clubi.recipe.NutritionInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nutritionInfo.label', default: 'NutritionInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nutritionInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nutritionInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nutritionInfo">
			
				<g:if test="${nutritionInfoInstance?.calories}">
				<li class="fieldcontain">
					<span id="calories-label" class="property-label"><g:message code="nutritionInfo.calories.label" default="Calories" /></span>
					
						<span class="property-value" aria-labelledby="calories-label"><g:fieldValue bean="${nutritionInfoInstance}" field="calories"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInfoInstance?.carbohydrates}">
				<li class="fieldcontain">
					<span id="carbohydrates-label" class="property-label"><g:message code="nutritionInfo.carbohydrates.label" default="Carbohydrates" /></span>
					
						<span class="property-value" aria-labelledby="carbohydrates-label"><g:fieldValue bean="${nutritionInfoInstance}" field="carbohydrates"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInfoInstance?.fat}">
				<li class="fieldcontain">
					<span id="fat-label" class="property-label"><g:message code="nutritionInfo.fat.label" default="Fat" /></span>
					
						<span class="property-value" aria-labelledby="fat-label"><g:fieldValue bean="${nutritionInfoInstance}" field="fat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInfoInstance?.protein}">
				<li class="fieldcontain">
					<span id="protein-label" class="property-label"><g:message code="nutritionInfo.protein.label" default="Protein" /></span>
					
						<span class="property-value" aria-labelledby="protein-label"><g:fieldValue bean="${nutritionInfoInstance}" field="protein"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInfoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="nutritionInfo.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${nutritionInfoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInfoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="nutritionInfo.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${nutritionInfoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${nutritionInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${nutritionInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
