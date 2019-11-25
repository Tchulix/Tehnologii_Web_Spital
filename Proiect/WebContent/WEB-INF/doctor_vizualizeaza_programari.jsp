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
<form method="POST" action="${pageContext.request.contextPath}/doctor_completeaza_fisa_consult">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
    <select>
               <% 
    try{
     
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     String Query = "SELECT * FROM programare where doctor_id = '" + request.getAttribute("doctor_id")+"'";
     ResultSet rs = stm.executeQuery(Query);

     
     while(rs.next()){      
         String query2 = "SELECT name FROM user WHERE cnp =" + rs.getString("pacient_cnp");
         Statement getPacienti = conn.createStatement();
         ResultSet rs2 = getPacienti.executeQuery(query2);
         if (rs2.next()){
      %>
       <option value="<%=rs.getInt("id") %>"><%=rs2.getString("name") %></option>
            
      <%
         }
         }
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select>
</form>
</body>
</html>
