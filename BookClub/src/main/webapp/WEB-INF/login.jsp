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
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   
</head>
<body>
	<h1>Book Club</h1>
	
	<p>A place for friends to share thoughts on books.</p>
	
	<p>Need to register? Click <a href="/register">here.</a>
	
	<div>
		<h1>Login</h1>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<form:label path="email">Email: </form:label>
			<form:errors path="email"/>
			<form:input path="email"/>
			<form:label path="password">Password: </form:label>
			<form:errors path="password"/>
			<c:out value="${message}"/>
			<form:password path="password"/>
			<input type='submit' value='Submit'/>
	</form:form>
	</div>
	
</body>
</html>