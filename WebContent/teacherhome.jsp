<!-- /* -->
<!-- This page is redirect after login a teacher. -->
<!-- It shows a teacher which courses are assigned by the admin -->
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
<nav>
<h1>OnlineCourseManagement</h1>
<section>
  <ul id = "nav">
             <li>teacher</li>
   <li><img src="teacher.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li> 
    <li><a class = "homered" href="teacherhome.jsp">My Courses</a> </li>
     <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>
<% 
String email = (String)request.getSession(false).getAttribute("Email");

try {
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/web", "root", "10101010");
    
    String query = "SELECT * FROM admin_input WHERE EMAIL =?";

    PreparedStatement ps = con.prepareStatement(query);

   
    ps.setString(1, email);
   
    ResultSet rs = ps.executeQuery();
    
   %>
   <table align="center" style="width: 1000px;line-height: 40px; background: rgba(0,0,0,0); margin-left: 150px; ">
	<tr>
		<th style="color: white;" colspan="10"><h2>My Courses</h2></th>
	</tr>

	<t><th style="color: white;">Title</th>
		<th style="color: white;">Code</th>
		<th style="color: white;">Credit</th>
		
	</t>
   
   <%
   
    
    while(rs.next()){
   	
   	 String title = rs.getString("title");
   	 String code = rs.getString("code");
   	 String credit = rs.getString("credit");
   
   	 
   	 %>
   
	
     	
	<tr style="background: #E0FFFF;">
		<td id="row" align="center"  id="row" align="center"><%=title%></td>
		<td id="row" align="center"id="row" align="center"><%=code%></td>
		<td id="row" align="center"id="row" align="center"><%=credit%></td>
  
		
	<td  id="row" align="center">	<form action="show_student" method = "post">
     	<input type = "hidden" name = "code" value = "<%=code%>" id = "<%=code%>">
     	<input style="-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;color:white;background:#A9A9A9;height:50px;" type = "submit" name ="see" value ="show students" id = "<%=title%>">
     	</form>
     </td>	
      </tr>	
		
     	
     	
     	
   	 <% 
   
    }
    %>
    </table>
    <% 
                
} catch (Exception e2) {
    System.out.println(e2);
}


%>
</body>
</html>