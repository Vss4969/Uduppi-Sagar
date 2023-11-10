<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>HomePage</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="home.css">
    </head>
    <body>
    
<%@page import="java.util.*"%>

 <%
 String user_name = (String)session.getAttribute("user_name");
 String email_id = (String)session.getAttribute("email_id");
 System.out.println(user_name);
 System.out.println(email_id);
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

<%
if (user_name == null){%>
<%} 
  else {%>
<%}  
%>
      
      
      
    </div>
  </header>
  <section class="banner">
    <div class="left">
      <h1>A <span>taste</span> you'll remember.</h1>
      <h2>Where every&nbsp;<span>flavor</span>&nbsp;tells a&nbsp;<span>story</span>.</h2>
      <div class="buttons">
        <form action="./menu.jsp" method="post">
          <button class="btn-secondary" onclick="submit">View Menu</button>
        </form>
        
        <%
if (user_name == null){%>
<form action="./signin.jsp" method="post">
          <button class="btn-secondary" onclick="submit">Your Orders</button>
        </form>
<%} 
  else {%>
  <form action="./allorders.jsp" method="post">
          <button class="btn-secondary" onclick="submit">Your Orders</button>
        </form>
<%}  
%>
        
        
        
      </div>
     <p></p>
    </div>
    <div class="right">
      <img src="" alt="">
    </div>
  </section>
  <section class="cards">
    <div class="mainCard">
      <div class="card">
        <img src="./Media/pizza.png" alt="img1">
      </div>
      <div class="card">
        <img src="./Media/biryani.png" alt="img1">
      </div>
      <div class="card">
        <img src="./Media/burger.png" alt="img1">
      </div>
    </div>
  </section>
    <script>
        // alert("Pending")

const toggle = document.querySelector(".toggle");
toggle.onclick = () => {
  document.body.classList.toggle("active");
}
    </script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="" async defer></script>
    </body>
</html>