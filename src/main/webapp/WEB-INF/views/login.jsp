<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<jsp:include page="header.jsp" />
</head>
<body>
<section id="login" style="background-color: #ffffff;margin-top: 65px;">
                <div class="container">
                    <h2 class="text-uppercase text-center text-secondary mb-0">Login</h2>
                    <hr class="star-dark mb-5">
                    <div class="form-row">
                        <div class="col-lg-8 mx-auto">
					 <form:form modelAttribute="user" action="submit" method="post" id="loginForm" name="sentMessage" novalidate="novalidate">
						<div class="form-group floating-label-form-group controls mb-0 pb-2 input-group-append">                                      
											<span class="input-group-text">
												<i class="fas fa-user"></i>
											</span>
                                        <form:input type="text" path="userName"  class="form-control" id="username" placeholder="user name" required=""/>
                                        <div class="valid-feedback">Looks good!</div>
                                        <div class="invalid-feedback">Seems, you missed username.</div>
                                    </div>
                              
                                    <div class="form-group floating-label-form-group controls mb-0 pb-2 input-group-append">   
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                        <form:input path="password" class="form-control" type="password" id="password" required="" placeholder="password"/>
                                        <div class="valid-feedback">Looks good!</div>
                                        <div class="invalid-feedback">Seems, you missed username.</div>
                                    </div>
                                <div class="form-group d-flex justify-content-center mt-3 login_container">
                                    <button class="btn btn-primary btn-xl login_btn" id="btnSubmit" type="submit">login</button>
                                </div>
                                <div class="text-center">
                                    <p>Don't have an account ?&nbsp;<a href="signup">Sign Up</a></p>
                                </div>
					</form:form>
				</div>

                </div>
            </section>
</body>
</html>