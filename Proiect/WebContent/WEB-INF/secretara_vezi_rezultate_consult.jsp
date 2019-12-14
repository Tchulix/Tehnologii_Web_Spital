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


            <% 
    try{
     
     String Query = "SELECT * FROM programare WHERE id = " + request.getAttribute("programare_id");
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     ResultSet rs = stm.executeQuery(Query);
     java.util.Date date = new java.util.Date();
     if (rs.next()){
         java.util.Date progData = rs.getDate("data_programarii");
         if (progData.after(date)==true) {
        	 %> <div class="container">
  <h2>Aceasta programare va avea loc in viitor, deci nu se pot vedea inca rezultatele.</h2>
</div> <%
         }
         else{
			Statement checkIsConsult = conn.createStatement();
			ResultSet rs2 = checkIsConsult.executeQuery("SELECT * FROM CONSULT WHERE id="+request.getAttribute("programare_id"));
			String doctorName = "";
			if (rs2.next()){
%>
			<table class="table table-striped table-responsive-md btn-table">
<tr>
<th>Doctor</th>
<th>Data</th>
<th>Diagnostic</th>
<th>Trimitere</th>
<th>Medicamente</th></tr><%

			Statement getDoctorName = conn.createStatement();
			ResultSet rs3 = getDoctorName.executeQuery("SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id=" + rs.getInt("doctor_id"));
			if (rs3.next()){
				

					 doctorName = rs3.getString("name");%><tr><td><%=doctorName%>
					 </td><td><%=rs.getString("data_programarii") %></td>
					 <td><%=rs2.getString("diagnostic") %></td><td><%=rs2.getString("trimitere_catre") %></td>
					 <td><%=rs2.getString("medicamente") %></td></tr><%
				
			}
			

}
        	 }
         }
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
   %>
			</table>

</body>
</html>