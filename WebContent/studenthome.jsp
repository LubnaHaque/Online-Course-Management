<!-- /* -->
<!-- This page is redirect after a student's login. -->
<!-- It will show a student which courses are offered by the admin -->
<!-- */ -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<header>
<nav >

<h1>OnlineCourseManagement</h1>



<section>
  <ul id = "nav">
  <li>student</li>
   <li><img src="stu.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>
    <li><a class = "homered"href="#">Home</a> </li>
    <li><a class = "homeblack"href="taken_courses.jsp">ViewCourses</a> </li>
    <li><a class = "homeblack"href="login.jsp">Logout</a> </li>
   
    
  </ul>
  </nav>
  </header>
</section>
<%

     try {
         Class.forName("com.mysql.jdbc.Driver");
         java.sql.Connection con = DriverManager.getConnection(
                 "jdbc:mysql://localhost:3306/web", "root", "10101010");

        Statement st = con.createStatement();
         String query = "SELECT * FROM admin_input";
         
         ResultSet rs = st.executeQuery(query);
         while(rs.next()){
        	
        	 String title = rs.getString("title");
        	 String code = rs.getString("code");
        	 String credit = rs.getString("credit");
        	 //String concate = code + " - "+title; 
        	 //out.print(concate);
        	 
        	 
        	 
        	 %>
        	 <div  >
<div >
        	 
        	 
        	 <form id= "form_stu_home" action="course_details.jsp">
        	 <input type="hidden" name="code" value="<%=code %>" id = "<%=code %>"/>
        	 <p id="para">Title:<%=title %></p>
        	 <p id="para">Code:<%=code %></p>
        	 <input style="height:40px; width:100px;background:white;" type = "submit" name = "view" value = "view_details" id="<%=title%>"/>
        	 </form>
        	 
        	 </div>
        	 
        	 
        	 </div>
        	 
        	 <% 
        
         }
         
         
                     
     } catch (Exception e2) {
         System.out.println(e2);
     }
     %>

</body>
</html>