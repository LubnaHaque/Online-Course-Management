/*
 * This a servlet for admin's homepage
 * */

package web.cse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //it is a get method to get data from database
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//it is a get method to post data into database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //fetch data from input fields
        String ti = request.getParameter("title");
        String co = request.getParameter("code");
        String cr = request.getParameter("credit");
        String na = request.getParameter("name");
        String em = request.getParameter("email");
       
 
        try {
        	//database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/web", "root", "10101010");
            //insert data into admin_input table
            PreparedStatement ps = con
                    .prepareStatement("insert into admin_input values(?,?,?,?,?)");
            
            //the data will be inserted according to this serial
            ps.setString(1, ti);
            ps.setString(2, co);
            ps.setString(3, cr);
            ps.setString(4, na);
            ps.setString(5, em);
          
            //execution
            int i = ps.executeUpdate();
            //when successfully submitted those data
            if (i > 0)
            	request.getRequestDispatcher("adminhome.jsp").forward(request,response);
            //if failed to submit
            else
            	out.print("submit failed");
            
            //if exception occured
        } catch (Exception e2) {
            System.out.println(e2);
        }
       
 
        out.close();
		
		
	}

}
