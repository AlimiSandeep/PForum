<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="other/images/shorticon.png" />
<style>
@font-face {
	font-family: rk;
	src: url("other/ttf/UberMove-Medium.TTF");
}

body {
	background-size: 100% 100%;
	background-repeat: no-repeat;
	margin: 0;
}

.title {
	margin: 0;
	top: 40%;
	left: 15%;
	text-align: center;
	font-size: 120px;
	font-weight: bolder;
	position: absolute;
	font-family: rk;
	text-shadow: -1px 1px 14px #101010;
}
/* -----------Register-----------------*/
.reg {
	    background-color: black;
    width: 21%;
    padding: 10px;
    color: white;
    font-family: rk;
    position: absolute;
    top: 8%;
    right: 18%;
    border-radius: 04px;
    font-size: 20px;
    opacity: 0.8;
}

.reg center table tr td input[type=text] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=email] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=tel] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=text] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=password] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=submit] {
	font-size: 20px;
	padding: 5px;
	margin-top: 10px;
	border: 2px solid white;
	background-color: #03A9F4;
	border-radius: 02px;
	color: white;
	width: 48%;
	margin: 4px;
}

.reg center table tr td input[type=number] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=date] {
	width: 100%;
	font-size: 20px;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.reg center table tr td input[type=reset] {
	font-size: 20px;
	padding: 5px;
	margin-top: 10px;
	border: 2px solid white;
	background-color: #03A9F4;
	border-radius: 02px;
	color: white;
	width: 48%;
}

.reg center table tr td input[type=submit]:hover {
	background-color: green;
}

.reg center table tr td input[type=reset]:hover {
	background-color: red;
}

.reg center table tr td p {
	color: white;
	cursor: pointer;
}

@media ( min-width : 320px) and (max-width: 480px) {
	.title {
		position: absolute;
		top: 8%;
		font-size: 16vw;
		text-align: center;
	}
	.reg {
		width: 78%;
		right: 0;
		left: 0;
		margin: 0 auto;
	}
}

@media (min-width:1000px) and (max-width:1024px){
.title {
	left: 8%;
}

.reg{width:22%;right:17%;}
}
</style>
<title>Register</title>
<script src="other/js/particles.js"></script>
</head>
<body>
	<div id="particles-js"
		style="background-image: url('other/images/back4.jpg'); background-size: cover; filter: blur(2px); background-repeat: no-repeat; background-position: 50% 50%;">
		<canvas class="particles-js-canvas-el" width="1366" height="667"
			style="width: 100%; height: 100%;"></canvas>
	</div>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires","0");
		
		if(session.getAttribute("curuser")!=null){
			response.sendRedirect("LoginPage.pforum");
		}
	%>
	<p class="title">
		<span style="color: #03A9F4;">P</span>FORUM
	</p>
	<div class="reg">
		<center>
			<h1>
				<span style="color: #03A9F4;">R</span>egister
			</h1>
			<form method="post" action="register.pforum" name="regform">
				<table>
		<tr><td><input type="text" placeholder="First Name" name="fname" pattern="([A-Z][a-zA-Z]*)$" title="First name must be in alphabets and first alphabets must be Capital" required/></td></tr>
		<tr><td><input type="text" placeholder="Last Name" name="lname" pattern="([A-Z][a-zA-Z]*)$" title="Last name must be in alphabets and first alphabets must be Capital" required/></td></tr>
		<tr><td><input type="number" placeholder="Employee ID" name="employeeId" required/></td></tr>
		<tr><td><input type="date" placeholder="Date of Birth" name="dob" required/></td></tr>
		<tr><td><input type="text" placeholder="Designation" name="desig" required/></td></tr>
		<tr><td><input type="email" placeholder="Email" name="email" pattern="[a-z0-9._%+-]+@gmail.[a-z]{2,}$"
							title="Must contain pramati domain" required/></td></tr>
		<tr><td><input type="text" placeholder="Username" name="userName" readonly="readonly" onclick="createUsername()"/></td></tr>
		<tr><td><input type="Password" placeholder="Password" name="passkey" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required/></td></tr>
		<tr><td><input type="text" placeholder="Location" name="location" required/></td></tr>
		<tr><td><center><input type="submit" value="SUBMIT"/><input type="reset" value="RESET" /></center></td></tr>
		<tr><td style="color:white;font-size: 20px;">Already have a account? <a style="color:white;" href="LoginPage.pforum">login</a></td></tr>
		</table>
			</form>
		</center>
	</div>
	<script>
	
		function createUsername() {
			document.forms[0][6].value = document.forms[0][0].value
					+ document.forms[0][2].value;
		}
		var x = setInterval(function() {
			var distance = new Date();
			var hours = distance.getHours();
			var minutes = distance.getMinutes();
			var seconds = distance.getSeconds();
			var ampm = "AM";

			if (hours >= 12) {
				ampm = "PM";
			}

			if (hours > 12) {
				hours = hours - 12;
			}

			if (seconds < 10) {
				seconds = "0" + seconds;
			} else if (minutes < 10) {
				minutes = "0" + minutes
			} else if (hours < 10) {
				hours = "0" + hours;
			}

			document.getElementById("demo").innerHTML = hours + ":" + minutes
					+ ":" + seconds + " " + ampm;
		}, 1000);
	</script>
	<script src="other/js/particleconfig.js"></script>
</body>
</html>