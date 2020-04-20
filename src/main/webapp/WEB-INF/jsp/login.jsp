<%@ page errorPage="Error.html" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
	overflow: hidden;
}

.reglink {
	font-size: 1vw;
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
/* -----------LOGIN-----------------*/
.login {
	background-color: black;
	width: 20%;
	padding: 10px;
	color: white;
	font-family: rk;
	position: absolute;
	top: 29%;
	right: 20%;
	border-radius: 04px;
	font-size: 20px;
	opacity: 0.8;
}

.login center table tr td input[type=email] {
	font-size: 20px;
	width: 93%;
	padding: 5px;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.login center table tr td input[type=password] {
	font-size: 20px;
	padding: 5px;
	width: 93%;
	border: 2px solid white;
	border-radius: 04px;
	font-family: rk;
}

.login center table tr td input[type=submit] {
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

.login center table tr td input[type=reset] {
	font-size: 20px;
	padding: 5px;
	margin-top: 10px;
	border: 2px solid white;
	background-color: #03A9F4;
	border-radius: 02px;
	color: white;
	width: 48%;
}

.login center table tr td input[type=submit]:hover {
	background-color: green;
}

.login center table tr td input[type=reset]:hover {
	background-color: red;
}

.login center table tr td p {
	color: white;
	cursor: pointer;
	margin: 0;
}

@media ( min-width : 220px) and (max-width: 480px) {
	html {
		width: 100%;
		height: 100%;
	}
	body {
		width: 100%;
		height: 100%;
		background-size: 100% 100%;
	}
	input[type=email] {
		width: 94%;
	}
	input[type=password] {
		width: 94%;
	}
	#particles-js {
		display: none;
	}
	.title {
		position: absolute;
		top: 17%;
		font-size: 16vw;
		text-align: center;
	}
	.login {
		width: 78%;
		right: 0;
		left: 0;
		margin: 0 auto;
	}
	.showwhenmobile {
		height: 100%;
	}
	.reglink {
		font-size: 3.5vw;
	}
}
@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}
@media ( min-width : 481px) and (max-width: 1000px) {
	.title {
		position: absolute;
		top: 17%;
		width: 70%;
		font-size: 10vw;
		text-align: center;
	}
	.login {
		width: 60%;
		top: 45%;
		right: 0;
		left: 0;
		margin: 0 auto;
	}
	.reglink {
		font-size: 3.5vw;
	}
}

@media (min-width:1000px) and (max-width:1024px){
.title {
	left: 8%;
}

.login{width:21%;right:15%;}
}
</style>
<title>Login</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		if (session.getAttribute("curuser") != null) {
	%>
	<jsp:forward page="main.jsp" />
	<%
		}
	%>
	<div id="particles-js"
		style="background-image: url('other/images/back4.jpg'); background-size: cover; filter: blur(2px); background-repeat: no-repeat; background-position: 50% 50%;">
		<canvas class="particles-js-canvas-el" width="1366" height="667"
			style="width: 100%; height: 100%;"></canvas>
	</div>
	<div class="showwhenmobile"
		style="background-image: url('other/images/back4.jpg'); background-size: cover; filter: blur(2px); background-repeat: no-repeat; background-position: 50% 50%;">
	</div>
	<p class="title">
		<span style="color: #03A9F4;">P</span>FORUM
	</p>
	<div class="login" style="${cssprop}">
		<center>
			<h1>
				<span style="color: #03A9F4;">L</span>ogin
			</h1>
			<table>
				<form method="post" action="login.pforum">
					<tr>
						<td><input type="email" name="euname" placeholder="Email"
							pattern="[a-z0-9._%+-]+@gmail.[a-z]{2,}$" required /></td>
					</tr>
					<tr>
						<td><input type="password" name="epass" placeholder="Password"
							required /></td>
					</tr>
					<tr>
						<td colspan=0.5><input type="submit" value="Login" /><input
							type="reset" value="Clear" /></td>
					</tr>
					<tr>
						<td>Don't have account? <a href="RegisterPage.pforum" style="color:#16A085;">Register</a></td>
					</tr>
					<h4>${msg}</h4>
				</form>

			</table>
		</center>
	</div>

	<script type="text/javascript" src="other/js/particles.js"></script>
	<script type="text/javascript" src="other/js/particleconfig.js"></script>
</body>
</html>