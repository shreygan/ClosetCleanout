<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Classes.User"%>
<!DOCTYPE html>
<html>
    <head>        
        
        <% session.setAttribute("Username", null); %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - Login</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        
        <div class="topnav">
            <a href="index.jsp">Main Menu</a>
            <a href="clothing.jsp">All Clothing</a>
            <a href="bottoms.jsp">Bottoms</a>
            <a href="tops.jsp">Tops</a>
            <a href="newaccount.jsp">Create an Account</a>
            <a href="login.jsp">Log In</a>
        </div>
        
        <br/><br/><br/>

        <jsp:include page="header.html"/>
        
        <br/>
        
        <form action="login.jsp">
                        
            <div class = "inputBox"> <p  class = "input">Username</p>  <input type="text" name="User"/> </div>
            <br/><br/><br/><br/><br/>
            <div class = "inputBox"> <p class = "input">Password</p>  <input type="password" name="Pass"/> </div> 
                        
            <br/><br/>

            <%          
                User u = new User();
                
                if (request.getParameter("submit") != null) {

                    String User = request.getParameter("User");
                    String Pass = request.getParameter("Pass");

                    int check = u.checkUser(User, Pass);

                    if (check == 0) {
                        session.setAttribute("Username", User);
                        
                        session.setAttribute("Login", "True");
                        
                        session.setAttribute("Iteration", 2);
                        
                        response.sendRedirect("index.jsp");
                        %>  <%
                        
                    } else if (check == 6) {
                        %>  <div class="error"> <% out.println(u.getError6()); %> </div> <%
                    }
                }
            %>
            
            <div id="inputButton"> <input type="submit" value="Enter" name = "submit"/> </div>     
            
        </form>
        </body>
        
    </body>
</html>
