<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Rental.HomePage" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Home - Car Rental System</title>
    <style>
        /* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
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

.intro {
    text-align: center;
}

.featured-cars {
    margin-top: 20px;
}

.car-grid {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
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
            <h1>Welcome to Car Rental System</h1>
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
            <section class="intro">
                <h2>Find Your Perfect Car</h2>
                <p>We offer a wide range of cars to suit your needs. Whether you need a luxury vehicle for a special occasion or a reliable car for a business trip, we have you covered.</p>
            </section>
            <section class="featured-cars">
                <h2>Featured Cars</h2>
                <div class="car-grid">
                    <!-- Sample featured cars -->
                    <div class="car-item">
                        <img src="images/car1.jpg" alt="Car 1"/>
                        <h3>Luxury Sedan</h3>
                        <p>₹2000 per day</p>
                        <a href="CarDetails.aspx?carId=4" class="button">View Details</a>
                    </div>
                    <div class="car-item">
                        <img src="images/car2.jpg" alt="Car 2"/>
                        <h3>SUV</h3>
                        <p>₹3000 per day</p>
                        <a href="CarDetails.aspx?carId=2" class="button">View Details</a>
                    </div>
                    <div class="car-item">
                        <img src="car3.jpeg" alt="Car 3"/>
                        <h3>    </h3>
                        <p>₹1500 per day</p>
                        <a href="CarDetails.aspx?carId=3" class="button">View Details</a>
                    </div>
                </div>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Car Rental System. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>

