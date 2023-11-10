<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Orders</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="home.css">
    </head>
    <body>
    <%@page import="java.util.*"%>

 <%
 String user_name = (String)session.getAttribute("user_name");
 System.out.println(user_name);
  String email_id = (String)session.getAttribute("email_id");
 %>
        <header>
            <div class="left">
              <h1 class="logo">Uduppi<span>Sagar.</span></h1>
              <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
              </div>
            </div>
            <div class="right">
              <ul>
                <a href="./home.jsp"><li>Home</li></a>
                <a href="./menu.jsp"><li>Menu</li></a>
                <a href="./aboutus.jsp"><li>About Us</li></a>
              </ul>
                    <%
if (user_name == null){%>
<a href="./signin.jsp">
        <ion-icon class="cart" name="cart-outline"></ion-icon>
      </a>
<%} 
  else {%>
  <a href="./cart.jsp">
        <ion-icon class="cart" name="cart-outline"></ion-icon>
      </a>
<%}  
%>
      
      
      

<%   if (user_name == null){%>
      
      <form action="./signup.jsp" method="post">
        <button class="btn" onclick="submit">Sign Up/Login</button>
      </form>
      
<%} 
  else {%>
  
  <form action="Logoutservlet" method="post">
        <%=user_name%><button class="btn" onclick="submit">Logout</button>
      </form>
      
<%}  
%>
            </div>
          </header>
          <div>
            <div class="box">
              <h1>Menu</h1>
            </div>
            <section class="cards">

              <div class="subbox">
                <h1>Your Orders</h1>
              </div>
              
              <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "RMS";
String userId = "restaurant";
String password = "udupi";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
PreparedStatement st = null;
ResultSet resultSet = null;
%>


<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
st = connection.prepareStatement("select menu.food_tag, orders.time, menu.img, orders.order_id, menu.food_name, menu.price from menu, orders where menu.food_id = orders.food_id and orders.status = 1 and orders.email_id = ?");
st.setString(1,email_id);
resultSet=st.executeQuery();
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("menu.img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("menu.food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("menu.food_name") %></h1>
                    <h2>Cost : ₹ <%=resultSet.getString("menu.price") %></h2>
                    <h3>Bought on : <span><%=resultSet.getString("orders.time") %></span>
                    </h3>
                  </div>
                </div>
              </div>
              
              

<% 
} %>

<%
} catch (Exception e) {
e.printStackTrace();
}
%>
            </section>
          </div>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="" async defer></script>
        <script src="" async defer></script>
    </body>
</html>