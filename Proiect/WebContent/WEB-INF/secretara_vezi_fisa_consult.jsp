<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Titlu </title>
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
<li ><a href="${pageContext.request.contextPath}/secretara_modifica_programare">
  Modifica o Programare
</a></li>
<li><a href="${pageContext.request.contextPath}/secretara_creeaza_interventie">
  Programeaza o interventie chirurgicala
</a></li>
<li>
<a href="${pageContext.request.contextPath}/secretara_vizualizeaza_interventii">
  Vizualizeaza interventii chirurgicale
</a></li>
<li><a href="${pageContext.request.contextPath}/secretara_verifica_bilant_doctori">
  Verifica Bilant Doctor
</a></li>
<li class="active"><a href="${pageContext.request.contextPath}/secretara_vezi_fisa_consult">
  Vezi Fisa Consult
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>


<div class="container container-table">
<form method="GET" action="${pageContext.request.contextPath}/secretara_vezi_rezultate_consult">
<div class="container register-form">
            <div class="form">
                <div class="note">
                    <p>Vezi programari (Pacient - Doctor - Data):</p>
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
     String Query = "SELECT * FROM programare INNER JOIN consult ON programare.id = consult.id ORDER BY pacient_cnp ";
     ResultSet rs = stm.executeQuery(Query);
	Statement stm2 = conn.createStatement();
     Statement stm3 = conn.createStatement();
     while(rs.next()){      
         String query2 = "SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id= " + rs.getString("doctor_id");
         ResultSet rs2 = stm2.executeQuery(query2);
         if (rs2.next()){
        	 String query3 = "SELECT name FROM user WHERE cnp= " + rs.getLong("pacient_cnp");
             ResultSet rs3 = stm3.executeQuery(query3);
        	 if (rs3.next()){
      %>
       <option value="<%=rs.getInt("id") %>"><%=rs3.getString("name") + " - " + rs2.getString("name")+ " - " + rs.getString("data_programarii") %></option>
            
      <%
        	 }
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
                    <button type="submit" class="btnSubmit">Vezi rezultatele consultului</button>
                </div>
            </div>
        </div>
</form>
</div>


</body>
</html>