<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ticket | New</title>
<!-- <link href="static/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="static/css/index.css" rel="stylesheet"> -->
<link rel="stylesheet" href="<c:url value="/static/css/index.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/css/bootstrap.min.css" />">

<!-- Custom styles for this template -->

</head>

<body>

	<nav
		class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarCollapse"
		aria-controls="navbarCollapse" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="/tickets">Tickets</a>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="/ticket/new">New Ticket <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
		<form class="form-inline mt-2 mt-md-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav>
	<div class="container">
		<div class="jumbotron">

			<br>

			<form class="form-horizontal" action="/ticket/add" method="post">
				<fieldset>


					<!-- change col-sm-N to reflect how you would like your column spacing (http://getbootstrap.com/css/#forms-control-sizes) -->


					<!-- Form Name -->
					<legend>New Ticket</legend>

					<!-- Text input http://getbootstrap.com/css/#forms -->
					<div class="form-group">
						<label for="textinput" class="control-label col-sm-2">Subject</label>
						<div class="col-sm-10">
							<input class="form-control" id="textinput" name="subject"
								placeholder="placeholder" type="text">

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="textarea">Description</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="textarea" name="body" rows="6"></textarea>

						</div>
					</div>


					<div class="form-group">
						<label for="fileinput" class="control-label col-sm-2">Screenshot</label>
						<div class="col-sm-10">
							<input id="fileinput" name="fileinput" disabled="" type="file">
							<input type="hidden" name="userId" value="1">

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="singlebutton">Single
							Button</label>
						<div class="text-center col-sm-10">
							<button type="submit" id="singlebutton" name="singlebutton"
								class="btn btn-primary" aria-label="Single Button">Submit
								ticket</button>

						</div>
					</div>


				</fieldset>
			</form>



		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js "/>"></script>
</body>
</html>