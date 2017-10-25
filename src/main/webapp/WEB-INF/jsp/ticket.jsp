<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ticket | Details</title>
<!-- <link href="static/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="static/css/index.css" rel="stylesheet"> -->
<%-- <link rel="stylesheet" href="<c:url value="/static/css/index.css" />"> --%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

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
		<div class="jumbotron" style="disply:flex;align-content:center;justify-items:center;align-items:center;">

			<br>


			<div class="mx-auto col-md-8">


				<div class="card">
					<div class="card-header">
					<span class="badge badge-primary">
					${ticket.owner.firstname } ${ticket.owner.lastname }
					</span>
					<span class="badge badge-info" style="float: right;">
					<fmt:formatDate value="${ticket.createdAt }"
									var="formattedCreatedAt" type="date" pattern="hh:mm dd/MM/yyyy" />
								${formattedCreatedAt}
					</span>
					</div>
					<div class="card-block">
<!-- 						<h4 class="card-title">Special title treatment</h4> -->
						<p class="card-text">${ticket.body }</p>
					</div>
				</div>
				
				<c:forEach var="message" items="${ ticket.messageList }">
					<br>
					<div class="card">
					<div class="card-header">
					<span class="badge badge-primary">
					${message.user.firstname } ${message.user.lastname }
					</span>
					<span class="badge badge-info" style="float: right;">
					<fmt:formatDate value="${message.createdAt }"
									var="formattedCreatedAt" type="date" pattern="hh:mm dd/MM/yyyy" />
								${formattedCreatedAt}
					</span>
					</div>
					<div class="card-block">
<!-- 						<h4 class="card-title">Special title treatment</h4> -->
						<p class="card-text">${message.body }</p>
					</div>
				</div>
				
				</c:forEach>


			</div>

			<br>
			
			<div class="mx-auto col-md-8" >
			<hr class="my-4">
			
				<form class="form-horizontal" action="/ticket/reply" method="post" >
					<fieldset>

								<textarea class="form-control col-md-12" id="textarea" name="reply"
									rows="6"></textarea>
								<input type="hidden" name="ticketId" value="${ ticket.id }">
								<br>
								<div class="mx-auto col-md-8">
								<button type="submit" id="singlebutton" name="singlebutton"
									class="btn btn-primary  btn-block" aria-label="Single Button">Reply</button>

							</div>


					</fieldset>
				</form>
			</div>
		</div>
	</div>
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


	<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" -->
	<!-- 		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<%-- 	<script src="<c:url value="/static/js/bootstrap.min.js "/>"></script> --%>
</body>
</html>