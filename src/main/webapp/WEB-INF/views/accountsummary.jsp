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
        <a class="navbar-brand" href="welcome">Welcome ${userName}</a>
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
                    <a class="nav-link" href="logout">Log out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</head>
<body>

<section id="login" style="background-color: #ffffff;margin-top: 65px;">

	<div class="panel panel-primary" style="margin: 20px;">
	<div class="panel-heading">
			<h3 class="text-uppercase text-center text-secondary mb-0">Account Summary</h3>
		</div>
	<div class="panel-body">
		<ul class="nav nav-tabs">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Account <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><c:if test="${not isSavingsAccountExists}">
							<li><a href="createsavingsaccount">Create Savings Account</a></li>
						</c:if> 
						<c:if test="${isSavingsAccountExists}">
							<li><a href="loadtermaccount">Create Term Account</a></li>
						</c:if>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Funds Transfer <span
					class="caret"></span></a>
				<ul class="dropdown-menu">
				    <c:if test="${isSavingsAccountExists}">
							<li><a href="loadbeneficiary">Add Beneficiary</a></li>
							<li><a href="loadtransfer">Fund Transfer</a></li>
					</c:if>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Others <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="chequebook">Cheque Book Request</a></li>
				</ul></li>
		</ul>
		<br>
		<c:if test="${not  isSavingsAccountExists}">
			<p>Kindly Create your Savings Account</p>
		</c:if>
		<c:if test="${isSavingsAccountExists}">
			<h2>Savings Account Details</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Account Number</th>
						<th scope="col">Account Type</th>
						<th scope="col">Account Balance</th>
						<th scope="col">Created Date</th>
						<th scope="col">Updated Date</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">${savingsaccount.accountId}</th>
						<td>${savingsaccount.accountType}</td>
						<td>${savingsaccount.accountBalance}</td>
						<td>${savingsaccount.accountCreatedDate}</td>
						<td>${savingsaccount.accountUpdatedDate}</td>
						<td><a href="viewtransactions">View</a></td>
					</tr>
				</tbody>
			</table>
		</c:if>
		<c:if test="${isTermAccountExists}">
			<h2>Term Account Details</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Account Number</th>
						<th scope="col">Account Type</th>
						<th scope="col">Term AMT</th>
						<th scope="col">Term Tenure</th>
						<th scope="col">Interest</th>
						<th scope="col">Mature Date</th>
						<th scope="col">Created Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${termaccount}" var="term">
						<tr>
							<th scope="row">${term.accountId}</th>
							<td>${term.accountType}</td>
							<td>${term.maturityAmount}</td>
							<td>${term.depositTenure}</td>
							<td>${term.interestRate}</td>
							<td>${term.maturityTenure}</td>
							<td>${term.accountCreatedDate}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	</div>

</section>
</body>
<link rel="stylesheet" href="assets/css/dhanjyothi.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</html>