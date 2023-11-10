


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class Orderfood
 */
@WebServlet("/Orderfood")
public class Orderfood extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Orderfood() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String email = request.getParameter("email_id");
		java.util.Date date = new java.util.Date();
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("dd/MMM/yyyy");
	    String strValue = String.valueOf( ft.format(dNow) );


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/RMS"; //MySQL URL and followed by the database name
 		String username = "restaurant"; //MySQL username
 		String password = "udupi"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		System.out.println(ft.format(dNow));
 		
 		
 		
 		
		//Prepared Statement to add book data
 		PreparedStatement st = con.prepareStatement("update orders set status = 1, time = ? where email_id = ? and status=0");
		st.setString(1,strValue);
 		st.setString(2,email);
		int result=st.executeUpdate();
		System.out.println(result);
		//Checks if insert is successful.If yes,then redirects to AddResult.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("./cart.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

		
		
	
	}


}

