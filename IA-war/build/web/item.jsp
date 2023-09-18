<%@page import="Classes.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.ItemNode"%>
<%@page import="Classes.Items"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <% 
            User u = new User();
            
            Items i = new Items();
            ArrayList<ItemNode> items = i.getItems();      
            
            ItemNode item = items.get(0);
            
            for (int j = 0; j < items.size(); j++) {
                if (items.get(j).getId() == Integer.parseInt(request.getParameter("id"))) {
                    item = items.get(j);
                    break;
                }
            }
        %>
                
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - <%=item.getName()%></title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/item.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .change {text-align: center; margin: auto;}
            .success {text-align: center; margin-top: 20px; margin-bottom: 20px; color: green; font-weight: bold;}
            .error {text-align: center; margin-top: 20px; margin-bottom: 20px; color: red; font-weight: bold;}
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
               
        <h1 id="topMessage"><% out.println(item.getName()); %> </h1>
                
        <%            
            String i1 = "/images/" + request.getParameter("id") + "/1";
            String i2 = "/images/" + request.getParameter("id") + "/2";
            String i3 = "/images/" + request.getParameter("id") + "/3";
            String i4 = "/images/" + request.getParameter("id") + "/4";
            String i5 = "/images/" + request.getParameter("id") + "/5";
        %>
                
        <div class="slideshow-container">
            <% 
                if (item.numOfImages() >= 1) {
                    %>
                    <div class="mySlides fade">
                        <img src="${pageContext.request.contextPath}<%=i1%>" style="width:500px">
                    </div>
                    <%
                }
                if (item.numOfImages() >= 2) {
                    %>
                    <div class="mySlides fade">
                        <img src="${pageContext.request.contextPath}<%=i2%>" style="width:500px">
                    </div>
                    <%
                }
                if (item.numOfImages() >= 3) {
                    %>
                    <div class="mySlides fade">
                        <img src="${pageContext.request.contextPath}<%=i3%>" style="width:500px">
                    </div>
                    <%
                }
                if (item.numOfImages() >= 4) {
                    %>
                    <div class="mySlides fade">
                        <img src="${pageContext.request.contextPath}<%=i4%>" style="width:500px">
                    </div>
                    <%
                }
                if (item.numOfImages() == 5) {
                    %>
                    <div class="mySlides fade">
                        <img src="${pageContext.request.contextPath}<%=i5%>" style="width:500px">
                    </div>
                    <%
                }                

                if (item.numOfImages() >= 2) {
                    %>
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    <%
                }
            %>                                   
        </div>
        
        <p class="p"> Price: $<% out.println(item.getPrice()); %></p> 
        <p class="p"> Condition: <% out.println(item.getCondition() + "/5"); %></p>
        <p class="p"> Size: <% out.println(item.getSize()); %></p>
        <p class="p"> Brand: <% out.println(item.getBrand()); %></p>
        <a href="<%=item.getLink()%>" rel="noopener noreferrer" target="_blank"> <p class="p"> Link to Instagram Post </p> </a>
        
        <%
            if (!item.getNotes().equals("")) {
                %> <p class="p"> Other Notes: <% out.println(item.getNotes()); %></p> <%
            }
        %>
        
        <a href="mailto:krishnaD1213@gmail.com?subject=Inquiring About <%=item.getName()%>"> <p class="p"> Contact Us </p> </a>
                
        <%
            if (session.getAttribute("Username") != null) {
                %>
                    <form method="post" action="item.jsp?id=<%=request.getParameter("id")%>">
                        <div class="change">             
                            <%
                                if (u.savedItemsList(session.getAttribute("Username").toString()).contains(item.getId())) {
                                    %> <input type="submit" value="Remove Save" name="removeSave"/> <%
                                } else {
                                    %> <input type="submit" value="Save For Later" name="save"/> <%
                                }
                            %>
                        </div>   
                    </form>
                <%
            }

            if (request.getParameter("save") != null && session.getAttribute("Username") != null && !session.getAttribute("Username").equals("Admin")) {
                u.saveItem(session.getAttribute("Username").toString(), item.getId());

                response.sendRedirect("item.jsp?id=" + request.getParameter("id"));                
            } 
            
            if (request.getParameter("removeSave") != null && session.getAttribute("Username") != null && !session.getAttribute("Username").equals("Admin")) {
                u.removeSaved(session.getAttribute("Username").toString(), item.getId());

                response.sendRedirect("item.jsp?id=" + request.getParameter("id"));                                               
            }
        %>
        
        <script> 
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) {slideIndex = 1;}
                if (n < 1) {slideIndex = slides.length;}
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex-1].style.display = "block";
                dots[slideIndex-1].className += " active";
            }
        </script>
    </body>
</html>
