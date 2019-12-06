<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      
<div class="container">
<br>  <p class="text-center"></p>
<hr>

<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">Login</h4>
	<form method="POST" action="${pageContext.request.contextPath}/login">
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input class="form-control" placeholder="Username/email" type="text" name="userName" value= "${user.userName}" />
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="password" value= "${user.password}" class="form-control" placeholder="Password" type="password">
    </div> <!-- form-group// -->                                    
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block">Login</button>
    </div> <!-- form-group// -->    
    <p class="text-center">Don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign up</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->      
      
      
      
      
</body>
</html>