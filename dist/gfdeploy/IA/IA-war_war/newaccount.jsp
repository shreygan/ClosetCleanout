<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Classes.User"%>
<!DOCTYPE html>
<html>
    <head>
        
        <% session.setAttribute("Username", null); %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - New Account</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/newaccount.css" rel="stylesheet" type="text/css"/>
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
               
        <h1 id="topMessage">Creating an Account </h1>   
        
        <form action="newaccount.jsp">
            
            
            <div class = "inputBox"> <p class = "input">First Name</p>  <input type="text" name="FName"/> </div>
            <div class = "inputBox"> <p class = "input">Last Name</p>  <input type="text" name="LName"/> </div>
            <div class = "inputBox"> <p class = "input">Email</p>  <input type="text" name="Email"/> </div>
            <div class = "inputBox"> <p class = "input">Username</p>  <input type="text" name="User"/> </div>
            
            <div class = "inputBox"> <p class = "input">Password</p>  <input type="password" name="Pass1"/> </div> 
            <div class = "inputBox"> <p class = "input">Confirm Password</p>  <input type="password" name="Pass2"/> </div>            
            
            <br/><br/>

            <%
                User u = new User();
                                
                if (request.getParameter("submit") != null) {

                    String FName = request.getParameter("FName");
                    String LName = request.getParameter("LName");
                    String Email = request.getParameter("Email");
                    String User = request.getParameter("User");
                    String Pass1 = request.getParameter("Pass1");
                    String Pass2 = request.getParameter("Pass2");
                        
                    session.setAttribute("FName", FName);
                        
                    int check = u.checkNewUser(FName, LName, Email, User, Pass1, Pass2);
                        
                    if (check == 0) {
                        u.addUser(FName, LName, Email, User, Pass1);
                            
                        session.setAttribute("FName", FName);
                        session.setAttribute("Username", User);
                        
                        session.setAttribute("Login", "True");
                        
                        session.setAttribute("Iteration", 2);
                            
                        response.sendRedirect("index.jsp");
                        
                    } else if (check == 1) {
                        %> <div class="error"> <%  out.println(u.getError1()); %> </div> <%
                    } else if (check == 2) {
                        %> <div class="error"> <%  out.println(u.getError2()); %> </div> <%
                    } else if (check == 3) {
                        %> <div class="error"> <%  out.println(u.getError3()); %> </div> <%
                    } else if (check == 4) {
                        %> <div class="error"> <%  out.println(u.getError4()); %> </div> <%
                    } else if (check == 5) {
                        %> <div class="error"> <%  out.println(u.getError5()); %> </div> <%
                    }
                } else {
                    %> <br/><br/> <%
                }
            %>
            
            <div id="inputButton"> <input type="submit" value="Enter" name = "submit"/> </div>     
            
        </form>
        
    </body>
</html>
