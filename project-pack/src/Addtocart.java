


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

/**
 * Servlet implementation class Addtocart
 */
@WebServlet("/Addtocart")
public class Addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Addtocart() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String food_id = request.getParameter("food_id");
		String email_id = request.getParameter("email_id");


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/RMS"; //MySQL URL and followed by the database name
 		String username = "restaurant"; //MySQL username
 		String password = "udupi"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println(email_id);
 		
 		
 		
 		
		//Prepared Statement to add book data
 		PreparedStatement st = con.prepareStatement("insert into orders(email_id, food_id, status) values( ?,?, 0)");
		st.setString(1,email_id);
		st.setString(2,food_id);
		
		int result=st.executeUpdate();
		System.out.println(email_id+food_id);
		//Checks if insert is successful.If yes,then redirects to AddResult.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("./menu.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

		
		
	
	}


}

