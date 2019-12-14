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
<li>
<a href="${pageContext.request.contextPath}/pacient_creeaza_programare">
Programare Online!
</a></li>
<li class="active">
<a href="${pageContext.request.contextPath}/pacient_vizualizare_programari">
Vezi Programari
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>

<div class="container container-table">
<form method="GET" action="${pageContext.request.contextPath}/pacient_vizualizare_rezultate">


<div class="container register-form">
            <div class="form">
                <div class="note">
                    <p>Acestea sunt programarile dumneavoastra (Doctor - Data):</p>
                </div>

                <div class="form-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                    <select name="progId" class="form-control" data-style="btn-primary" multiple>
               <% 
    try{
     
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     String Query = "SELECT * FROM programare where pacient_cnp = '" + request.getAttribute("pacient_cnp")+ "'" + " ORDER BY data_programarii ";
     ResultSet rs = stm.executeQuery(Query);
	Statement stm2 = conn.createStatement();
     
     while(rs.next()){      
         String query2 = "SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id= " + rs.getString("doctor_id");
         ResultSet rs2 = stm2.executeQuery(query2);
         if (rs2.next()){
      %>
       <option value="<%=rs.getInt("id") %>"><%=rs2.getString("name")+ " - " + rs.getString("data_programarii") %></option>
            
      <%
         }
         }
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btnSubmit">Vezi rezultatele programarii</button>
                </div>
            </div>
        </div>
</form>
</div>


</body>
</html>