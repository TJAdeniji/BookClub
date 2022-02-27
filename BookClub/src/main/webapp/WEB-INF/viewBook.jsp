<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Dojo</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<h1><c:out value="${book.title}"/></h1>
	<a href="/books">back to the shelves</a>
	
	<h2><c:out value="${book.owner.name}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/> </h2>
	
	<p>Here are <c:out value="${book.owner.name}"/>'s thoughts:</p>
	<hr>
	<c:out value="${book.thoughts}"/>
	<hr>
	
	<c:choose>
		<c:when test="${sessionScope.userID == book.owner.id}">
			<a href="/books/${book.id}/edit">Edit</a>
		</c:when>
	</c:choose>
	

</body>
</html>