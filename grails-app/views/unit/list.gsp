
<%@ page import="de.clubi.recipe.Unit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unit.label', default: 'Unit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="unit" title="${message(code: 'unit.unit.label', default: 'Unit')}" />
					
						<th><g:message code="unit.ingredient.label" default="Ingredient" /></th>
					
						<g:sortableColumn property="measurement" title="${message(code: 'unit.measurement.label', default: 'Measurement')}" />
					
						<th><g:message code="unit.recipe.label" default="Recipe" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unitInstanceList}" status="i" var="unitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "unit")}</g:link></td>
					
						<td>${fieldValue(bean: unitInstance, field: "ingredient")}</td>
					
						<td>${fieldValue(bean: unitInstance, field: "measurement")}</td>
					
						<td>${fieldValue(bean: unitInstance, field: "recipe")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unitInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
