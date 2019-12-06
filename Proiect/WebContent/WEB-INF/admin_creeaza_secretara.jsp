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
<li><a href="${pageContext.request.contextPath}/admin_creeaza_doctor">
  Adauga Cont Doctor
</a></li>
<li class="active"><a href="${pageContext.request.contextPath}/admin_creeaza_secretara">
  Adauga Cont Secretara
</a></li>
<li><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_cabinet">
  Verifica Bilant Cabinet
</a></li>
<li><a href="${pageContext.request.contextPath}/administrator_verifica_bilant_doctor">
  Verifica Bilant Doctor
</a></li>
<li><a href="${pageContext.request.contextPath}/admin_modifica_tarif">
  Modifica Tarif Programare
</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>
<form method="POST" action="${pageContext.request.contextPath}/admin_creeaza_secretara">
    <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <table border="0">
         
            <tr>
               <td>Nume</td>
               <td><input type="text" name="name" value= "${user.name}" /> </td>
            </tr>
         
            <tr>
               <td>User Name</td>
               <td><input type="text" name="userName" value= "${user.userName}" /> </td>
            </tr>
            
            <tr>
               <td>Email</td>
               <td><input type="text" name="email" value= "${user.email}" /> </td>
            </tr>
            
            <tr>
               <td>Parola</td>
               <td><input type="password" name="password" value= "${user.password}" /> </td>
            </tr>
            
            <tr>
            	<td>Genul</td>
            	<td><input type="radio" name="gender" value="male" checked>Masculin<br>
				<input type="radio" name="gender" value="female">Feminin<br>
				</td>
          	</tr>
          
          <tr>
          	<td>CNP</td>
          	<td><input type="text" name="cnp" value= "${user.cnp}" /> </td>
          </tr>
          
                 
          <tr>
          	<td>Cabinet</td>
          	<td><input type="text" name="cabinet" value="${user.cabinet}"></td>
          </tr>
          
          <tr>
          	<td>Data Angajarii</td>
          	<td>
          	
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
				  <option value="1980">1980</option>
				  <option value="1981">1981</option>
				  <option value="1982">1982</option>
				  <option value="1983">1983</option>
				  <option value="1984">1984</option>
				  <option value="1985">1985</option>
				  <option value="1986">1986</option>
				  <option value="1987">1987</option>
				  <option value="1988">1988</option>
				  <option value="1989">1989</option>
				  <option value="1990">1990</option>
				  <option value="1991">1991</option>
				  <option value="1992">1992</option>
				  <option value="1993">1993</option>
				  <option value="1994">1994</option>
				  <option value="1995">1995</option>
				  <option value="1996">1996</option>
				  <option value="1997">1997</option>
				  <option value="1998">1998</option>
				  <option value="1999">1999</option>
				  <option value="2000">2000</option>
				  <option value="2001">2001</option>
				  <option value="2002">2002</option>
				  <option value="2003">2003</option>
				  <option value="2004">2004</option>
				  <option value="2005">2005</option>
				  <option value="2006">2006</option>
				  <option value="2007">2007</option>
				  <option value="2008">2008</option>
				  <option value="2009">2009</option>
				  <option value="2010">2010</option>
				  <option value="2011">2011</option>
				  <option value="2012">2012</option>
				  <option value="2013">2013</option>
				  <option value="2014">2014</option>
				  <option value="2015">2015</option>
				  <option value="2016">2016</option>
				  <option value="2017">2017</option>
				  <option value="2018">2018</option>
				  <option value="2019" selected>2019</option>
				  <option value="2020">2020</option>
			</select>
          	</td>
          </tr>
          
          
            <tr>
               <td colspan ="2">
                  <input type="submit" value= "Creeaza" />
                  <a href="${pageContext.request.contextPath}/">Renunta</a>
               </td>
            </tr>  
      
         </table>
      </form>
</body>
</html>