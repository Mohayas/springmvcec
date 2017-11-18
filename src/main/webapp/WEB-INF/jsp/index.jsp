<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Tickets</title>

<link rel="stylesheet"
	href="<c:url value="/static/css/bootstrap.min.css" />">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

<link rel="stylesheet" href="<c:url value="/static/css/my.css" />">

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
		<div class="jumbotron">
			<h1>All Tickets</h1>
			<hr class="my-4">
			<table id="ticketsTable"
				class="table table-bordered table-hover table-dark table-striped"
				style="border: 1px solid #babdb6;">
				<thead class="thead-dark">
					<tr style="background-color: #f7f7f9; border: 1px solid #babdb6;">
						<th scope="col" style="border: 1px solid #babdb6;">Id</th>
						<th scope="col" style="border: 1px solid #babdb6;">Created By</th>
						<th scope="col" style="border: 1px solid #babdb6;">Subject</th>
						<th scope="col" style="border: 1px solid #babdb6;">Created At</th>
						<th scope="col" style="border: 1px solid #babdb6;">Status</th>
						<th scope="col" style="border: 1px solid #babdb6;">Actions</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ tickets }">

						<tr>

							<td style="border: 1px solid #babdb6;">#${ticket.id }</td>
							<td style="border: 1px solid #babdb6;">${ticket.owner.firstname }&nbsp;${ticket.owner.lastname }</td>
							<td style="border: 1px solid #babdb6;"><a
								href="/ticket/${ ticket.id }">${ticket.subject }</a></td>
							<td style="border: 1px solid #babdb6;"><fmt:formatDate
									value="${ticket.createdAt }" var="formattedCreatedAt"
									type="date" pattern="hh:mm:ss dd/MM/yyyy" />
								${formattedCreatedAt}</td>
							<td style="border: 1px solid #babdb6;">${ticket.status }</td>
							<td style="border: 1px solid #babdb6;"><c:choose>
									<c:when test="${ticket.resolved == true }">
										<a class="btn btn-success col-sm-4 disabled"
											aria-disabled="true" href="/ticket/resolve/${ticket.id}"
											role="button">Resolved</a>
									</c:when>
									<c:otherwise>
										<a class="btn btn-success col-sm-4"
											href="/ticket/resolve/${ticket.id}" role="button">Resolve</a>
									</c:otherwise>
								</c:choose> <c:choose>
									<c:when test="${ticket.closed == true }">
										<a class="btn btn-danger col-sm-4"
											 href="/ticket/reopen/${ticket.id}"
											role="button">Re-open</a>

									</c:when>
									<c:otherwise>
										<a class="btn btn-danger col-sm-4"
											href="/ticket/close/${ticket.id}" role="button"> Close </a>
									</c:otherwise>
								</c:choose></td>

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