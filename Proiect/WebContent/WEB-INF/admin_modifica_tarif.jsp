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
      <li><a href="${pageContext.request.contextPath}/pacient">Home</a></li>
<li><a href="${pageContext.request.contextPath}/admin_creeaza_doctor">
  Adauga Cont Doctor
</a></li>
<li><a href="${pageContext.request.contextPath}/admin_creeaza_secretara">
  Adauga Cont Secretara
</a></li>
<li><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_cabinet">
  Verifica Bilant Cabinet
</a></li>
<li><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_doctor">
  Verifica Bilant Doctor
</a></li>
<li class="active"><a href="${pageContext.request.contextPath}/admin_modifica_tarif">
  Modifica Tarif Programare
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
<form method="POST" action="${pageContext.request.contextPath}/admin_modifica_tarif">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
    <select name="progId">
               <% 
    try{
     
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     String Query = "SELECT * FROM programare";
     ResultSet rs = stm.executeQuery(Query);

     
     while(rs.next()){           
      %>
       <option value="<%=rs.getInt("id") %>"><%="ID: "+rs.getInt("id")+" - Cost: "+rs.getString("cost") %></option>
            
      <%
         }
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select><input type="text" name="valNoua" value= "${programare.cost}"/>
                <input type="submit" value= "Modifica Tarif" />
                <a href="${pageContext.request.contextPath}/">Anuleaza</a>
</form>
</body>
</html>