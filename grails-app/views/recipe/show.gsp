
<%@ page import="de.clubi.recipe.Recipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipe">
			
				<g:if test="${recipeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="recipe.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${recipeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.subtitle}">
				<li class="fieldcontain">
					<span id="subtitle-label" class="property-label"><g:message code="recipe.subtitle.label" default="Subtitle" /></span>
					
						<span class="property-value" aria-labelledby="subtitle-label"><g:fieldValue bean="${recipeInstance}" field="subtitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.preparation}">
				<li class="fieldcontain">
					<span id="preparation-label" class="property-label"><g:message code="recipe.preparation.label" default="Preparation" /></span>
					
						<span class="property-value" aria-labelledby="preparation-label"><g:fieldValue bean="${recipeInstance}" field="preparation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="recipe.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${recipeInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.servings}">
				<li class="fieldcontain">
					<span id="servings-label" class="property-label"><g:message code="recipe.servings.label" default="Servings" /></span>
					
						<span class="property-value" aria-labelledby="servings-label"><g:fieldValue bean="${recipeInstance}" field="servings"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.alreadyMade}">
				<li class="fieldcontain">
					<span id="alreadyMade-label" class="property-label"><g:message code="recipe.alreadyMade.label" default="Already Made" /></span>
					
						<span class="property-value" aria-labelledby="alreadyMade-label"><g:formatBoolean boolean="${recipeInstance?.alreadyMade}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="recipe.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${recipeInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="recipe.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${recipeInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.pictures}">
				<li class="fieldcontain">
					<span id="pictures-label" class="property-label"><g:message code="recipe.pictures.label" default="Pictures" /></span>
					
						<g:each in="${recipeInstance.pictures}" var="p">
                            <img src="${createLinkTo(dir: "images/Rezeptbilder", file: p.fileName)}" alt="Bild" />
						    %{--<span class="property-value" aria-labelledby="pictures-label">--}%
                                %{--<g:link controller="picture" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>--}%
                            %{--</span>--}%
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="recipe.tags.label" default="Tags" /></span>
					
						<g:each in="${recipeInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.units}">
				<li class="fieldcontain">
					<span id="units-label" class="property-label"><g:message code="recipe.units.label" default="Units" /></span>
					
						<g:each in="${recipeInstance.units}" var="u">
						<span class="property-value" aria-labelledby="units-label"><g:link controller="unit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recipeInstance?.id}" />
					<g:link class="edit" action="edit" id="${recipeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
