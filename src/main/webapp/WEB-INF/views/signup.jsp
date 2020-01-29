<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DhanJyothi Banking Application</title>
<jsp:include page="header.jsp" />
<style type="text/css">
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>
<section id="login" style="margin: 66px;">
                    <div class="container" style="width: 100%;height: 100%;">
                        <h2 class="text-uppercase text-center text-secondary mb-0">customer registration</h2>
                        <hr class="star-dark mb-5">
						<form:form modelAttribute="user" action="save" method="post" enctype="multipart/form-data" name="sentMessage" id="signupForm" novalidate="novalidate"   style="width: 100%;height: 100%;">
                            <div class="form-row" style="width: 100%;height: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 col-md-12  mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>First Name</label>
											 <form:input class="form-control" type="text" path="firstName" id="first_name" required="" placeholder="first name"/>
											 <form:errors path="firstName" cssClass="error"/>                                            
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed first name.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 col-md-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>LastName</label>
											<form:input class="form-control"  type="text"  path="lastName"  id="last_name" required="" placeholder="last name"/>
											<form:errors path="lastName" cssClass="error"/> 
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed last name.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 col-md-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>DOB</label>
											<form:input class="form-control" type="date"  path="dob"  id="dob" required="" placeholder="MM/DD/YYYY"/>
											<form:errors path="dob" cssClass="error"/>
											<div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Date should be of format MM/DD/YY.</div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Address Line 1</label>
											<form:input class="form-control" type="text" path="addressLine1" id="addr1" required="" placeholder="Address Line 1"/>
											<form:errors path="addressLine1" cssClass="error"/>
											<div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed Address Line 1.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Address Line 2</label>
											<form:input class="form-control" type="text" path="addressLine2" id="addr2"  placeholder="Address Line 2"/>
											<form:errors path="addressLine2" cssClass="error"/>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>City</label>
											<form:input class="form-control"  type="text" path="city" id="city" required="" placeholder="City" />
											<form:errors path="city" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed City.</div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>State</label>
											<form:select class="form-control" type="text" path="state" id="state" required="" placeholder="State">
												<form:option value="tn">Tamil Nadu</form:option>
												<form:option value="ap">Andhra Pradesh</form:option>
												<form:option value="ka">Karnataka</form:option>
												<form:option value="kl">Kerala</form:option>
											</form:select>
											<form:errors path="state" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed State.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>PinCode</label>
											<form:input class="form-control" type="text" path="pin" id="city" required="" placeholder="Pincode" />
											<form:errors path="pin" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Enter 6 character pincode.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Mobile Number</label>
                                            <form:input class="form-control" type="tel" path="mobileNumber" id="mobileNumber" required="" maxlength="10" pattern="[0-9]{10}" placeholder="enter 10 digits" />
											<form:errors path="pin" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Enter valid 10 digit number.</div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Email</label>
                                            <form:input type="email" path="emailId" class="form-control"  id="email" required="" placeholder="valid email ID" />
											<form:errors path="emailId" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Enter email in correct format.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Aadhar #<br></label>
                                            <form:input class="form-control"  type="text" path="aadharId"  id="aadhar" required=""  maxlength="12" pattern="[0-9]{12}" placeholder="12-digit UID number" />
											<form:errors path="aadharId" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Enter valid 12 digit Aadhar number.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>PAN #</label>                                            
                                            <form:input class="form-control" type="text" path="pan" id="panNumber" required=""  maxlength="10" pattern="[A-Z0-9]{10}" placeholder="10-digit valid alphanumeric number" />
											<form:errors path="pan" cssClass="error"/>
                                            <div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Enater valid 10 Alphanumeric Pan number.</div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Username</label>
											<form:input class="form-control" type="text" path="userName" id="username" required="" placeholder="new username" />
                                            <form:errors path="userName" cssClass="error"/>
											<div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Seems, you missed username.</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Password<br></label>
                                            <form:input type="password" path="password" class="form-control"  id="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" placeholder="8-15 Char, 1 UpperCase, 1 Digit, 1 Special char" />
                                            <form:errors path="password" cssClass="error"/>
											<div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Requirement: 8-15 Char, 1 UpperCase, 1 Digit, 1 Special char</div>
                                        </div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                            <label>Confirm Password</label>
                                            <form:input path="confirmPassword" class="form-control" type="password" id="password" required="" placeholder="Please enter the same password" />
                                            <form:errors path="confirmPassword" cssClass="error"/>
											<div class="valid-feedback">Looks good!</div>
                                            <div class="invalid-feedback">Requirement: 8-15 Char, 1 UpperCase, 1 Digit, 1 Special char</div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>DOB Proof</label></div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group">
									<form:input type="file" path="dobProof" accept="application/pdf,image/jpg,image/jpeg" />
									<form:errors path="dobProof" cssClass="error"/>
									</div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Eg: Passport, Birth Certificate in PDF, JPG, JPEG format</label></div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Address Proof</label></div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group">
									<form:input type="file" path="addressProof" accept="application/pdf,image/jpg,image/jpeg"  />
									<form:errors path="addressProof" cssClass="error"/>
									</div>
                                </div>
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Eg: License, Voter ID in PDF, JPG, JPEG format</label></div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 col-sm-12 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Aadhar Proof</label></div>
                                </div>
                                <div class="col-lg-3 col-xl-3 mx-auto" style="width: 100%;">
                                    <div class="control-group">
									<input type="file">
									<form:input type="file" path="aadharProof" accept="application/pdf,image/jpg,image/jpeg"  />
									<form:errors path="aadharProof" cssClass="error"/>
									</div>
                                </div>
                                <div class="col-lg-3 col-xl-3 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Eg: Upload Aadhar in PDF, JPG, JPEG format only</label></div>
                                </div>
                            </div>
                            <div class="form-row" style="width: 100%;">
                                <div class="col-lg-3 col-xl-3 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>PanProof</label></div>
                                </div>
                                <div class="col-lg-3 col-xl-3 mx-auto" style="width: 100%;">
                                    <div class="control-group">
									<form:input type="file" path="panProof" accept="application/pdf,image/jpg,image/jpeg"  />
									<form:errors path="panProof" cssClass="error"/>
									</div>
                                </div>
                                <div class="col-lg-3 col-xl-3 mx-auto" style="width: 100%;">
                                    <div class="control-group"><label>Eg: Upload Aadhar in PDF, JPG, JPEG format only</label></div>
                                </div>
                            </div>
							<div class="col-md-4">
								<form:input type="hidden" path="userStatus"/><br />
								<form:errors path="userStatus" cssClass="error"/>
							</div>
								<div class="col-md-4">
								<form:input type="hidden" path="userRole"/><br />
								<form:errors path="userRole" cssClass="error"/>
							</div>
                            <div class="text-center form-group" style="width: 100%;">
                            	<button type="reset" class="btn btn-warning text-justify text-sm-center text-md-center text-lg-center text-xl-center btn-xl">Reset</button>
								<button type="submit" class="btn btn-primary text-justify text-sm-center text-md-center text-lg-center text-xl-center btn-xl" id="btnSubmit" ">Register</button>
                            </div>
                        </form:form>
                    </div>
                </section>
</body>
</html>