<div align="center">
    <h1>
        <img src="IA-war/web/Images/Icon.png" alt="Logo" height="25px" style="margin-bottom:-3px; margin-right:0px;"> 
        Closet Cleanout
    </h1>
</div>

A web application for clothing. Utilizes JSP, JSF/Servlets and a Java DB database in SQL.

## Pages

<details><summary> Main Menu </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Main Menu.png">
</div>
</details>
<details><summary> Log In </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Log In.png">
</div>
</details>
<details><summary> Create an Account </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/New Account.png">
</div>
</details>
<details><summary> Tops </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Tops.png">
</div>
</details>
<details><summary> Bottoms </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
    <img src="screenshots/Bottoms.png">
</div>
</details>



## User Functionality

<details><summary> Item View </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/User View.gif">
</div>
</details>

<details><summary> Create Account </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/User Create Account.gif">
</div>
</details>

<details><summary> Log In / Settings </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/User Settings.gif">
</div>
</details>

<details><summary> Saved Items </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/User Saved Items.gif">
</div>
</details>



## Admin Functionality

<details><summary> Add Item </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/Admin Add Item.gif">
</div>
</details>

<details><summary> Manage Items </summary>
<div style="display:inline-block; margin-right:10px; margin-left:10px; margin-top:10px;">
<img src="screenshots/Admin Manage Items.gif">
</div>
</details>



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

## SQL Tables

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