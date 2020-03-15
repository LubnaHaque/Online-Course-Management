 
<!-- this is a page which will give you two options to choose user's type student or teache.  -->
<!-- It is a page before sign up -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose your type</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header>
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
             
    <li><a class = "homered" href="choose type.jsp">Sign up</a> </li>
    <li><a class = "homeblack" href="login.jsp">Sign in</a> </li>
    
  </ul>
  

</nav>
</header>
</section>
<div class = "post_items_page" >
<div class = "form"  id = "content">



<form class ="post_items_form" action="choose" method="post">
          <img src="logo3.png" style="height: 155px;width: 155px; margin-left: 5px;margin-bottom: 20px ; border-radius: 50%;float :center;"><br>
        <input style="background: #00807359;color:white;" type="submit" value="Register as a Teacher" formaction="teacher register.jsp"/><br>
        <input style="background: #00807359;color:white;" type="submit" value="Register as a Student" formaction="student register.jsp"/>
 
    </form>
    
    </div>
</div>

</body>
</html>