
<%@ page import="de.clubi.recipe.Recipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="picture" title="${message(code: 'recipe.picture.label', default: 'Picture')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'recipe.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="subtitle" title="${message(code: 'recipe.subtitle.label', default: 'Subtitle')}" />
					
						<g:sortableColumn property="preparation" title="${message(code: 'recipe.preparation.label', default: 'Preparation')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'recipe.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="servings" title="${message(code: 'recipe.servings.label', default: 'Servings')}" />
					
						<g:sortableColumn property="alreadyMade" title="${message(code: 'recipe.alreadyMade.label', default: 'Already Made')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><img src="${createLinkTo(dir: "images/Rezeptbilder", file: recipeInstance.pictures.first().fileName)}" alt="bild" width="150"/></td>
                        %{--<td></td>--}%
					
						<td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: recipeInstance, field: "subtitle")}</td>
					
						<td>${fieldValue(bean: recipeInstance, field: "preparation")}</td>
					
						<td>${fieldValue(bean: recipeInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: recipeInstance, field: "servings")}</td>
					
						<td><g:formatBoolean boolean="${recipeInstance.alreadyMade}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
