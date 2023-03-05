<%@ page import="Classes.User" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - Settings</title>
      
        <link rel="icon" href='Images/Icon.png'>
        
        <link href='CSS/settings.css' rel='stylesheet' type='text/css'/>
        
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
        
        <br/><br/><br/><br/>
        
        <%
            User u = new User();
        %>

        <h1 id="topMessage">Change <% out.println(session.getAttribute("ChangeValue").toString()); %> </h1>  
        
        <form action="changesettings.jsp">
        <%
            String column = "";
            if (session.getAttribute("ChangeValue").toString() == "Username") {
                column = "Username";
                %> 
                    <div class = "inputBox"> <p  class = "change">Enter New Username</p>  <input type="text" name="Username"/> </div> 
                    <div class = "inputBox"> <p  class = "change">Confirm New Username</p>  <input type="text" name="UsernameConfirm"/> </div>
                <%
            } else if (session.getAttribute("ChangeValue").toString() == "Password") {
                column = "Password";
                %> 
                    <div class = "inputBox"> <p  class = "change">Enter New Password</p>  <input type="password" name="Password"/> </div> 
                    <div class = "inputBox"> <p  class = "change">Confirm New Password</p>  <input type="password" name="PasswordConfirm"/> </div>
                <%
            } else if (session.getAttribute("ChangeValue").toString() == "Email") {
                column = "Email";
                %> 
                    <div class = "inputBox"> <p  class = "change">Enter New Email</p>  <input type="text" name="Email"/> </div> 
                    <div class = "inputBox"> <p  class = "change">Confirm New Email</p>  <input type="text" name="EmailConfirm"/> </div>
                <%
            }
            
            if (request.getParameter("submit") != null) {
                if (!request.getParameter(column).equals(request.getParameter(column + "Confirm"))) {
                    
                    %> <div class="error"> <% out.println(column + "'s"); %> Don't Match </div> <%                   
                } else if (column.equals("Email")) {
                    
                    if (!request.getParameter("Email").contains("@") || !request.getParameter("Email").contains(".")) {
                        %> <div class="error"> Please Enter a Valid Email </div> <%  
                    } else {
                        u.updateUser(session.getAttribute("Username").toString(), column, request.getParameter(column));

                        %> <div class="success"> Change Successful! </div> <% 
                    }                    
                } else if (column.equals("Username")){                 
                    
                    int check = u.checkUser(request.getParameter("Username"));
                    
                    if (check == 1) {
                        %> <div class="error"> <% out.println(u.getError4()); %> </div> <%
                    } else if (check == 2) {
                        %> <div class="error"> <% out.println(u.getError1()); %> </div> <%
                    } else {
                        u.updateUser(session.getAttribute("Username").toString(), column, request.getParameter(column));
                           
                        session.setAttribute("Username", request.getParameter("Username"));
                        
                        %> <div class="success"> Change Successful! </div> <% 
                    }                    
                    
                } else if (column.equals("Password")) {
                    
                }
            }
        %>
                    
            <div class="change"> <input type="submit" value="Enter" name = "submit"/> </div>             
        </form>        
    </body>
</html>
