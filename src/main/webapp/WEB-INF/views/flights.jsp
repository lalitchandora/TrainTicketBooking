<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Railways</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <style>
        /* Resetting default margins and paddings */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global font settings */
        body {
            font-family: 'Montserrat', sans-serif;
        }

        /* Navbar styles */
        .navbar {
            background-color: #007bff;
            color: white;
            padding: 10px 0;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: white !important;
            margin-right: 20px;
        }

        /* Page title styles */
        .flight-page {
            text-align: center;
            margin-top: 120px;
        }

        .form-title {
            font-size: 2rem;
            font-weight: bold;
        }

        /* Container styles */
        .container {
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .container:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Flight card styles */
        .flight-card {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }

        .flight-id {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Flight details styles */
        .flight-details {
            margin-bottom: 10px;
        }

        .flight-detail {
            margin-bottom: 5px;
        }

        .label-source,
        .label-destination,
        .label-time,
        .label-date,
        .label-airline {
            font-weight: bold;
        }

        /* Fare details styles */
        .fare-details {
            margin-top: 10px;
        }

        .fare-detail {
            margin-bottom: 5px;
        }

        /* Book button styles */
        .book-button {
            margin-top: 20px;
        }

        .btn1 {
            background-color: #007bff;
            border-color: #007bff;
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn1:hover {
            background-color: #0056b3;
        }
    </style>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="css/index-styles.css" rel="stylesheet" />

</head>
<body>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="abc">
        <a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Railways</a>
    </div>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item mx-0 mx-lg-1">
                <div class="nav-link py-3 px-0 px-lg-3 rounded">
                    <%
                        String username =(String)session.getAttribute("loggedInUser");
                        if(username != null){
                            %>
                            Welcome, <%= username %>
                            <%
                        }
                    %>
                </div>
            </li>
            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index" style="margin-right: 60px;">Log Out</a></li>
        </ul>
    </div>
</nav>

<div class="flight-page" style="margin-top: 120px">
    <h2 class="form-title" style="margin-left: 75px; margin-bottom: 20px;">Railways Details</h2>
</div>

<%
    String url = "jdbc:mysql://localhost/Submitted";
    String user = "root";
    String password = "omkar";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);

        stmt = con.createStatement();
        String query = "SELECT * FROM addflight";
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            String flightId = rs.getString("id");
            String source = rs.getString("source");
            String timeToReach = rs.getString("timetoreach");
            String destination = rs.getString("destination");
            String date = rs.getString("date");
            String airline = rs.getString("airline");
            double economyPrice = rs.getDouble("eprice");
            double firstClassPrice = rs.getDouble("fprice");
            double businessClassPrice = rs.getDouble("bprice");
%>
<div class="container">
    <div class="flight-card">
        <label class="flight-id">Train ID: <span class="flight-id-value"><%= flightId %></span></label>

        <div class="flight-details">
            <div class="flight-detail">
                <label class="label-source">Source:</label>
                <span class="source"><%= source %></span>
            </div>
            <div class="flight-detail">
                <label class="label-destination">Destination:</label>
                <span class="destination"><%= destination %></span>
            </div>
            <div class="flight-detail">
                <label class="label-time">Time to Reach:</label>
                <span class="time"><%= timeToReach %></span>
            </div>
            <div class="flight-detail">
                <label class="label-date">Date:</label>
                <span class="date"><%= date %></span>
            </div>
            <div class="flight-detail">
                <label class="label-airline">Train Name:</label>
                <span class="airline"><%= airline %></span>
            </div>
        </div>

        <div class="fare-details">
            <div class="fare-detail">
                <label class="label-airline">Ticket Fare:</label><br>

                <label class="label-eprice">1AC:</label>
                <span class="eprice">Rs. <%= economyPrice %></span>
            </div>
            <div class="fare-detail">
                <label class="label-fprice">2AC:</label>
                <span class="fprice">Rs. <%= firstClassPrice %></span>
            </div>
            <div class="fare-detail">
                <label class="label-bprice">Sleeper:</label>
                <span class="bprice">Rs. <%= businessClassPrice %></span>
            </div>
        </div>

        <div class="book-button">
            <a href="booking?id=<%= flightId %>" class="btn1">Book Ticket</a>
        </div>
    </div>
</div>
<br><br>
<%
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<h4>Error occurred while fetching data from the database</h4>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
