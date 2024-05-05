<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trains</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/flights.css">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="css/index-styles.css" rel="stylesheet" />
    <style>
        .container {
            margin: 20px;
        }

        .flight-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
        }

        .header {
            margin-bottom: 20px;
        }

        .info-section {
            margin-bottom: 20px;
        }

        .info-label {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .info-row {
            display: flex;
            margin-bottom: 5px;
        }

        .label {
            flex: 1;
            font-weight: bold;
        }

        .value {
            flex: 3;
        }
    </style>
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
        String query = "SELECT * FROM booking";
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            String id = rs.getString("id");
            String aadhar = rs.getString("aadhar");
            String address = rs.getString("address");
            String age = rs.getString("age");
            String destination = rs.getString("destination");
            String dob = rs.getString("dob");
            String email = rs.getString("email");
            String extraphone = rs.getString("extraphone");
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String pay = rs.getString("pay");
            String source = rs.getString("source");
            String tdate = rs.getString("tdate");
            Long umobile = rs.getLong("umobile");
            String weight = rs.getString("weight");
%>
<div class="container">
    <div class="flight-card">
        <div class="header">
            <label class="flight-id">Flight ID: <span class="flight-id-value"><%= id %></span></label>
        </div>
        <div class="flight-details">
            <div class="info-section">
                <div class="info-label">Passenger Details:</div>
                <div class="info-row">
                    <div class="label">Aadhar:</div>
                    <div class="value"><%= aadhar %></div>
                </div>
                <div class="info-row">
                    <div class="label">Address:</div>
                    <div class="value"><%= address %></div>
                </div>
                <div class="info-row">
                    <div class="label">Age:</div>
                    <div class="value"><%= age %></div>
                </div>
                <div class="info-row">
                    <div class="label">Email:</div>
                    <div class="value"><%= email %></div>
                </div>
                <div class="info-row">
                    <div class="label">Alternate Number:</div>
                    <div class="value"><%= extraphone %></div>
                </div>
                <div class="info-row">
                    <div class="label">First Name:</div>
                    <div class="value"><%= fname %></div>
                </div>
                <div class="info-row">
                    <div class="label">Last Name:</div>
                    <div class="value"><%= lname %></div>
                </div>
            </div>
            <div class="info-section">
                <div class="info-label">Flight Details:</div>
                <div class="info-row">
                    <div class="label">Destination:</div>
                    <div class="value"><%= destination %></div>
                </div>
                <div class="info-row">
                    <div class="label">DOB:</div>
                    <div class="value"><%= dob %></div>
                </div>
                <div class="info-row">
                    <div class="label">Payment Method:</div>
                    <div class="value"><%= pay %></div>
                </div>
                <div class="info-row">
                    <div class="label">Source:</div>
                    <div class="value"><%= source %></div>
                </div>
                <div class="info-row">
                    <div class="label">Travel Date:</div>
                    <div class="value"><%= tdate %></div>
                </div>
                <div class="info-row">
                    <div class="label">User Mobile:</div>
                    <div class="value"><%= umobile %></div>
                </div>
                <div class="info-row">
                    <div class="label">Luggage:</div>
                    <div class="value"><%= weight %> Kg</div>
                </div>
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