<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="${pageContext.request.contextPath}/doctor_vizualizeaza_programari">
<input type="hidden" name="redirectId" value="${param.redirectId}" />
<input type="submit" value= "Verifica Programari" />
 <a href="${pageContext.request.contextPath}/">Anuleaza</a></form>
</body>
</html>
