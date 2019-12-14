<%@page import="java.sql.*"%>
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
      <li><a href="${pageContext.request.contextPath}/secretara">Home</a></li>
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
<li class="active"><a href="${pageContext.request.contextPath}/secretara_verifica_bilant_doctori">
  Verifica Bilant Doctor
</a></li>
<li><a href="${pageContext.request.contextPath}/secretara_vezi_fisa_consult">
  Vezi Fisa Consult
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
<table class="table table-striped table-responsive-md btn-table">
    <tr>
   <th>Doctor</th>
   <th>Bilant</th>
 </tr>
               <% 
    try{
     
     String Query = "SELECT user.name, SUM(cost) FROM programare INNER JOIN angajat on programare.doctor_id=angajat.id INNER JOIN user ON angajat.user_name = USER.user_name GROUP BY angajat.id;";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     Statement getDoctori = conn.createStatement();
     ResultSet rs = getDoctori.executeQuery(Query);
     while(rs.next()){ 
    	
		%><tr><td><%=rs.getString("name") %></td><td><%=rs.getString("SUM(cost)") %></td></tr><%
    	}
    	}catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
   %>
			</table>

</body>
</html>