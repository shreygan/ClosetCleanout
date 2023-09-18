<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Classes.AddItem"%>
<!DOCTYPE html>
<html>
    <head>
        
        <% AddItem add = new AddItem();%>
                
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Closet Cleanout - Add Item</title>
        
        <link rel="icon" href='Images/Icon.png'>
        
        <link href="CSS/additem.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .input {margin: auto; border: 0px; margin-bottom: -5px;}
            #inputButton {padding-top: 20px; padding-bottom: 20px;}
            .error {margin-top: 0px;}
            .success {text-align: center; margin-top: 0; color: green; font-weight: bold;}

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
               
        <h1 id="topMessage">Adding an Item </h1>  
        
        <form method="post" action="upload" enctype="multipart/form-data">            
            <div class = "inputBox"> <p class="input">Item Name</p>  <input type="text" name="Item Name"/> </div>
            
            <div class = "inputBox"> 
                <p class="input">Type of Clothing</p> 
                <input type="radio" name="Type" value="top" id="top"/> 
                <label for="top">Top</label>
                <input type="radio" name="Type" value="bottom" id="bottom"/> 
                <label for="bottom">Bottom</label>
                <input type="radio" name="Type" value="other" id="other"/> 
                <label for="other">Other</label>
            </div>                                                  
            
            <div class = "inputBox"> 
                <p class="input"> Price   $</p> 
                <input type="number" name="Price" min="0" step="0.01"/>
            </div>   
            
            <div class = "inputBox"> 
                <p class="input"> Condition (1-5)</p> 
                <input type="number" name="Condition" min="1" max="5" step="1"/>
            </div>   
            
            <div class = "inputBox"> <p class="input">Size</p>  <input type="text" name="Size"/> </div>
            
            <div class = "inputBox"> <p class="input">Brand</p>  <input type="text" name="Brand"/> </div>            
            
            <div class = "inputBox"> <p class="input">Instagram Post Link</p>  <input type="url" name="Link" pattern="https://.*"/> </div>

            <div class = "inputBox"> 
                <p class="input">Extra Notes</p> 
                <textarea id="Notes" name="Notes" rows="10" cols="30"></textarea>
            </div>

            <div class = "inputBox"> 
                <p class="input"> Image 1 </p> 
                <input type="file" name="Image1" accept="image/x-png,image/jpeg"/> 
            </div>
            
            <div class = "inputBox"> 
                <p class="input"> Image 2 </p> 
                <input type="file" name="Image2" accept="image/x-png,image/jpeg"/>
            </div>
            
            <div class = "inputBox"> 
                <p class="input"> Image 3 </p> 
                <input type="file" name="Image3" accept="image/x-png,image/jpeg"/>
            </div>
            
            <div class = "inputBox"> 
                <p class="input"> Image 4 </p> 
                <input type="file" name="Image4" accept="image/x-png,image/jpeg"/>
            </div>
            
            <div class = "inputBox"> 
                <p class="input"> Image 5 </p> 
                <input type="file" name="Image5" accept="image/x-png,image/jpeg"/>
            </div>

            <div id="inputButton"> <input type="submit" value="Add" name = "submit"/> </div>
        </form>             
        
        <%                           
            if (session.getAttribute("Done").toString().equals("0")) {
                %> <div class="success"> <%  out.println(add.get0()); %> </div> <%
            } else if (session.getAttribute("Done").toString().equals("1")) {
                %> <div class="error"> <%  out.println(add.get1()); %> </div> <%
            }
        %>         
    </body>
</html>
