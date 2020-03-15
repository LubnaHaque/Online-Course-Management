/*
 * this servlet will show  to retrive the student's information.
 * when a student register any course
 * */

package web.cse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
;

/**
 * Servlet implementation class Course_Registration
 */
@WebServlet("/Course_Registration")
public class Course_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Course_Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 PrintWriter out = response.getWriter();
		 
		 
		 //data retrived from hidden types input pass through   student home page 
         String co = request.getParameter("code");
		 String ti = request.getParameter("title");
		 String cr = request.getParameter("credit");
		 
		 //using session get the current user's email
		 String email = (String)request.getSession(false).getAttribute("Email");
		 
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	            java.sql.Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/web", "root", "10101010");
	 
	            //retrive the information from student table of the current user
	            String query = "SELECT * FROM student WHERE EMAIL =?";

	            PreparedStatement ps = con.prepareStatement(query);
	 
	           
	            ps.setString(1, email);
	           
	            
	           
	           
	            ResultSet rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	//retrive data
	            	String nm = rs.getString("name");
	            	String re = rs.getString("reg");
	            	String se = rs.getString("session");
	            	String em = rs.getString("email");
	            	
	            	
	            	try {
	                   
	                  
	                   //insert those retrive data into course_reg table
	                    PreparedStatement ps2= con
	                            .prepareStatement("insert into course_reg values(?,?,?,?,?,?,?)");
	                    
	                    ps2.setString(1, co);
	                    ps2.setString(2, ti);
	                    ps2.setString(3, nm);
	                    ps2.setString(4, re);
	                    ps2.setString(5, se);
	                    ps2.setString(6, em);
	                    ps2.setString(7, cr);
	                    
	         
	                    int i = ps2.executeUpdate();
	                    if (i > 0)
	                    	request.getRequestDispatcher("studenthome.jsp").forward(request,response);
	                    else
	                    	out.print("Registration Failled!");
	                }catch (Exception e2) {
	                    System.out.println(e2);
	                }
	            	
	            	
	                
	            }
	            
	                  
	        } catch (Exception e2) {
	            System.out.println(e2);
	        }
	 
	        out.close();
	}

}
