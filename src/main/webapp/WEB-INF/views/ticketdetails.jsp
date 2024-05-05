<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Flights</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/flights.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="css/index-styles.css" rel="stylesheet" />

</head>
<body>
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="abc">
        <a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Airways</a>
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
    <h2 class="form-title" style="margin-left: 75px; margin-bottom: 20px;">Flights Details</h2>
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
        <label class="flight-id">Flight ID: <span class="flight-id-value"><%= flightId %></span></label><br>
        <div class="flight-details">
            <div class="flight-detail">
                <label class="label-source">Source</label>
                <label class="label-time">Time-To-Reach</label>
                <label class="label-destination">Destination</label><br>
                <label class="source"><%= source %></label>
                <label class="time"><%= timeToReach %></label>
                <label class="destination"><%= destination %></label>
            </div>
            <div class="flight-detail">
                <label class="label-date">Date:</label>
                <label class="date"><%= date %></label>
                <label class="label-airline">Airline:</label>
                <label class="airline"><%= airline %></label>
            </div>
            <div class="flight-detail">
                <label class="label-eprice">Economy Class Price</label>
                <label class="label-fprice">First Class Price</label>
                <label class="label-bprice">Business Class Price</label><br>
                <label class="eprice">Rs. <%= economyPrice %></label>
                <label class="fprice">Rs. <%= firstClassPrice %></label>
                <label class="bprice">Rs. <%= businessClassPrice %></label>
            </div>
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