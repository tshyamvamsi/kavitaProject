<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<nav class="navbar navbar-light navbar-expand-lg fixed-top" id="loginNav">
    <div class="container">
        <a class="navbar-brand" href="welcome">Welcome ${userName}</a>
        <button data-toggle="collapse" data-target="#navbarResponsive" class="navbar-toggler" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        	<i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="nav navbar-nav ml-auto">
             <li class="nav-item" role="presentation"><a class="nav-link" href="accsummary">Account Summary</a></li>
             	<li class="nav-item" role="presentation"><a class="nav-link" href="loadbeneficiary">Add Beneficiary</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="about">About us</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="contact">Contact us</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="logout">Log out</a>
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
			<h3 class="text-uppercase text-center text-secondary mb-0">Fund Transfer</h3>
		</div>
		<div class="panel-body">
			<form:form action="transferamt" method="post" modelAttribute="transaction">
				<div class="form-group row">
					<div class="col-md-4">
						<label for="benificiary">Beneficiaries </label>

					</div>
					<div class="col-md-4">
						<label for="transactionAmount">Amount </label>
					</div>
					<div class="col-md-4">
						<label for="transactionDescription">Remarks </label>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-4">
						<form:select path="benificiary.beneficiaryId">
							<form:options items="${beneficiariesList}" itemValue="beneficiaryId"
								itemLabel="beneficiaryNickName" />
						</form:select>

					</div>
					<div class="col-md-4">
						<form:input path="transactionAmount" />
						<br />
						<form:errors path="transactionAmount" cssClass="error" />
					</div>
					<div class="col-md-4">
						<form:input path="transactionDescription" />
						<br />
						<form:errors path="transactionDescription" cssClass="error" />
					</div>
				</div>
				<div class="wrapper">
					<button type="reset" class="btn btn-warning">Reset</button>
					<button type="submit" class="btn btn-primary">Transfer</button>
				</div>
		</div>
	</div>
	</form:form>
</section>
</body>
<link rel="stylesheet" href="assets/css/dhanjyothi.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</html>