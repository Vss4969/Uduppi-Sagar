


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
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String usernm = request.getParameter("usernm");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String img = "/home/vss4969/Documents/DBIS/Assignment-6/Project-2/DBIS Project/Media/profilepic.png";
		String address = request.getParameter("address");


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/RMS"; //MySQL URL and followed by the database name
 		String username = "restaurant"; //MySQL username
 		String password = "udupi"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		
 		
 		PreparedStatement sp = con .prepareStatement("select * from users where email_id = ? ");
 		sp.setString(1,email);
		ResultSet res=sp.executeQuery();
		if(!res.next()) {
		//Prepared Statement to add book data
		PreparedStatement st = con.prepareStatement("insert into users values(?, ?,?,?, ?, ?)");
 		st.setString(1,usernm);
		st.setString(2,passwd);
		st.setString(3,email);
		st.setString(4,phone);
		st.setString(5,img);
		st.setString(6,address);
		int result=st.executeUpdate();
		System.out.println(usernm+passwd);
		//Checks if insert is successful.If yes,then redirects to AddResult.jsp page 
		if(result>0)
		{
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
			rd.forward(request, response);
		}
		}
		
		else {
			HttpSession session = request.getSession();
 			session.setAttribute("check" ,"Error! Email already exists");
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}

