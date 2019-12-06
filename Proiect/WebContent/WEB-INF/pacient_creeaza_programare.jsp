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
<li class="active">
<a href="${pageContext.request.contextPath}/pacient_creeaza_programare">
Programare Online!
</a></li>
<li>
<a href="${pageContext.request.contextPath}/pacient_vizualizare_rezultate">
Vezi rezultate
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
<br><br><br>
<form method="POST" action="${pageContext.request.contextPath}/pacient_creeaza_programare">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <table border="0">
   <tr><td><label  style="margin-right: 150px">Nume doctor:</label></td><td><select name="doctorName">
   <option value="-1">Alege Doctorul</option>
               <% 
    try{
     
     String Query = "SELECT * FROM user, angajat WHERE user.user_name = angajat.user_name AND angajat.pozitie = 'doctor'";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     ResultSet rs = stm.executeQuery(Query);
     
     while(rs.next()){           
      %>
       <option value="<%=rs.getInt("id") %>"><%=rs.getString("name") %></option>
            
      <%
     }
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select></td><tr><td>Data programarii</td><td>
                
                  <select name="zi"}>
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				  <option value="11">11</option>
				  <option value="12">12</option>
				  <option value="13">13</option>
				  <option value="14">14</option>
				  <option value="15">15</option>
				  <option value="16">16</option>
				  <option value="17">17</option>
				  <option value="18">18</option>
				  <option value="19">19</option>
				  <option value="20">20</option>
				  <option value="21">21</option>
				  <option value="22">22</option>
				  <option value="23">23</option>
				  <option value="24">24</option>
				  <option value="25">25</option>
				  <option value="26">26</option>
				  <option value="27">27</option>
				  <option value="28">28</option>
				  <option value="29">29</option>
				  <option value="30">30</option>
				  <option value="31">31</option>
			</select>
          	<select name="luna"}>
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
				  <option value="11">11</option>
				  <option value="12">12</option>
			</select>
			 <select name="an">
				  <option value="2019" selected>2019</option>
				  <option value="2020">2020</option>
			</select></td></tr>
			
			<tr>
               <td colspan ="2">
                  <input type="submit" value= "Programeaza!" />
                  <a href="${pageContext.request.contextPath}/pacient">Anuleaza</a>
               </td>
            </tr>  
			
			</table>
</form>
</body>
</html>