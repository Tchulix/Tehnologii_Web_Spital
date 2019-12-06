<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
<ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/secretara">Home</a></li>
<li>
<a href="${pageContext.request.contextPath}/secretara_creeaza_programare">
  Adauga o Programare
</a></li>
<li><a href="${pageContext.request.contextPath}/secretara_modifica_programare">
  Modifica o Programare
</a></li>
<li><a href="${pageContext.request.contextPath}/secretara_creeaza_interventie">
  Programeaza o interventie chirurgicala
</a></li>
<li>
<a href="${pageContext.request.contextPath}/secretara_vizualizeaza_interventii">
  Vizualizeaza interventii chirurgicale
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
</body>
</html>