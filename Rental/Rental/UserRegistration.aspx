<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Rental.UserRegistration" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Registration</title>
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>Register</h2>
        <div>
            <asp:TextBox ID="FirstNameTextBox" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:TextBox ID="LastNameTextBox" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
            <asp:TextBox ID="PasswordTextBox" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="PhoneNumberTextBox" runat="server" placeholder="Phone Number"></asp:TextBox>
            <asp:TextBox ID="AddressTextBox" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" CssClass="button" />
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix the following errors:" CssClass="validation-summary" />
    </form>
</body>
</html>
