<%@ page import="java.sql.*" %>
<%@ page import="com.eBookManagementSytem.models.Users"%>
<%@ page import="java.util.List"%>
<%@ page import="com.eBookManagementSytem.models.Addflight"%>

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

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link href="css/index-styles.css" rel="stylesheet" />

</head>
<body>
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="abc">
			<a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Airways</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index" style="margin-right: 60px;">Log Out</a></li>	
			</ul>
		</div>
	</nav>
	
	<div class="flight-page" style="margin-top: 120px">
		<h2 class="form-title" style="margin-left: 75px; margin-bottom: 20px;">Flights Details</h2>
	</div>
	<form action="flights" class="register-form" id="login-form">
			            <% 
            List<Addflight> addflight = (List<Addflight>) request.getAttribute("addflight");
            if (addflight != null) {
                for (Addflight flight : addflight) {
            %>
                <p style="padding: 10px; border: 1px solid #0f0f0e"><%= addflight.getId() %></p> 
                <p style="padding: 10px; border: 1px solid #0f0f0e"><%= addflight.getFlightid() %></p>
                <p style="padding: 10px; border: 1px solid #0f0f0e"><%= addflight.getAuthor() %></p>
                <p style="padding: 10px; border: 1px solid #0f0f0e"><%= addflight.getPrice() %></p>
                <p style="padding: 10px; border: 1px solid #0f0f0e"><a
					href="${pageContext.request.contextPath}/admin/books/edit/<%=book.getId() %>"><span style="background-color: #e2a7e8; padding: 10px; border-radius: 10px;">Edit</span></a>
					<a href="${pageContext.request.contextPath}/admin/books/delete/<%=book.getId() %>"><span style="background-color: #e2a7e8; padding: 10px; border-radius: 10px;">Delete</span></a>
				 </p>
            
            <% 
                }
            }
            %>
	</form>
	
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>