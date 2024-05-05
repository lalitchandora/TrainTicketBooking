<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

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
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="abc">
			<a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Airways</a>
		</div>
	</nav>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main" style="margin-top: -360px; height: 1280px; background: url('images/registration-img.png');" >
		<!-- Sign up form -->
		<section class="signup">
			<div class="container" style="width: 700px; margin-left: 300px; opacity: 0.8;">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="uname" id="name" placeholder="Your Name" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="uemail" id="email" placeholder="Your Email" required/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="upwd" id="pass" placeholder="Password" required/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_upwd" id="re_pass"
									placeholder="Repeat your password" required/>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="umobile" id="contact"
									placeholder="Contact no" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required/> <label for="agree-term"
									class="label-agree-term" ><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
						<a href="login" class="signup-image-link" style="margin-left: -160px; margin-top: 20px;">I am already a member</a>
					</div>
				</div>
			</div>
		</section>

	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">
       // Check if the status attribute is set to "success"
        var status = "${status}";
        if (status === "success") {
            var message = "${message}";
            swal("Success", message, "success")
                .then(function() {
                    window.location.href = "/login";
                });
        }
    </script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>