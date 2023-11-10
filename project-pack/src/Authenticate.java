


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Authenticate() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		System.out.println(email + passwd);

		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/RMS"; //MySQL URL and followed by the database name
 		String username = "restaurant"; //MySQL username
 		String password = "udupi"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		
 		
 		PreparedStatement st = con.prepareStatement("select user_name, email_id from users where email_id = ? and password = ?");
 		st.setString(1,email);
 		st.setString(2,passwd);
 		
 		ResultSet res = st.executeQuery();
 		System.out.println(email + passwd);


 		

 		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
 		if (res.next()){
 			HttpSession session = request.getSession();
 			session.setAttribute("user_name" ,res.getString("user_name"));
 			session.setAttribute("email_id" ,res.getString("email_id"));
 			System.out.println("Authentication Successful");
 			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
 			rd.forward(request, response);
 			}
 			else {
 			System.out.println("Authentication Not Successful");
 			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp") ;
 			rd.forward(request, response);
 			}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}
	}
}
