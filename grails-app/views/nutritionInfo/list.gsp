
<%@ page import="de.clubi.recipe.NutritionInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nutritionInfo.label', default: 'NutritionInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-nutritionInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-nutritionInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="calories" title="${message(code: 'nutritionInfo.calories.label', default: 'Calories')}" />
					
						<g:sortableColumn property="carbohydrates" title="${message(code: 'nutritionInfo.carbohydrates.label', default: 'Carbohydrates')}" />
					
						<g:sortableColumn property="fat" title="${message(code: 'nutritionInfo.fat.label', default: 'Fat')}" />
					
						<g:sortableColumn property="protein" title="${message(code: 'nutritionInfo.protein.label', default: 'Protein')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'nutritionInfo.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'nutritionInfo.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nutritionInfoInstanceList}" status="i" var="nutritionInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nutritionInfoInstance.id}">${fieldValue(bean: nutritionInfoInstance, field: "calories")}</g:link></td>
					
						<td>${fieldValue(bean: nutritionInfoInstance, field: "carbohydrates")}</td>
					
						<td>${fieldValue(bean: nutritionInfoInstance, field: "fat")}</td>
					
						<td>${fieldValue(bean: nutritionInfoInstance, field: "protein")}</td>
					
						<td><g:formatDate date="${nutritionInfoInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${nutritionInfoInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nutritionInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
