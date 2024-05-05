
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Booking Form</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link href="css/index-styles.css" rel="stylesheet" />

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="abc">
			<a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Railways</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index" style="margin-right: 60px;">Log Out</a></li>
			</ul>
		</div>
	</nav>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main" style="margin-top: 80px; height: 700px;">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container" style="margin-top: -440px;">
				<form method="post" modelAttribute="booking" action="booking" class="booking-form" id="booking-form">
				<br><br>
				<h2 class="booking-form-title" style="margin-top: 30px;">Book Your Ticket</h2>
					<div class="signup-content">
						<div class="signup-form">
							<div class="form-group">
								<label for="fname"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<input type="text" name="fname" id="fname" placeholder="First Name" required/>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="tel" name="umobile" id="contact" placeholder="Phone Number" required/>
							</div>

							<div class="form-group">
								<label for="dob"><i class="zmdi zmdi-calendar"></i></label>
								<input type="date" name="dob" id="dob" placeholder="Date of Birth" required/>
							</div>
							<div class="form-group">
								<label for="source"><i class="zmdi zmdi-railway"></i></label>
								<input type="text" name="source" id="source" placeholder="Train Source" required/>
							</div>
							<div class="form-group">
								<label for="flight-date"><i class="zmdi zmdi-calendar"></i></label>
								<input type="date" name="tdate" id="flight-date" placeholder="Train Date" required/>
							</div>
							<div class="form-group">
								<label for="extra-contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="extraphone" id="extra-contact" placeholder="Extra Contact Details" required/>
							</div>
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label>
								<input type="text" name="address" id="address" placeholder="Address" required/>
							</div>
						</div>
						<div class="signup-image" style="margin-top: 1px; margin-left: -10px;">
							<div class="form-group">
								<label for="lname"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<input type="text" name="lname" id="lname" placeholder="Last Name" required/>
							</div>
							<div class="form-group">
								 <label for="email"><i class="zmdi zmdi-email"></i></label>
								<input type="email" name="email" id="email" placeholder="Email Address" required/>
							</div>
							<div class="form-group">
								<label for="age"><i class="zmdi zmdi-calendar"></i></label>
								<input type="number" name="age" id="age" placeholder="Age" required/>
							</div>
							<div class="form-group">
							<label for="destination"><i class="zmdi zmdi-railway"></i></label>
								<input type="text" name="destination" id="destination" placeholder="Train Destination" required/>
							</div>
							<div class="form-group">
								<label for="luggage"><i class="zmdi zmdi-card-travel"></i></label>
								<input type="number" name="weight" id="luggage" placeholder="Approx. Luggage Weight" required/>
							</div>
							<div class="form-group">
								<label for="adhar"><i class="zmdi zmdi-card"></i></label>
								<input type="text" name="aadhar" id="adhar" placeholder="Aadhar Number" required/>
							</div>
							<div class="form-group">
							    <label for="pay" style="margin-top: 7px;"><i class="zmdi zmdi-money"></i></label>
							    <select name="pay" id="pay" style="margin-left: 21px; margin-top: 15px;" required>
							        <option value="" selected disabled>Payment Method</option>
							        <option value="UPI">UPI</option>
							        <option value="Card Payment">Card Payment</option>
							        <option value="Bank Transfer">Bank Transfer</option>
							    </select>
							</div>
						</div>
					</div>
					<div class="button">
						<div class="form-group">
							<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
							<label for="agree-term" class="label-agree-term"><span><span></span></span>I agree to all statements in <a href="#" class="term-service">Terms of service</a></label>
							<br>
							<input type="submit"  name="signup" id="signup" class="form-submit" value="Book Ticket" />
						</div>
						<br><br><br>
					</div>
				</form>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<!-- Include this script in your HTML file -->
<script>
    $(document).ready(function () {
        $('#booking-form').submit(function (e) {
            e.preventDefault(); // Prevent default form submission

            // Serialize form data
            var formData = $(this).serialize();

            // Send AJAX request
            $.ajax({
                type: 'POST',
                url: 'booking', // Replace 'booking' with your actual endpoint
                data: formData,
                success: function (response) {
                    // Hide main div
                    $('.main').hide();

                    // Show success message
                    swal("Success!", "Ticket booked successfully.", "success");
                },
                error: function () {
                    // Show error message
                    swal("Error!", "An error occurred. Please try again later.", "error");
                }
            });
        });
    });
</script>



</body>
<!-- This template was made by Colorlib (https://colorlib.com) -->
</html>
