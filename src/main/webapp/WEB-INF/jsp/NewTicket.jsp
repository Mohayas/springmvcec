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
	<div class="collapse navbar-collapse mx-auto col-md-10" id="navbarCollapse">
			<ul class="navbar-nav mx-auto" style="margin-left: 0px !important;">
				<li class="nav-item  text-center"><a class="nav-link"
					href="/tickets">All Tickets</a></li>
				<li class="nav-item  text-center"><a class="nav-link"
					href="/ticket/new">+ New Ticket</a></li>
				<li class="nav-item text-center"><a class="nav-link" href="#">Statistics</a></li>
			</ul>
			
			 <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      ${user.firstname}&nbsp;${user.lastname}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Edit</a>
                        <a class="dropdown-item" href="/doSignout">Sign out</a>
                    </div>
                </li>
                
            </ul>

	</div>
	</nav>
	

	<div class="container">
		<div class="jumbotron"
		style="disply: flex; align-content: center; justify-items: center; align-items: center;">			
			<div class="mx-auto col-md-8">
			<form class="form-horizontal" action="/ticket/add" method="post">
				<fieldset>

					<legend><h1>New Ticket</h1></legend>
					<hr class="my-4">
					
					<div class="form-group">
						<label for="textinput" class="control-label col-sm-2">Subject</label>
						<div class="col-sm-10">
							<input class="form-control" id="textinput" name="subject"
								placeholder="Subject" type="text">

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="textarea">Description</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="textarea" name="body" rows="6"></textarea>

						</div>
					</div>


					<div class="form-group">
						<label for="fileinput" class="control-label col-sm-2">Attachments</label>
						<div class="col-sm-10">
							<input id="fileinput" name="fileinput" disabled="" type="file">
							<input type="hidden" name="userId" value="1">

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="singlebutton">
						</label>
						<div class="text-center col-sm-10">
							<button type="submit" id="submitticketbutton" name="submitticketbutton"
								class="btn btn-primary" aria-label="Single Button">Submit
								ticket</button>

						</div>
					</div>


				</fieldset>
			</form>


			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/static/js/bootstrap.min.js "/>"></script>
</body>
</html>