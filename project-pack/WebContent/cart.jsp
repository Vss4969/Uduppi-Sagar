<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cart</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="home.css">
    </head>
    <style>
        
      .checkoutbox {
          position: absolute;
          right:    100px;
          bottom:   50px;
          width: max-content;
          margin: 0 auto;
          background: rgba(255,255,255,0.5);
          padding: 15px;
          border: 2px solid #fff;
          background-clip: padding-box;
          text-align: center;
      
      }
      
      .button {
        font-size: 1em;
        padding: 10px;
        color: orange;
        border: 2px solid #06D85F;
        text-decoration: none;
        cursor: pointer;
        transition: all 0.3s ease-out;
      }
      .button:hover {
        background: #06D85F;
      }
      
      .overlay {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.7);
        transition: opacity 500ms;
        visibility: hidden;
        opacity: 0;
      }
      .overlay:target {
        visibility: visible;
        opacity: 1;
      }
      
      .popup {
        margin: 70px auto;
        padding: 20px;
        background: white;
        border-radius: 5px;
        width: 30%;
        position: relative;
        transition: all 5s ease-in-out;
      }
      
      .popup h2 {
        margin-top: 0;
        color: #333;
        font-family: Tahoma, Arial, sans-serif;
      }
      .popup .close {
        position: absolute;
        top: 20px;
        right: 30px;
        transition: all 200ms;
        font-size: 30px;
        font-weight: bold;
        text-decoration: none;
        color: #333;
      }
      .popup .close:hover {
        color: #06D85F;
      }
      .popup .content {
        max-height: 30%;
        overflow: auto;
      }
      
      @media screen and (max-width: 700px){
        .checkoutbox{
          width: 70%;
        }
        .popup{
          width: 70%;
        }
      }
          </style>
    <body>
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
              <%@page import="java.util.*"%>
              <%
 String user_name = (String)session.getAttribute("user_name");
 System.out.println(user_name);
  String email_id = (String)session.getAttribute("email_id");
 %>
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
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "RMS";
String userId = "restaurant";
String password = "udupi";
String curruser = "vss@gmail.com";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>


<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement(); %>

<%
String sql ="select menu.food_tag, menu.img, orders.order_id, menu.food_name, menu.price from menu, orders where menu.food_id = orders.food_id and orders.status = 0";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("menu.img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("menu.food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("menu.food_name") %></h1>
                    <h2>Cost : <%=resultSet.getString("menu.price") %></h2>
                    <form id="delete" action="Deletefromcart" method="post">
                    <input type = "hidden" name = "order_id" value = "<%=resultSet.getString("orders.order_id") %>" />
                    <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                      <button class="removebtn">Delete</button>
                    </form>
                  </div>
                </div>
              </div>
              
              

<% 
} %>


<%
String sql2 ="select sum(menu.price) from menu, orders where menu.food_id = orders.food_id and orders.status = 0";
resultSet = statement.executeQuery(sql2);
while(resultSet.next()){
%>
              </section>
          </div>
          <div class="checkoutbox">
            <a class="button" href="#popup1">Proceed to Checkout</a>
        </div>
        
        <!-- <div id="popup1" class="overlay">
            <div class="popup">
                <h2>Confirm your Order</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    Your total bill = <b style="color:black;">₹ <%=resultSet.getString("sum(menu.price)") %></b>
                </div>
            </div>
        </div> -->
        
        <div id="popup1" class="overlay">
            <div class="popup">
                <h2>Proceed to Checkout</h2>
                <a class="close" href="#">&times;</a>
                <div class="content">
                    <br>
                    <p>
                      Your Total Cost is : <b style="color:black;">₹ <%=resultSet.getString("sum(menu.price)") %></b>
                      <br>
                      <form action="Orderfood" method="post" class="payment">
                        Select payment method :
                        <select name="paymentmethod">
                          <option value="COD">Cash on Delivery</option>
                          <option value="comingsoon">-- More options available soon --</option>
                        </select>
                        <br>
                        <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                        <input type="submit" value="Confirm Order">
                      </form>
                    </p>
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
              
            
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="" async defer></script>
        <script src="" async defer></script>
    </body>
</html>