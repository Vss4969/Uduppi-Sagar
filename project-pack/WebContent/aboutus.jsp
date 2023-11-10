<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>About Us</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="header.css">
    </head>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600);
      @import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
      @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap');

:root{
  --primary: orange;
}

::selection{
  background: var(--primary);
}

*{
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  line-height: 1.5;
  transition: all .3s ease-in-out;
  font-family: "Josefin Sans", Arial;
}

body{
    color: rgb(210, 210, 210);
  background: #fff;
  background-image: url(./Media/Home.png);
  background-size: 100%;
  background-clip: padding-box;
}

a{
    text-decoration: none;
    color:black;
}

body::before{
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: -1;
  content: "";
  position: absolute;
  background: linear-gradient(0deg, var(--primary), #fff);
  clip-path: circle(50% at right 0%);
}
      .Procard {
        font-family: 'Open Sans', Arial, sans-serif;
        position: relative;
        overflow: hidden;
        margin: 10px;
        min-width: 230px;
        max-width: 315px;
        height: 430px;
        color: #ffffff;
        text-align: center;
        line-height: 1.4em;
        background-color: #141414;
        position: relative;
        display:inline-block;
        animation: animatebottom 0.4s
      }
      .Procard * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: all 0.25s ease;
        transition: all 0.25s ease;
      }
      .Procard .background {
        width: 100%;
        vertical-align: top;
        opacity: 0.5;
        -webkit-filter: grayscale(50%) blur(10px);
        filter: grayscale(50%) blur(5px);
        -webkit-transition: all 2s ease;
        transition: all 2s ease;
      }
      .Procard .profile {
        border-radius: 50%;
        position: absolute;
        bottom: 50%;
        left: 50%;
        max-width: 100px;
        opacity: 1;
        box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.5);
        border: 2px solid rgba(255, 255, 255, 0.5);
        -webkit-transform: translate(-50%, 0%);
        transform: translate(-50%, 0%);
      }
      .Procard .profile:hover{
          border-radius: 30%;
          transition:1s;
      }
      .Procard h3 {
        margin: 0 0 5px;
        font-weight: 400;
      }
      .Procard h3 span {
        display: block;
        font-size: 0.8em;
        color: #f39c12;
        opacity: 0.75;
      }
      .Procard i {
        padding: 10px 5px;
        display: inline-block;
        font-size: 32px;
        color: #ffffff;
        text-align: center;
        opacity: 0.65;
      }
      .Procard a {
        text-decoration: none;
      }
      .Procard i:hover {
        opacity: 1;
        -webkit-transition: all 0.35s ease;
        transition: all 0.35s ease;
      }
      .Procard:hover .background,
      .Procard.hover .background {
        -webkit-transform: scale(1.3);
        transform: scale(1.3);
      }
      @keyframes fadeInAnimation {
          0% {
              opacity: 0;
          }
          100% {
              opacity: 1;
           }
      }
      @keyframes animatebottom {
          from {
              bottom: -300px;
              opacity: 0
          }
          to {
              bottom: 0;
              opacity: 1
          }
        }
        .box{
          display: flex;flex-direction:column ;justify-content: center;
            background: orange;
            border-radius: 2px;
            display: block;
            margin: 1rem 6em;
            position: relative;
            color:white; 
            margin-left: 8em;
            padding: 0 2em;
        }
      </style>
      <body>
      <%@page import="java.util.*"%>

 <%
 String user_name = (String)session.getAttribute("user_name");
 System.out.println(user_name);
  String email_id = (String)session.getAttribute("email_id");
 %>
        <header>
            <div class="left">
              <h1 class="logo" style="font-size:4em">Uduppi<span>Sagar.</span></h1>
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
                <h1>Contact Us</h1>
            </div>
            <div style="display: flex;justify-content: center;">
                <div class="Procard">
                <img src="./Media/vidyasagar.jpg" height="310" width="300" alt="Niteesh" class="background"/>
                <img src="./Media/vidyasagar.jpg" alt="Vidyasagar" class="profile"/>
                    <h3>VIDYASAGAR SINGADI<span>200010056</span></h3>
          
                    <div class="icons">
                    <a href="#">
                    <i class="ion-social-facebook-outline"></i>
                    </a>
                    <a href="https://twitter.com/vss4969"> 
                    <i class="ion-social-twitter-outline"></i>
                    </a>
                    </div>
                
                </div>
                <div class="Procard">
                <img src="./Media/tabish.jpeg" height="310" width="300" alt="Tabish" class="background"/>
                <img src="./Media/tabish.jpeg" alt="Tabish" class="profile"/>
                  
                    <h3>Tabish Khalid Halim<span>200020049</span></h3>
                
                    <div class="icons">
                    <a href="https://www.facebook.com/tabish.khalidhalim">
                    <i class="ion-social-facebook-outline"></i>
                    </a>
                    <a href="https://www.instagram.com/thesnagtalker007/"> 
                    <i class="ion-social-instagram-outline"></i>
                    </a>
                    </div>
                
                </div>
                </div>
          </div>
      <script>
      $(".hover").mouseleave(
        function () {
          $(this).removeClass("hover");
        }
      );
      </script>
      <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
      <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
          <script src="" async defer></script>
      </body>
</html>