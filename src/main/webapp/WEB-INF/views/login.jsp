<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>

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
			<a class="navbar-brand" href="#page-top" style="margin-left: 80px">SPIT Railways</a>
		</div>
	</nav>


	<div class="main" style="margin-top: 0px; background: url('https://images.pexels.com/photos/325200/pexels-photo-325200.jpeg'); background-size:cover;">
		<!-- Sing in  Form -->
		<section class="sign-in" style="height: 100px;">
			<div class="container" style="width: 500px; margin-left: 50px; margin-top: -360px; margin-bottom: -100px; opacity: 0.9;">
				<div class="signin-content">
					<div class="signin-form">
						<h2 class="form-title">Login</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Email" required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<a href="register" class="signup-image-link" style="margin-left: -120px; margin-top: 20px;">Create an account</a>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
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
	
var status = "${status}";
if (status === "failed") {
    swal("Sorry", "Wrong Username/Password", "error")
        .then(function() {
            window.location.href = "/login";
        });
}
</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>