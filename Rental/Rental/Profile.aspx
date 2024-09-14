<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Rental.Profile" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Profile</title>
    <link rel="stylesheet" href="css/Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <h2>User Profile</h2>
        <div>
            <asp:Label ID="FirstNameLabel" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="LastNameLabel" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email"></asp:TextBox>
            <asp:Label ID="PhoneNumberLabel" runat="server" Text="Phone Number"></asp:Label>
            <asp:TextBox ID="PhoneNumberTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="AddressLabel" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="AddressTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="UpdateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" CssClass="button" />
        </div>
    </form>
</body>
</html>
