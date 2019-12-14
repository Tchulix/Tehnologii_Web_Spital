<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<li>
<a href="${pageContext.request.contextPath}/pacient_vizualizare_programari">
Vezi Programari
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
        	 %>
        	<div class="container">
  <h2>Aceasta programare va avea loc in viitor, deci nu se pot vedea inca rezultatele.</h2>
</div> 
        	  <%
         }
         else{
    	 boolean isConsult = false;
			Statement checkIsConsult = conn.createStatement();
			ResultSet rs2 = checkIsConsult.executeQuery("SELECT * FROM CONSULT WHERE id="+request.getAttribute("programare_id"));
			String doctorName = "";
			if (rs2.next())
				isConsult = true;
			if (isConsult == true)
			{%>
			<table class="table table-striped table-responsive-md btn-table">
<tr>
<th>Doctor</th>
<th>Data</th>
<th>Diagnostic</th>
<th>Trimitere</th>
<th>Medicamente</th>
<th>Cost</th></tr><%

			Statement getConsult = conn.createStatement();
			ResultSet rs4 = getConsult.executeQuery("SELECT * FROM CONSULT WHERE id="+rs.getInt("id")+";");
			Statement getDoctorName = conn.createStatement();
			ResultSet rs3 = getDoctorName.executeQuery("SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id=" + rs.getInt("doctor_id"));
			if (rs3.next()){
				if (rs4.next()){

					 doctorName = rs3.getString("name");%><tr><td><%=doctorName%>
					 </td><td><%=rs.getString("data_programarii") %></td>
					 <td><%=rs4.getString("diagnostic") %></td><td><%=rs4.getString("trimitere_catre") %></td>
					 <td><%=rs4.getString("medicamente") %></td><td><%=rs.getInt("cost") %></td></tr><%
				}
			}
			

}
			else
			{
				%> <table class="table table-striped table-responsive-md btn-table">
    <tr>
   <th>Doctor</th>
   <th>Data</th>
   <th>Durata</th>
   <th>Personal</th>
   <th>Ustensile</th>
   <th>Cost</th>
 </tr><%
				Statement getInterventie = conn.createStatement();
				ResultSet rs4 = getInterventie.executeQuery("SELECT * FROM INTERVENTIE_CHIRURGICALA WHERE id="+rs.getInt("id")+";");
		        Statement getDoctorName = conn.createStatement();
		        ResultSet rs3 = getDoctorName.executeQuery("SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id=" + rs.getInt("doctor_id"));
				if (rs3.next()){
					if (rs4.next()){
		        	     String minute = rs4.getInt("durata_estimata")%60>9?rs4.getInt("durata_estimata")%60+"":"0"+rs4.getInt("durata_estimata")%60;
		        		 String dur = rs4.getInt("durata_estimata")/60+":"+minute;
		        		 doctorName = rs3.getString("name");%><tr><td><%=doctorName%>
		        		 </td><td><%=rs.getString("data_programarii") %></td>
		        		 <td><%=dur %></td><td><%=rs4.getString("personal") %></td>
		        		 <td><%=rs4.getString("ustensile") %></td><td><%=rs.getInt("cost") %></td></tr><%
					}
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