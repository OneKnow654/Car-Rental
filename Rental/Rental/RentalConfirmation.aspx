<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RentalConfirmation.aspx.cs" Inherits="Rental.RentalConfirmation" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rental Confirmation</title>
    <style>
        /* General styles for the container */
.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
}

/* Styling the header */
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

/* Styling the confirmation message */
.confirmation-message {
    text-align: center;
    margin-bottom: 30px;
}

.confirmation-message h3 {
    color: #4CAF50;
}

.confirmation-message p {
    font-size: 18px;
    color: #555;
}

/* Styling the rental details */
.rental-details {
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.detail {
    margin-bottom: 15px;
}

.detail label {
    font-weight: bold;
    color: #333;
}

.detail .value {
    margin-left: 10px;
    font-size: 16px;
    color: #666;
}

/* Styling the links */
.links {
    text-align: center;
    margin-top: 20px;
}

.links a {
    text-decoration: none;
    color: #007BFF;
    font-size: 16px;
}

.links a:hover {
    text-decoration: underline;
}

/* Styling the footer */
.footer {
    text-align: center;
    padding: 10px;
    font-size: 14px;
    color: #888;
    margin-top: 30px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Rental Confirmation</h2>

            <div class="confirmation-message">
                <h3>Thank you for renting with us!</h3>
                <p>Your rental has been successfully processed.</p>
            </div>

            <div class="rental-details">
                <div class="detail">
                    <asp:Label ID="lblCarDetails" runat="server" Text="Car Details:"></asp:Label>
                    <asp:Label ID="lblCarInfo" runat="server" CssClass="value"></asp:Label>
                </div>
                <div class="detail">
                    <asp:Label ID="lblRentalDate" runat="server" Text="Rental Date:"></asp:Label>
                    <asp:Label ID="lblRentalDateValue" runat="server" CssClass="value"></asp:Label>
                </div>
                <div class="detail">
                    <asp:Label ID="lblReturnDate" runat="server" Text="Return Date:"></asp:Label>
                    <asp:Label ID="lblReturnDateValue" runat="server" CssClass="value"></asp:Label>
                </div>
                <div class="detail">
                    <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount:"></asp:Label>
                    <asp:Label ID="lblTotalAmountValue" runat="server" CssClass="value"></asp:Label>
                </div>
            </div>

            <div class="links">
                <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/HomePage.aspx" Text="Return to Home"></asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
