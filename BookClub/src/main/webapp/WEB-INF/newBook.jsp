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
    <title>Book Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
</head>
<body>
	<h1>Add a Book to Your Shelf!</h1>
	<a href="/books">back to the shelves</a>
	
	<form:form action="/add" method="post" modelAttribute="newBook">
		<form:hidden value="${currentUser.id}" path="owner"/>
		<form:label path="title">Title: </form:label>
		<form:errors path="title"/>
		<form:input path="title"/>
		<form:label path="author">Author: </form:label>
		<form:errors path="author"/>
		<form:input path="author"/>
		<form:label path="thoughts">My Thoughts: </form:label>
		<form:errors path="thoughts"/>
		<form:textarea path="thoughts"/>
		<input type='submit' value='Create'/>
	</form:form>

</body>
</html>