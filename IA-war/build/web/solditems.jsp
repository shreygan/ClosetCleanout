<%@page import="java.util.ArrayList"%>
<%@page import="Classes.ItemNode"%>
<%@page import="Classes.Items"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>               
        
        <% 
            Items i = new Items(); 
            ArrayList<ItemNode> items = i.getItems(); 
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - Sold Items</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/clothing.css" rel="stylesheet" type="text/css"/>  
        
        <style>
            .image {display: block;margin-left: auto; margin-right: auto; padding-left: 5px; padding-right: 5px;}
            .images {padding-bottom: 15px; display: inline-block; width: 400px; padding-right: 15px; margin:auto; text-align: center;}
            .text {text-align: center; margin-top: -25px; margin-bottom: -15px; padding-bottom: 15px;}
            .bruh {margin: auto; text-align: center; padding-top: 25px; }
            #topMessage {margin-bottom: 20px;}
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
               
        <h1 id="topMessage">Sold Items</h1>  
        
        <%
            for (int j = 1; j <= items.size(); j++) {                                   
                if (items.get(j-1).isSold()) {
                    int id = items.get(j-1).getId();
                    %> <div class="bruh"> <div class="images" href="item.jsp?id=<%=id%>"> <a href="item.jsp?id=<%=id%>" style=""> <img src="${pageContext.request.contextPath}/images/<%=id%>/1" height="200px" class="image"></a> 
                    <p class="text"> <%
                    out.println("$" + items.get(j - 1).getPrice() + "<br>");
                    out.println("Condition: " + items.get(j - 1).getCondition() + "/5 <br>");
                    out.println("Size: " + items.get(j - 1).getSize());
                    %>          
                        </p> 
                        <form action="solditems.jsp" method="post">
                            <input type="hidden" name="itemId" value="<%= j-1 %>">
                            <div class="change">
                                <input type="submit" value="List Again?" name="markSold"/>
                                <input type="submit" value="Remove Listing?" name="removeListing"/> 
                            </div>   
                        </form>       
                        </div> </div> 
                    <%                                            
                }
            }    

            if (request.getParameter("markSold") != null) {
                items.get(Integer.parseInt(request.getParameter("itemId"))).markAsNotSold();
                response.setHeader("REFRESH", "0");
            } else if (request.getParameter("removeListing") != null) {
                i.removeItem(Integer.parseInt(request.getParameter("itemId")));
//                items.remove(items.get(Integer.parseInt(request.getParameter("itemId"))));
                items.remove(Integer.parseInt(request.getParameter("itemId")) - 1);
                response.setHeader("REFRESH", "0");
            }
        %>
        
    </body>
</html>
