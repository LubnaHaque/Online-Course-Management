<!-- ?* -->
<!-- This is a login page for all types(admin,teacher,student) of  users. -->
<!-- */ -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<header>
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
             
    <li><a class = "homeblack" href="choose type.jsp">Sign up</a> </li>
    <li><a class = "homered" href="login.jsp">Sign in</a> </li>
    
  </ul>

</nav>
</header>
</section>
<div class = "post_items_page" >
<div class = "form"  id = "content">



<form class = "post_item_forms" action="login" method="post">
 
        <input type="text" name="email" placeholder = "Enter Your Email" /><br/>
        <input type="password" name="password" placeholder = "Enter password"/><br/>
        <input style="background: #00807359;color:white;" type="submit" value="login"/>
 
    </form>
    
    </div>

</div>

</body>
</html>