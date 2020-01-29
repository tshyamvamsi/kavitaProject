<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cheque Book Request</title>
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

<section id="login" style="margin: 66px;">
	<div class="container" style="width: 100%;height: 100%;">
		<form:form action="createchequebookrequest" method="post" modelAttribute="cheques"  novalidate="novalidate" style="width: 100%;height: 100%;"> 		
 			<h2 class="text-uppercase text-center text-secondary mb-0">Select Number of Cheque leaves needed
 				<form method="post" action ="">
					<select name ="sel">
						<option value="0"></option>
						<option value="100">20</option>
						<option value="200">50</option>
						<option value="300">100</option>
					</select>
				</form>
				
				<!-- 
				<form:select class="form-control" type="text" path="state" id="addr1" required="" placeholder="State">
					<form:option value="100">20</form:option>
					<form:option value="200">50</form:option>
					<form:option value="300">100</form:option>
				</form:select> -->
 			</h2>
 			<hr class="star-dark mb-5">			
 			
 		</form:form>
 		
 				<div class="col-md-12">
			<table class="table table-striped" style = "width: 100%">
				<thead>
					<tr>
						<th scope="col">No of cheque Leaves</th>
						<th scope="col">Charges in Indian Rupees</th>
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>20</td>
						<td>100</td>
					</tr>
					<tr>						
						<td>50</td>
						<td>200</td>
					</tr>
					<tr>						
						<td>100</td>
						<td>300</td>
					</tr>
					
						
				</tbody>
			</table>
		</div>
		
			<%
				String leaves = request.getParameter("sel");
				if(leaves != null) {
					out.println("Selected leaves is " + leaves);
				}
				
			%>		
 	</div>
 </section>                        
                        

</body>
<link rel="stylesheet" href="assets/css/dhanjyothi.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</html>