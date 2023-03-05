<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Classes.User"%>

<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout</title>
        
        <link rel="icon" href='Images/Icon.png'>
    
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        
        <div class="topnav">
            <%                                            
                if (session.getAttribute("Username") != null && session.getAttribute("Username").equals("Admin")) {
                    %> <a href="login.jsp">Log Out</a> <%
                    %> <a href="admin.jsp">Admin</a> <%
                } else if (session.getAttribute("Username") != null) {
                    %> <a href="login.jsp">Log Out</a> <%
                    %> <a href="settings.jsp">Settings</a> <%
                    %> <a href="saveditems.jsp">Saved Items</a> <%
                }
            %>
            <a href="index.jsp">Main Menu</a>
            <a href="clothing.jsp">All Clothing</a>
            <a href="bottoms.jsp">Bottoms</a>
            <a href="tops.jsp">Tops</a>
            <%
                if (session.getAttribute("Username") == null) {
                    %> 
                        <a href="newaccount.jsp">Create an Account</a>
                        <a href="login.jsp">Log In</a>
                    <%
                }           
            %>
        </div>
                
        <br/><br/>
               
        <h1 id="topMessage">Welcome to The Closet Cleanout! </h1>   
        
        <h2 align='center'>Some information about us. </h2>
        
        <p style="margin: auto; text-align: center;">
            ♡ Used and new clothing! <br>
            ♡ 2$ Delivery or contactless pick up!<br>
            ♡ All prices are negotiable!
        </p>
                        
        <img src="Images/Closet Cleanout.jpg" width="500px" style="border-radius: 50%; display: block; margin-left: auto; margin-right: auto; padding-top: 30px;"/>
        
        <br><br>
    </body>
</html>
