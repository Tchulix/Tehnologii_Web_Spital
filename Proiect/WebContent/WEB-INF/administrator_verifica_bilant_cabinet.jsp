<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
      <li><a href="${pageContext.request.contextPath}/pacient">Home</a></li>
<li><a href="${pageContext.request.contextPath}/admin_creeaza_doctor">
  Adauga Cont Doctor
</a></li>
<li><a href="${pageContext.request.contextPath}/admin_creeaza_secretara">
  Adauga Cont Secretara
</a></li>
<li class="active"><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_cabinet">
  Verifica Bilant Cabinet
</a></li>
<li><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_doctor">
  Verifica Bilant Doctor
</a></li>
<li><a href="${pageContext.request.contextPath}/admin_modifica_tarif">
  Modifica Tarif Programare
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
    <table class="table table-striped table-responsive-md btn-table">
    <tr>
   <th>Cabinet</th>
   <th>Bilant</th>
 </tr>
               <% 
    try{
     
     String Query = "SELECT angajat.cabinet, SUM(cost) FROM programare INNER JOIN angajat on programare.doctor_id=angajat.id GROUP BY angajat.cabinet;";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     Statement getDoctori = conn.createStatement();
     ResultSet rs = getDoctori.executeQuery(Query);
     while(rs.next()){ 
    	
		%><tr><td><%=rs.getString("cabinet") %></td><td><%=rs.getString("SUM(cost)") %></td></tr><%
    	}
    	}catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
   %>
			</table>
</body>
</html>