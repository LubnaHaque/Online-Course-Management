
// the teachers will see the student's information who registered his/her course

package web.cse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class My_Students
 */
@WebServlet("/My_Students")
public class My_Students extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public My_Students() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//get course code passing through the teacher home page
		String code = request.getParameter("code");
		
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            java.sql.Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/web", "root", "10101010");
	 
	           
	            String query = "SELECT * FROM course_reg WHERE CODE =?";

	            PreparedStatement ps = con.prepareStatement(query);
	 
	           
	            ps.setString(1,code);
	           
	            
	           
	           
	            ResultSet rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	String nm = rs.getString("name");
	            	String re = rs.getString("reg");
	            	String se = rs.getString("session");
	            	String em = rs.getString("email");
	            	
	            	//for passing data into the jsp file
	            	request.setAttribute("name",nm);
	            	request.setAttribute("reg",re);
	            	request.setAttribute("session",se);
	            	request.setAttribute("email",em);
	            	request.getRequestDispatcher("show_students.jsp").forward(request,response);
	            	
	            	PrintWriter out = response.getWriter();
	            	//use hidden type input to pass the data
	            	out.print("<input type = 'hidden' name = 'name' value ='<%=nm%>' id = '<%=nm%>'/>");
	            	out.print("<input type = 'hidden' name = 'reg' value ='<%=re%>' id ='<%=re%>' />");
	            	out.print("<input type = 'hidden' name = 'session' value ='<%=se%>' id ='<%=se%>'/>");
	            	out.print("<input type = 'hidden' name = 'email' value ='<%=em%>' id ='<%=em%>'/>");
	            	out.print("<p style='color:black; text-align: center;background: #DCDCDC;'>Name : "+nm+ " Reg : "+re+" Session : "+se+" Email :  "+em+"</p>");

	                
	            }
	            
	                  
	        } catch (Exception e2) {
	            System.out.println(e2);
	        }
	 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
