<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Summary</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<nav class="navbar navbar-light navbar-expand-lg fixed-top" id="loginNav">
    <div class="container">
        <a class="navbar-brand" href="welcome">Welcome Admin</a>
        <button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        	<i class="fa fa-bars"></i>
        </button>
        <div
                class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav navbar-nav ml-auto">
             <li class="nav-item" role="presentation"><a class="nav-link" href="welcome">Home</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="about">About us</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="contact">Contact us</a></li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="logout">LogOut</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</head>
<body>

<section id="adminsummary" style="background-color: #ffffff;margin-top: 65px;">

	<div class="panel panel-primary" style="margin: 20px;">
	<div class="panel-heading">
			<h3 class="panel-title text-uppercase text-center text-secondary mb-0"">LIST OF CUSTOMERS</h3>
		</div>
	<div class="panel-body">
	
	<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">User Id</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">DOB</th>
						<th scope="col">Mobile Number</th>
						<th scope="col">Email Id</th>
						<th scope="col">Aadhar ID</th>
						<th scope="col">Pan</th>
						<th scope="col">City</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${useraccounts}" var="useraccount">
						<tr>
						
							<td>${useraccount.userId}</td>
							<td>${useraccount.firstName}</td>
							<td>${useraccount.lastName}</td>
							<td>${useraccount.dob}</td>
							<td>${useraccount.mobileNumber}</td>
							<td>${useraccount.emailId}</td>
							<td>${useraccount.aadharId}</td>
							<td>${useraccount.pan}</td>
							<td>${useraccount.city}</td> 
   							<td><a href="/DhanajyothiLatestTest/console">Delete</a></td>			
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</section>
</body>
<link rel="stylesheet" href="assets/css/dhanjyothi.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</html>