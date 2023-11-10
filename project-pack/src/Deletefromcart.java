


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
 * Servlet implementation class Deletefromcart
 */
@WebServlet("/Deletefromcart")
public class Deletefromcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Deletefromcart() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String order_id = request.getParameter("order_id");
		String email = "vss@gmail.com";


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/RMS"; //MySQL URL and followed by the database name
 		String username = "restaurant"; //MySQL username
 		String password = "udupi"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		
 		
 		
 		
		//Prepared Statement to add book data
		
		PreparedStatement st = con.prepareStatement("delete from orders where order_id = ?");
		st.setString(1,order_id);

		
		int result=st.executeUpdate();
		System.out.println(order_id);
		//Checks if insert is successful.If yes,then redirects to AddResult.jsp page 
		if(result>0)
		{
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}

