<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="Rental.CarDetails" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Car Details - Car Rental System</title>
    <style>

/* styles.css */

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

form {
    margin: 20px auto;
    padding: 20px;
    width: 80%;
    max-width: 900px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

div {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    color: #333;
}

label, .value {
    display: inline-block;
    margin-bottom: 5px;
}

.label {
    width: 150px;
    text-align: right;
    display: inline-block;
}

.value {
    color: #555;
}

input, select, textarea {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: #fff;
    border: none;
    padding: 15px;
    cursor: pointer;
    border-radius: 4px;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

.row .col {
    flex: 1;
    margin-right: 10px;
}

.row .col:last-child {
    margin-right: 0;
}

header {
    background-color: #4CAF50;
    color: white;
    padding: 10px 0;
    text-align: center;
}

header h1 {
    margin: 0;
}

nav ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

nav ul li {
    display: inline;
    margin: 0 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
}

nav ul li a:hover {
    text-decoration: underline;
}

main {
    padding: 20px;
}

footer {
    background-color: #4CAF50;
    color: white;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
}

  </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Car Details</h2>
            <asp:Label ID="lblCarID" CssClass="label" runat="server" Text="Car ID:"></asp:Label>
            <asp:Label ID="lblCarIDValue" CssClass="value" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblMake" CssClass="label" runat="server" Text="Make:"></asp:Label>
            <asp:Label ID="lblMakeValue" CssClass="value" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblModel" CssClass="label" runat="server" Text="Model:"></asp:Label>
            <asp:Label ID="lblModelValue" runat="server" CssClass="value"></asp:Label>
            <br />
            <asp:Label ID="lblYear" CssClass="label" runat="server" Text="Year:"></asp:Label>
            <asp:Label ID="lblYearValue" runat="server" CssClass="value"></asp:Label>
            <br />
            <asp:Label ID="lblColor" CssClass="label" runat="server" Text="Color:"></asp:Label>
            <asp:Label ID="lblColorValue" runat="server" CssClass="value"></asp:Label>
            <br />
            <asp:Label ID="lblPricePerDay" CssClass="label" runat="server" Text="Price per Day:"></asp:Label>
            <asp:Label ID="lblPricePerDayValue" runat="server" CssClass="value"></asp:Label>
            <br />
            <asp:Label ID="lblDescription"   CssClass="label" runat="server" Text="Description:"></asp:Label>
            <asp:Label ID="lblDescriptionValue" runat="server" CssClass="value" ></asp:Label>
        
         <div>
                <asp:Label ID="lblRentalDate" runat="server" Text="Rental Date:"></asp:Label>
                <asp:TextBox ID="txtRentalDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblReturnDate" runat="server" Text="Return Date:"></asp:Label>
                <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnRent" runat="server" Text="Rent Vehicle" OnClick="btnRent_Click" CssClass="submit-button"/>
            </div>
        </div>
    </form>
</body>
</html>
