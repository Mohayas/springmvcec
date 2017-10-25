<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Tickets</title>
<link rel="stylesheet" href="<c:url value="/static/css/index.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<!-- 	<link rel="stylesheet" -->
<%-- 	href="<c:url value="/static/css/bootstrap-datatable.css" />"> --%>
	
<!-- 	<link rel="stylesheet" -->
<!-- 	href="https://cdn.datatables.net/responsive/2.2.0/css/responsive.bootstrap4.min.css" /> -->


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
			<h1>All Tickets</h1>
			<hr class="my-4">
			<br>
			<table id="ticketsTable" class="table table-bordered table-hover table-dark table-striped">
				<thead class="class="thead-dark"">
					<tr>
						<td scope="col">Id</td>
						<td scope="col">Created By</td>
						<td scope="col">Subject</td>
						<td scope="col">Created At</td>
						<td scope="col">Status</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ tickets }">

						<tr>

							<td>#${ticket.id }</td>
							<td>${ticket.owner.firstname } ${ticket.owner.lastname }</td>
							<td><a href="/ticket/${ ticket.id }">${ticket.subject }</a></td>
							<td><fmt:formatDate value="${ticket.createdAt }"
									var="formattedCreatedAt" type="date" pattern="hh:mm dd/MM/yyyy" />
								${formattedCreatedAt}</td>
							<td>${ticket.status }</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

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

	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js">
		
	</script>
	<script>
		$(document).ready(function() {
			$('#ticketsTable').DataTable();
		});
	</script>
</body>
</html>