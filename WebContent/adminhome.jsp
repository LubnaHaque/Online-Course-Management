<!-- /*  -->
<!-- This page is admin's home page. when the admin will login, then they will redirect this page. -->
<!--  which page will show admin to add course and assign course teache -->
<!--  */ -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header>
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
        <li>admin</li>
   <li><img src="admin.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>     
    <li><a class = "homered" href="adminhome.jsp">Add Courses</a> </li>
    <li><a class = "homeblack" href="added_course.jsp">Submitted Courses</a> </li>
     <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>


<div class = "post_items_page" >
<div class = "form"  id = "content">
<form class = "post_items_form" action="admin" method="post">
     <input type="text" name="title" placeholder = "Enter Course Title"  required><br>
     <input type="text" name="code" placeholder = "Enter Course Code"  required><br>
     <select name="credit" id = "select_id"  required>
            <option>choose course credit </option >
            <option>1</option >
            <option>1.5</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            
        </select> <br/>
    <input type="text" name="name" placeholder = "Assign Teacher" required><br>
     <input type="text" name="email" placeholder = "Enter Course Teacher's Email " required><br>
     
     <input type="submit" value="add to course">
</form>
</div>
</div>
</body>
</html>