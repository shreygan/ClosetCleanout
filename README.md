<div align="center">
    <h1>
        <img src="IA-war/web/Images/Icon.png" alt="Logo" height="25px" style="margin-bottom:-3px; margin-right:0px;"> 
        Closet Cleanout
    </h1>
</div>

A web application for clothing. Utilizes JSP, JSF/Servlets and a Java DB database in SQL.

## Design

<div style="overflow-x:scroll; white-space:nowrap; text-align:center;">
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/UML Diagram.jpg">
        <p style="margin-bottom:-10px;"> UML Diagram </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/Flow Chart.jpg">
        <p style="margin-bottom:-10px;"> Flow Chart </p>
    </div>
</div>

## Pages

<div style="overflow-x:scroll; white-space:nowrap; text-align:center;">
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/Main Menu.png">
        <p style="margin-bottom:-10px;"> Main Menu </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/Log In.png">
        <p style="margin-bottom:-10px;"> Log In </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/New Account.png">
        <p style="margin-bottom:-10px;"> Create an Account </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/Tops.png">
        <p style="margin-bottom:-10px;"> Tops </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
        <img src="screenshots/Bottoms.png">
        <p style="margin-bottom:-10px;"> Bottoms </p>
    </div>
</div>


## User Functionality
<div style="overflow-x:scroll; white-space:nowrap; text-align:center;">
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/User View.gif">
        <p style="margin-bottom:-10px;"> Item View </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/User Create Account.gif">
        <p style="margin-bottom:-10px;"> User Create Account </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/User Settings.gif">
        <p style="margin-bottom:-10px;"> User Log In / Settings </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/User Saved Items.gif">
        <p style="margin-bottom:-10px;"> User Saved Items </p>
    </div>
</div>

## Admin Functionality

<div style="overflow-x:scroll; white-space:nowrap; text-align:center;">
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Admin Add Item.gif">
        <p style="margin-bottom:-10px;"> Admin Add Item </p>
    </div>
    <div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Admin Manage Items.gif">
        <p style="margin-bottom:-10px;"> Admin Manage Items </p>
    </div>
</div>

### Users
| Variable        | Type |
| :---------------- | :------ |
| id             |   Integer (non-null, primary key, auto-inc)   |
| FirstName           |   Varchar(255)   |
| LastName           |   Varchar(255)   |
| Email           |   Varchar(255)   |
| Username           |   Varchar(255)   |
| Password           |   Varchar(255)   |

### Items
| Variable        | Type |
| :---------------- | :------ |
| id             |   Integer (non-null, primary key, auto-inc)   |
| Name | Varchar(255) |
| Type | Varchar(255) |
| Price | Double |
| Condition | Integer |
| Size | Varchar(255) |
| Brand | Varchar(255) |
| Link | Varchar(255) |
| Notes | Varchar(255) |
| Sold | Boolean |
| Image1 | Blob |
| Image2 | Blob |
| Image3 | Blob |
| Image4 | Blob |
| Image5 | Blob |

### SavedItems
| Variable        | Type |
| :---------------- | :------ |
| Username | Varchar(255) |
| ItemID | Integer |