<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Signin</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<%-- <link rel="stylesheet" href="<c:url value="/static/css/signin.css" /> "> --%>
<link rel="stylesheet" href="../static/css/signin.css" />

</head>

<body>

	<div class="container">
		<div class="mx-auto col-md-5">
			<div class="card">
				<div class="card-header">
					<h2 class="card-title">
						Please sign in
					</h2>
				</div>
				<div class="card-block">
					<!-- 						<h4 class="card-title">Special title treatment</h4> -->




					<form class="form-signin" action="/doSignin" method="post">
						<label for="Username" class="sr-only">Username</label> <input
							type="text" id="inputEmail" class="form-control"
							placeholder="Username" name="username" required autofocus>
						<label for="inputPassword" class="sr-only">Password</label> <input
							type="password" id="inputPassword" name="password"
							class="form-control" placeholder="Password" required>
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								Remember me
							</label>
						</div>
						<c:if test="${! empty signinError }">
							<div class="alert alert-danger" role="alert" style="font-size: 10px;">
								<strong>Oh snap!</strong> The username/password is not correct !
							</div>
						</c:if>

						<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
							in</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>
</body>
</html>