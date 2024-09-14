    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarListing.aspx.cs" Inherits="Rental.CarListing" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Our Cars - Car Rental System</title>
    <style>
        
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
                /* Car Listing */
.car-listing {
    padding: 20px;
}

.car-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.car-item {
    border: 1px solid #ddd;
    border-radius: 5px;
    margin: 10px;
    padding: 10px;
    width: 30%;
    text-align: center;
}

.car-item img {
    max-width: 100%;
    height: auto;
}

.car-item h3 {
    margin: 10px 0;
}

.car-item .button {
    display: inline-block;
    padding: 10px 20px;
    color: white;
    background-color: #4CAF50;
    text-decoration: none;
    border-radius: 5px;
}

.car-item .button:hover {
    background-color: #45a049;
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
        <header>
            <h1>Available Cars</h1>
            <nav>
                <ul>
                    <li><a href="HomePage.aspx">Home</a></li>
                    <li><a href="CarListing.aspx">Our Cars</a></li>
                    <li><a href="Profile.aspx">My Profile</a></li>
                    <li><a href="Logout.aspx">Logout</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <section class="car-listing">
                <div class="car-grid">
                    <!-- Car items will be dynamically added here -->
                    <%-- Placeholder for car items --%>
                    <% foreach (var car in cars) { %>
                        <div class="car-item">
                            <img src='images/<%= car.Path %>' alt='<%= car.Model %>' />
                            <h3><%= car.Model %></h3>
                            <p>₹<%= car.PricePerDay %> per day</p>
                            <a href="CarDetails.aspx?carId=<%= car.Id %>" class="button">View Details</a>
                        </div>
                    <% } %>
                </div>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Car Rental System. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>

