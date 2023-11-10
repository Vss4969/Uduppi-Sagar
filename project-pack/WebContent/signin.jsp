<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sign In</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="home.css">
    </head>
    <style>
      hr{
        border: none;
        height: 8vh;
      }
.area{
  margin: 0; 

   padding: 0; 

   font-family: sans-serif; 
}

 .loginbox{ 

width: 400px; 

padding: 50px; 
flex-wrap: wrap;

position: absolute; 

top: 50%; 

left: 50%; 

transform: translate(-50%,-50%); 

background: rgb(81, 53, 0); 

text-align: center; 

border-radius: 70px; 

user-select: none; 

} 



.loginbox h1{ 

color: white; 

text-transform: uppercase; 

font-weight: 500; 

} 



.loginbox h1:hover{color:orange} 

.loginbox input[type = "text"], .loginbox input[type = "password"]{ 

border:0; 

background: none; 

display: block; 

margin: 20px auto; 

text-align: center; 

border: 2px solid #999; 

padding: 15px 1px; 

width: 200px; 

outline: none; 

color: white; 

border-radius: 24px; 

transition: 0.25s 

} 



.loginbox input::placeholder{color: rgb(255, 206, 116)} 

.loginbox input[type = "text"]:focus,.loginbox input[type = "password"]:focus{ 

width: 280px; 

border-color: orange; 

} 



.loginbox input[type = "submit"]{ 

border:0; 

background: none; 

display: block; 

margin: 20px auto; 

text-align: center; 

border: 2px solid; 

padding: 14px 40px; 

outline: none; 

color: #2ecc71; 

border-radius: 24px; 

transition: 0.25s; 

cursor: pointer 

} 



.loginbox input[type = "submit"]:hover{ 

background: #2ecc71; 

color: white 

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
              <a href="./cart.jsp"><ion-icon class="cart" name="cart-outline"></ion-icon></a>
              <form action="./signup.jsp" method="post">
                <button class="btn" onclick="submit">Sign Up/Login</button>
              </form>
            </div>
          </header>
          <br></br>
          <br></br>
          <br></br>
          <div class="area">
            <form class="loginbox" action="Authenticate" method="post"> 
              <h1>Login</h1> 
                <input type="text" name="email" placeholder="email id"> 
                <input type="password" name="passwd" placeholder="password"> 
                <input type="submit" name="" value="Login"> 
            </form> 
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