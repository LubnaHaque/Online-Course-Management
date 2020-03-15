<!-- ?* -->
<!-- This page will show the teacher which students have registered the course. -->
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
    <li><a class = "homeblack" href="teacherhome.jsp">My Courses</a> </li>
    <li><a class = "homeblack" href="login.jsp">Logout</a> </li>
    
  </ul>

</nav>
</header>
</section>

<form action="student" method = "post">
 
 <table align="center" style="width: 1000px;line-height: 40px; background: rgba(0,0,0,0); margin-left: 150px; ">
	<tr>
		<th style="color: white;" colspan="10" ><h2>Student's Record</h2></th>
	</tr>
	<t><th style="color: white;">Name</th>
		<th style="color: white;">Registration No</th>
		<th style="color: white;">Session</th>
		<th style="color: white;">Email ID</th>
		
	</t>
 <%
 String code = request.getParameter("code");
	
 try {
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/web", "root", "10101010");

       
        String query = "SELECT distinct * FROM course_reg WHERE CODE =?";

        PreparedStatement ps = con.prepareStatement(query);

       
        ps.setString(1,code);
       
        
       
       
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()) {
        	String nm = rs.getString("name");
        	String re = rs.getString("reg");
        	String se = rs.getString("session");
        	String em = rs.getString("email");
        	%>
        	
        	<tr style="background: #E0FFFF;">
    		<td  id="row" align="center"><%=nm %></td>
    		<td  id="row" align="center"><%=re %></td>
    		<td  id="row" align="center"><%=se %></td>
    		<td  id="row" align="center"><%=em%></td>
    		</tr>
      
            <% 
        }
        
              
    } catch (Exception e2) {
        System.out.println(e2);
    }




 %>
	</table>
	
	
</form>
</body>
</html>