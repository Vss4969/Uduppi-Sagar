<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Menu</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="home.css">
    </head>
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
              <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement(); %>

<div class="subbox">
                <h1>Starters</h1>
              </div>

<%
String sql1 ="SELECT food_id, food_name, price, img, food_tag FROM menu where food_type = 'starters'";

resultSet = statement.executeQuery(sql1);
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("food_name") %></h1>
                    <h2>Cost : ₹ <%=resultSet.getString("price") %></h2>
                    
                    
                    <%
if (user_name == null){%>
<form action="./signin.jsp" method="post">
                      <button class="addbtn">Add</button>
                    </form>
<%} 
  else {%>
  <form id="add" action="Addtocart" method="post">
                    <input type = "hidden" name = "food_id" value = "<%=resultSet.getString("food_id") %>" />
                    <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                      <button class="addbtn">Add</button>
                    </form>
<%}  
%>
                  </div>
                </div>
                </div>
                <% 
} %>

<div class="subbox">
                <h1>Main Course</h1>
              </div>

<%
String sql2 ="SELECT food_id, food_name, price, img, food_tag FROM menu where food_type = 'mains'";

resultSet = statement.executeQuery(sql2);
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("food_name") %></h1>
                    <h2>Cost : ₹ <%=resultSet.getString("price") %></h2>
                    
                    <%
if (user_name == null){%>
<form action="./signin.jsp" method="post">
                      <button class="addbtn">Add</button>
                    </form>
<%} 
  else {%>
  <form id="add" action="Addtocart" method="post">
                    <input type = "hidden" name = "food_id" value = "<%=resultSet.getString("food_id") %>" />
                                        <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                    
                      <button class="addbtn">Add</button>
                    </form>
<%}  
%>
                     
                  </div>
                </div>
                </div>
                <% 
} %>


<div class="subbox">
                <h1>Snacks</h1>
              </div>

<%
String sql3 ="SELECT food_id, food_name, price, img, food_tag FROM menu where food_type = 'snacks'";

resultSet = statement.executeQuery(sql3);
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("food_name") %></h1>
                    <h2>Cost : ₹ <%=resultSet.getString("price") %></h2>
                    <%
if (user_name == null){%>
<form action="./signin.jsp" method="post">
                      <button class="addbtn">Add</button>
                    </form>
<%} 
  else {%>
  <form id="add" action="Addtocart" method="post">
                    <input type = "hidden" name = "food_id" value = "<%=resultSet.getString("food_id") %>" />
                                        <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                    
                      <button class="addbtn">Add</button>
                    </form>
<%}  
%>
                     
                  </div>
                </div>
                </div>
                <% 
} %>


<div class="subbox">
                <h1>Drinks</h1>
              </div>



<%
String sql4 ="SELECT food_id, food_name, price, img, food_tag FROM menu where food_type = 'drinks'";

resultSet = statement.executeQuery(sql4);
while(resultSet.next()){
%>
              <div class="mainCard">
                <div class="card">
                  <img src="<%=resultSet.getString("img") %>" alt="img1">
                  <div class="desc">
                    <h3 style="color:<% if (resultSet.getString("food_tag").equals("V")) { %>green<% } else { %>red<% } %>"> ●⃞</h3>
                    <h1>Item : <%=resultSet.getString("food_name") %></h1>
                    <h2>Cost : ₹ <%=resultSet.getString("price") %></h2>
                    <%
if (user_name == null){%>
<form action="./signin.jsp" method="post">
                      <button class="addbtn">Add</button>
                    </form>
<%} 
  else {%>
  <form id="add" action="Addtocart" method="post">
                    <input type = "hidden" name = "food_id" value = "<%=resultSet.getString("food_id") %>" />
                                        <input type = "hidden" name = "email_id" value = "<%=email_id %>" />
                    
                      <button class="addbtn">Add</button>
                    </form>
<%}  
%>
                     
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