/*
 * login servlet for users
 * */

package web.cse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	//a method which can hash a text. used it to hash the users password
	public static String getSHA(String input) {

		try {

			// Static getInstance method is called with hashing SHA
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			// digest() method called
			// to calculate message digest of an input
			// and return array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);

			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}

			return hashtext;
		}

		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			System.out.println("Exception thrown" + " for incorrect algorithm: " + e);

			return null;
		}
	}
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
   
        try {
        	
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/web", "root", "10101010");
            
            
            //password is hashed before check 
            pass = getSHA(pass);
            
            //check if both email and password is correct
            String query = "SELECT * FROM users WHERE EMAIL =? AND PASSWORD =?";

            PreparedStatement ps = con.prepareStatement(query);
 
            //compared email and password
            ps.setString(1, email);
            ps.setString(2, pass);
            
            //create a session and keep the email into Email caiable
            HttpSession session=request.getSession();  
            session.setAttribute("Email",email);
           
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
            	//retrive the user's type who is trying to login
            	String t = rs.getString("type");
            	
            	if(t.equals("Student")) {
            		//if any student try to login then 
            		request.getRequestDispatcher("studenthome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("Teacher")) {
            		//if any teacher try to login then
            		request.getRequestDispatcher("teacherhome.jsp").forward(request,response);
            		
            	}
            	else if(t.equals("admin")) {
            		//if admin try to login then
            		request.getRequestDispatcher("adminhome.jsp").forward(request,response);
            		
            	}
                
            }
            //if anyone enter wrong email or password
            else {
            	out.print("Email or password doesn't match");
            }
                  
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
	}

}
