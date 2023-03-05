<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - Settings</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href='CSS/settings.css' rel='stylesheet' type='text/css'/>
        
    </head>
    
    <body>
        
        <% 
            User u = new User(); 
        %>
        
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

        <h1 id="topMessage">Settings</h1>  
            
        <form action="settings.jsp">
                        
            <div class="change"> <input type="submit" value="Change Username" name="changeUser"/> </div> 
            
            <div class="change"> <input type="submit" value="Change Password" name="changePass"/> </div> 
            
            <div class="change"> <input type="submit" value="Change Email" name="changeEmail"/> </div> 
                                    
        </form>
        
        <%            
            if (request.getParameter("changeUser") != null) {
                session.setAttribute("ChangeValue", "Username");
                response.sendRedirect("changesettings.jsp"); 
            } else if (request.getParameter("changePass") != null) {
                session.setAttribute("ChangeValue", "Password");
                response.sendRedirect("changesettings.jsp");
            } else if (request.getParameter("changeEmail") != null) {
                session.setAttribute("ChangeValue", "Email");
                response.sendRedirect("changesettings.jsp");
            }
        %>
 
        <br/><br/>
        
    </body>
</html>
