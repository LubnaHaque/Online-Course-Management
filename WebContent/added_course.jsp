

<!-- /* -->
<!-- This page will show the admin which courses are added by him/her. -->
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
             <li>admin</li>
   <li><img src="admin.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li> 
    <li><a class = "homeblack" href="adminhome.jsp">Add Courses</a> </li>
    <li><a class = "homered" href="#">Submitted Courses</a> </li>
     <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>
<% 

try {
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/web", "root", "10101010");
    
    String query = "SELECT * FROM admin_input ";

    PreparedStatement ps = con.prepareStatement(query);

   
    
   
    ResultSet rs = ps.executeQuery();
    
   %>
   <table align="center" style="width: 80%;line-height: 40px; background: rgba(0,0,0,0.3); margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;">
	<tr>
		<th style ="color:white"colspan="10"><h2>Already Submitted Courses</h2></th>
	</tr>

	<t><th style="border: 1px solid black; background: #00807359;border-radius: 10px;color:white;">Title</th>
		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color:white;">Code</th>
		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color:white;">Credit</th>
		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color:white;">Teacher's Name</th>
		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color:white;">Teacher's Email</th>
		
	</t>
   <%
    
    while(rs.next()){
   	
   	 String title = rs.getString("title");
   	 String code = rs.getString("code");
   	 String credit = rs.getString("credit");
   	 String name = rs.getString("name");
   	 String email = rs.getString("email");
   
   	 
   	 %>
   
   	    	<tr>
		<td style=" border: 1px solid black;color : white;" id="row" align="center"  id="row" align="center"><%=title%></td>
		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=code%></td>
		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=credit%></td>
		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=name%></td>
		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=email%></td>
  
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
