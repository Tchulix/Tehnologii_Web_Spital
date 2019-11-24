<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table border="1">
    <tr>
   <th>Pacient</th>
   <th>Doctor</th>
   <th>Data</th>
   <th>Durata</th>
   <th>Personal</th>
   <th>Ustensile</th>
 </tr>
               <% 
    try{
     
     String Query = "SELECT * FROM programare";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     Statement getPacientName = conn.createStatement();
     
     Statement getInterventie = conn.createStatement();
     ResultSet rs = stm.executeQuery(Query);
     String pacientName="";
     String doctorName="";
     
     while(rs.next()){     
         ResultSet rs4 = getInterventie.executeQuery("SELECT * FROM INTERVENTIE_CHIRURGICALA WHERE id="+rs.getInt("id")+";");
         ResultSet rs2 = getPacientName.executeQuery("SELECT name from user, pacient WHERE user.cnp = " + rs.getLong("pacient_cnp"));
         if (rs2.next())
         {
        	 Statement getDoctorName = conn.createStatement();
        	 ResultSet rs3 = getDoctorName.executeQuery("SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id=" + rs.getInt("doctor_id"));
        	 if (rs3.next())
        		 if (rs4.next()){
        	     String minute = rs4.getInt("durata_estimata")%60>9?rs4.getInt("durata_estimata")%60+"":"0"+rs4.getInt("durata_estimata")%60;
        		 String dur = rs4.getInt("durata_estimata")/60+":"+minute;
        		 pacientName = rs2.getString("name");
        		 doctorName = rs3.getString("name");%><tr><td><%=pacientName%></td><td><%=doctorName%>
        		 </td><td><%=rs.getString("data_programarii") %></td>
        		 <td><%=dur %></td><td><%=rs4.getString("personal") %></td>
        		 <td><%=rs4.getString("ustensile") %></td></tr>
        	 <%
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