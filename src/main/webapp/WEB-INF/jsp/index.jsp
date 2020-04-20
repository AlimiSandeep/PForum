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
	font-family:rk;
}

#demo {
	text-align: center;
	margin: 0;
	text-shadow: -1px 1px 14px #101010;
}

.time {
	position: absolute;
	top: 130px;
	color: black;
	left: 0;
	right: 0;
	font-family: rk;
	font-size: 55px;
}

.title {
	margin: 0;
	text-align: center;
	font-size: 120px;
	font-weight: bolder;
	text-shadow: -1px 1px 14px #101010;
}

#buttons {
	position: absolute;
	left: 41%;
	top: 111%;
}

#buttons button {
	float: left;
	margin-left: 20px;
	font-size: 30px;
	border: none;
	background-color: white;
	padding: 10px;
	text-transform: capitalize;
	border-radius: 10px;
}

#buttons button:hover {
	background-color: black;
	color: white;
}

@media ( min-width : 320px) and (max-width: 480px) {
.time{top:285px;}
	.title {
		position: absolute;
		top: 50%;
		font-size: 16vw;
		text-align: center;
		width: 100%;
	}
	#demo {
		position: absolute;
		margin: 0 auto;
		width: 100%;
		font-size: 20px;
		top: 120px;
	}
	center {
		position: absolute;
		margin: 0 auto;
		top: 20px;
		width: 100%;
	}
	#buttons {
		left: 0;
		width: 100%;
		top: 43px;
	}
	#buttons button {
		float: none;
		padding: 5px;
		font-size: 30px;
		border: 2px solid #101010;
	}
}
</style>
<title>Pforum</title>
<script src="other/js/particles.js"></script>
</head>
<body>
	<div id="particles-js"
		style="background-image: url('other/images/back4.jpg'); background-size: cover; filter: blur(2px); background-repeat: no-repeat; background-position: 50% 50%;">
		<canvas class="particles-js-canvas-el" width="1366" height="667"
			style="width: 100%; height: 100%;"></canvas>
	</div>

	<div class="time">
		<p class="title">
			<span style="color: #03A9F4;">P</span>FORUM
		</p>
		<p id="demo"></p>
		<center>
			<div id="buttons">
				<button onClick="window.open('LoginPage.pforum','_self')">Login</button>
				<button onClick="window.open('RegisterPage.pforum','_self')">Register</button>
			</div>
		</center>
	</div>

	<script src="other/js/particleconfig.js"></script>
</body>
</html>