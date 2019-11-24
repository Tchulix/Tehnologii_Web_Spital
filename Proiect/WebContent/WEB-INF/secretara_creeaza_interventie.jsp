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
<br><br><br>
<form method="POST" action="${pageContext.request.contextPath}/secretara_creeaza_interventie">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <table border="0">
  <tr>
  	<td><label  style="margin-right: 150px">Nume pacient:</label></td>
  	<td><select name="pacientName"> 
   <option value="-1">Alege Pacientul</option>
               <% 
    try{
     
     String Query = "SELECT * FROM user, pacient WHERE user.cnp = pacient.cnp";
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     
     ResultSet rs = stm.executeQuery(Query);
     
     while(rs.next()){           
      %>
       <option value="<%=rs.getLong("cnp") %>"><%=rs.getString("name") %></option>
            
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
			 <tr><td><label  style="margin-right: 150px">Durata estimata:</label></td><td>
            <select name="ore">
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
				   <select name="minute">
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
				  <option value="32">32</option>
				  <option value="33">33</option>
				  <option value="34">34</option>
				  <option value="35">35</option>
				  <option value="36">36</option>
				  <option value="37">37</option>
				  <option value="38">38</option>
				  <option value="39">39</option>
				  <option value="40">40</option>
				  <option value="41">41</option>
				  <option value="42">42</option>
				  <option value="43">43</option>
				  <option value="44">44</option>
				  <option value="45">45</option>
				  <option value="46">46</option>
				  <option value="47">47</option>
				  <option value="48">48</option>
				  <option value="49">49</option>
				  <option value="50">50</option>
				  <option value="51">51</option>
				  <option value="52">52</option>
				  <option value="53">53</option>
				  <option value="54">54</option>
				  <option value="55">55</option>
				  <option value="56">56</option>
				  <option value="57">57</option>
				  <option value="58">58</option>
				  <option value="59">59</option>
				  
				  
			</select>
			</td></tr>
			<tr>
          	<td>Cost</td>
          	<td><input type="text" name="cnp" value= "${user.cnp}" /> </td>
          </tr>
			 <tr>
               <td>Personal</td>
               <td><input type="text" name="personal" value=""/> </td>
            </tr>
             <tr>
               <td>Ustensile</td>
               <td><input type="text" name="ustensile" value="" /> </td>
            </tr>
			
			<tr>
               <td colspan ="2">
                  <input type="submit" value= "Programeaza!" />
                  <a href="${pageContext.request.contextPath}/secretara">Anuleaza</a>
               </td>
            </tr>  
			
			</table>
</form>
</body>
</html>