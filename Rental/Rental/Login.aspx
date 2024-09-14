<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Rental.Login" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Login</title>
    <link rel="stylesheet" href="css/Styles.css" />
    <style>
        a {
            text-decoration:none;
            font-size:larger;
            position:relative;
            top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Login</h2>
        <div>
            <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
            <asp:TextBox ID="PasswordTextBox" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" CssClass="button" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix the following errors:" CssClass="validation-summary" />
        <div>
            <a href="UserRegistration.aspx">Register</a>
        </div>
    </form>
</body>
</html>
