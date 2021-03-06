<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>



<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}

/* basic stylings ------------------------------------------ */
body {
	background: url(https://scotch.io/wp-content/uploads/2014/07/61.jpg);
}

.container {
	font-family: 'Roboto';
	width: 600px;
	margin: 30px auto 0;
	display: block;
	background: #FFF;
	padding: 10px 50px 50px;
}

h2 {
	text-align: center;
	margin-bottom: 50px;
}

h2 small {
	font-weight: normal;
	color: #888;
	display: block;
}

.footer {
	text-align: center;
}

.footer a {
	color: #53B2C8;
}

/* form starting stylings ------------------------------- */
.group {
	position: relative;
	margin-bottom: 45px;
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	display: block;
	width: 300px;
	border: none;
	border-bottom: 1px solid #757575;
}

input:focus {
	outline: none;
}

/* LABEL ======================================= */
label {
	color: #999;
	font-size: 18px;
	font-weight: normal;
	position: absolute;
	pointer-events: none;
	left: 5px;
	top: 10px;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label {
	top: -10px;
	font-size: 14px;
	color: #5264AE;
}

/* BOTTOM BARS ================================= */
.bar {
	position: relative;
	display: block;
	width: 300px;
}

.bar:before, .bar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: 1px;
	position: absolute;
	background: #5264AE;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

.bar:before {
	left: 50%;
}

.bar:after {
	right: 50%;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
	position: absolute;
	height: 60%;
	width: 100px;
	top: 25%;
	left: 0;
	pointer-events: none;
	opacity: 0.5;
}

/* active state */
input:focus ~ .highlight {
	-webkit-animation: inputHighlighter 0.3s ease;
	-moz-animation: inputHighlighter 0.3s ease;
	animation: inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@
-webkit-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
-moz-keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}

}
@
keyframes inputHighlighter {from { background:#5264AE;
	
}

to {
	width: 0;
	background: transparent;
}
}
</style>
<meta charset="UTF-8">
<title>사원번호 찾기</title>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="container">

		<h2>
			사원번호 찾기<small>KH-CAFE</small>
		</h2>

		<form action="/findinfo/findinfo" method="post">
			<div id="searchId">
				<div class="group">
					<input type="text" name="shopNo" id="shopNo" required> <span
						class="highlight"></span> <span class="bar"></span> <label>지점번호</label>

				</div>

				<div class="group">
					<input type="text" name="email" id="email" required> <span
						class="highlight"></span> <span class="bar"></span> <label>Email</label>
				</div>

				<div class="form-group">
					<button type="submit" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-block">확인</button>
					<button type="button" onclick="location.href='/login/main'">취소</button>
				</div>
			</div>
		</form>
		



	</div>
</body>
</html>