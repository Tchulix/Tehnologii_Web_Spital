<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="${pageContext.request.contextPath}/signup">
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
            	<td><input type="radio" name="gender" value="male">Masculin<br>
				<input type="radio" name="gender" value="female">Feminin<br>
				</td>
          	</tr>
          
          <tr>
          	<td>CNP</td>
          	<td><input type="text" name="cnp" value= "${user.cnp}" /> </td>
          </tr>
          
          <tr>
          	<td>Asigurare Medicala</td>
          	<td><input type="checkbox" name="asigurat" value="Da"></td>
          </tr>
          
            <tr>
               <td colspan ="2">
                  <input type="submit" value= "Creeaza" />
                  <a href="${pageContext.request.contextPath}/">Anuleaza</a>
               </td>
            </tr>  
      
         </table>
      </form>
</body>
</html>