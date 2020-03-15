<!-- //This is a registration page only for the student. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" type="text/css" href="style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register for student</title>
</head>
<body>
<header>
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
             
      <li>student</li>
   <li><img src="stu.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>
     <li><a class = "homered" href="choose type.jsp">Sign up</a> </li>
      <li><a class = "homeblack" href="login.jsp">Sign in</a> </li>
    <li><a class = "homeblack" href="choose type.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>
<div class = "post_items_page" >
<div class = "form"  id = "content">


<form class = "post_items_form" action="student register" method="post">
 
       <input type="text" name="name" placeholder = "Enter your name" required/><br/>
       <input type="text" name="reg" placeholder = "Enter your Registration no" required/><br/>
       <input type="text" name="dept" placeholder = "Enter your Department" required/><br/>
       <input type="text" name="session" placeholder = "Enter your Session" required/><br/>
       <input type="text" name="email"placeholder = "Enter your Email" required/><br/>
        <input type="password" name="password"placeholder = "Enter password" required/><br/>
        <input style="background: #00807359;color:white;" type="submit" value="sign up"/>
 
    </form>
    </div>
</div>
</body>
</html>