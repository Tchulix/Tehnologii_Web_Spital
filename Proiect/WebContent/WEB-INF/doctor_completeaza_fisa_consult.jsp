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
      <li><a href="${pageContext.request.contextPath}/doctor">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/doctor_vizualizeaza_programari">Vizualizeaza programari</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
<form method="POST" action="${pageContext.request.contextPath}/doctor_completeaza_fisa_consult">
    <input type="hidden" name="progId" value="<%=request.getAttribute("programare_id")%>" />
    <table class="table table-striped table-responsive-md btn-table">
    
               <% 
    try{
     
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     String Query = "SELECT * FROM programare where id = '" + request.getAttribute("programare_id")+"' AND data_programarii = DATE(CURDATE()) ";
     ResultSet rs = stm.executeQuery(Query);

     
     while(rs.next()){      
         String query2 = "SELECT name FROM user WHERE cnp =" + rs.getString("pacient_cnp");
         Statement getPacienti = conn.createStatement();
         ResultSet rs2 = getPacienti.executeQuery(query2);
         if (rs2.next()){
      %>
       <tr>
               <td>Nume Pacient</td>
               <td><%=rs2.getString("name") %> </td>
       </tr>
       <tr>
               <td>Data Programarii</td>
               <td><%=rs.getString("data_programarii") %> </td>
       </tr>
       <tr>
               <td>Diagnostic</td>
               <td><input type="text" name="diagnostic" value= "${consult.diagnostic}" /> </td>
       </tr>
       <tr>
               <td>Trimitere</td>
               <td><input type="text" name="trimitere" value= "${consult.trimitere}" /> </td>
       </tr>
       <tr>
               <td>Medicamente</td>
               <td><input type="text" name="medicamente" value= "${consult.medicamente}" /> </td>
       </tr>
       <tr>
               <td>Cost</td>
               <td><input type="text" name="cost" value= "${programare.cost}" /> </td>
       </tr>
      <%
         }
     }
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
     </table>
    <input type="submit" value= "Completeaza Fisa Consult" />
</form>
</body>
</html>