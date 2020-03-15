<!-- /* -->
<!-- This page will show a course details means the course information. -->
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
  <li>student</li>
   <li><img src="stu.png" style="height: 30px;width: 30px; margin:right;margin_top :0px"></li>
             <li><a class = "homeblack"href="studenthome.jsp">Home</a> </li>
    <li><a class = "homeblack" href="taken_courses.jsp">View Courses</a> </li>
     <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
    
  </ul>

</nav>

</header>
</section>
 <% String code = request.getParameter("code"); 
  
 try {
     Class.forName("com.mysql.jdbc.Driver");
     java.sql.Connection con = DriverManager.getConnection(
             "jdbc:mysql://localhost:3306/web", "root", "10101010");

    
     String query = "SELECT  * FROM admin_input WHERE code =?";

     PreparedStatement ps = con.prepareStatement(query);

    
     ps.setString(1, code);
    
    
    
     ResultSet rs = ps.executeQuery();
     %>
     <table align="center" style="width: 80%;line-height: 40px; background: rgba(0,0,0,0.3); margin-left: 100px;  margin-bottom: 50px;margin-top: 50px;">
  	<tr>
  		<th style ="color : white;" colspan="10"><h2>Course Info</h2></th>
  	</tr>

  	<t><th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Title</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Code</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Credit</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Teacher's Name</th>
  		<th style="border: 1px solid black; background: #00807359;border-radius: 10px;color : white;">Teacher's Email</th>
  		
  	</t>
     
     <%
     while(rs.next()) {
     	String ti = rs.getString("title");
     	String co = rs.getString("code");
     	String nm = rs.getString("name");
     	String em = rs.getString("email");
     	String cr = rs.getString("credit");
     	
     	
     	%>
        
    	
     	
    	<tr>
    		<td style=" border: 1px solid black;color : white;" id="row" align="center"  id="row" align="center"><%=ti%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=co%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=cr%></td>
           <td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=nm%></td>
    		<td  style=" border: 1px solid black;color : white;" id="row" align="center"id="row" align="center"><%=em%></td>
    		
    	<td style=" " id="row" align="center">	
      	<form action="take2 " method = "post">
     	<input type = "hidden" name = "code" value = <%=co%>>
     	<input type = "hidden" name = "title" value = <%=ti%>>
     	<input type = "hidden" name = "credit" value = <%=cr%>>
     	<input style="-webkit-border-radius: 50px;-moz-border-radius: 50px;border-radius: 50px;color:white;background:#A9A9A9;height:50px;" type = "submit" name ="register" value = "register">
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

 out.close();
 %>
 
 
</body>
</html>