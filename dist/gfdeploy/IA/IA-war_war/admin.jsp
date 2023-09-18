<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <% session.setAttribute("Done", "3"); %>        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - All Clothing</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/clothing.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .change {text-align: center;}
        </style>
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
        
        <br/><br/><br/>
               
        <h1 id="topMessage">Admin </h1>  
        
        <form action="additem.jsp">                       
            <div class="change"> <input type="submit" value="Add Item" name="addItem"/> </div>                                     
        </form>
        
        <br><br>
        
        <form action="listeditems.jsp">                       
            <div class="change"> <input type="submit" value="Manage Listed Items" name="addItem"/> </div>                                     
        </form>
        
        <br><br>
        
        <form action="solditems.jsp">                       
            <div class="change"> <input type="submit" value="View Sold Items" name="addItem"/> </div>                                     
        </form>        
    </body>
</html>
