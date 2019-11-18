<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Titlu </title>
</head>

<body>
<br><br><br>
<form method="POST" action="${pageContext.request.contextPath}/secretara_modifica_programare">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <table border="0">
  <tr>
  	<td><label  style="margin-right: 150px">Alege programarea:</label></td>
  	<td><select name="programareName"> 
   <option value="-1">Alege Pacientul</option>
               <% 
    try{
     
     String Query = "SELECT * FROM programare";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     Statement getPacientName = conn.createStatement();
     
     ResultSet rs = stm.executeQuery(Query);
     
     String pacientName="";
     String doctorName="";
     
     while(rs.next()){           
         ResultSet rs2 = getPacientName.executeQuery("SELECT name from user, pacient WHERE user.cnp = " + rs.getLong("pacient_cnp"));
         if (rs2.next())
         {
        	 Statement getDoctorName = conn.createStatement();
        	 ResultSet rs3 = getDoctorName.executeQuery("SELECT name FROM user INNER JOIN angajat ON user.user_name=angajat.user_name WHERE angajat.id=" + rs.getInt("doctor_id"));
        	 if (rs3.next())
        	 {
        		 pacientName = rs2.getString("name");
        		 doctorName = rs3.getString("name");
        	 }
         }
         
         String mesaj = pacientName + " " + doctorName + " " + rs.getString("data_programarii");
      
      %>
       <option value="<%=rs.getInt("id") %>"><%=mesaj %></option>
            
      <%
     }
     
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select>
                </td>
              </tr>
   
			<tr>
               <td colspan ="2">
                  <input type="submit" name="Modifica" value= "Modifica" />
               </td>
            </tr>  
            			<tr>
               <td colspan ="2">
                  <input type="submit" name="Sterge" value= "Sterge" />
                  <a href="${pageContext.request.contextPath}/secretara">Anuleaza</a>
               </td>
            </tr>  
			
			</table>
</form>
</body>
</html>