<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
    <table border="1">
    <tr>
   <th>Cabinet</th>
   <th>Bilant</th>
 </tr>
               <% 
    try{
     
     String Query = "SELECT * FROM angajat WHERE pozitie='doctor'";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     Statement getDoctori = conn.createStatement();
     ResultSet rs = getDoctori.executeQuery(Query);
     String pacientName="";
     String doctorName="";
     List<Integer> listaDoctori = new ArrayList<>();
     Map<String, List<Integer>> lista = new HashMap<String, List<Integer>>();
     while(rs.next()){ 
    	 listaDoctori = new ArrayList<>();
    	 if (lista.get(rs.getString("cabinet")).size() == 0)
    	 {
    		 listaDoctori.add(rs.getInt("id"));
    	 }
    	 else
    	 {
    		 listaDoctori = lista.get(rs.getString("cabinet"));
    		 listaDoctori.add(rs.getInt("id"));
    	 }
        lista.put(rs.getString("cabinet"),listaDoctori);
      }
     for(Map.Entry<String, List<Integer>> entry : lista.entrySet()) {
    	 listaDoctori = entry.getValue();
    	 int bilant = 0;
    	 for (int i=0;i<listaDoctori.size();i++){
    	 String Query2 = "SELECT COST FROM PROGRAMARE WHERE DOCTOR_ID = " + listaDoctori.get(i);
    	 Statement getProgramari = conn.createStatement();
    	 ResultSet rs2 = getProgramari.executeQuery(Query2);
    	 while (rs2.next()){
    		 bilant += rs2.getInt("cost");}
    	 }
		%><tr><td><%=entry.getKey() %></td><td><%=bilant %></td></tr><%
    	}
    	}catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
   %>
			</table>
</body>
</html>