package com.dhanjyothi.validator;

import javax.persistence.NoResultException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dhanjyothi.model.User;
import com.dhanjyothi.service.AccountService;

@Component
public class RegistrationValidator implements Validator {
	
	private static final Logger logger = Logger.getLogger(RegistrationValidator.class);

	@Autowired
	private AccountService accService;

	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		logger.info("Inside Validate Method");
		final String onlyAlphabetsRegex = "[a-zA-Z]+";
		final String onlyAlphaNumericRegex = "^[A-Za-z0-9!@#$%^&:,* ]*$";
		final String addressRegex = "^[a-zA-Z0-9\\S,]*$";
		final String onlyNumericRegex = "[0-9]+";
		final String VALID_EMAIL_ADDRESS_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
		final String passwordRegex = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

		User user = (User) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName",
				"firstNameEmpty", "First Name can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName",
				"lastNameEmpty", "Last Name can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dob",
				"dateOfBirthEmpty", "DOB is mandatory");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressLine1",
				"addressLine1Empty", "Address can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "cityEmpty",
				"City is mandatory");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "state",
				"stateEmpty", "Please select State");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pin", "pinEmpty",
				"PIN is mandatory");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mobileNumber",
				"mobileNumberEmpty", "Mobile  can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "emailId",
				"emailEmpty", "Email can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName",
				"userNameEmpty", "User Name can't be empty and is mandatory");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
				"passwordEmpty", "Password  can't be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
				"confirmPasswordEmpty", "Confirm Password  can't be empty");
		ValidationUtils.rejectIfEmpty(errors, "dobProof", "dobErr","DOB Proof is Mandatory");
		ValidationUtils.rejectIfEmpty(errors, "addressProof", "addErr","Address Proof is Mandatory");
		ValidationUtils.rejectIfEmpty(errors, "aadharProof", "aadErr","Aadhar is Mandatory");
		ValidationUtils.rejectIfEmpty(errors, "panProof", "panErr","Pan is Mandatory");

		if (user.getFirstName().length() > 100) {
			errors.rejectValue("firstName", "firstNameLen",
					"Max Chars allowed is 100");
		}

		if (user.getLastName().length() > 100) {
			errors.rejectValue("lastName", "lastNameLen",
					"Max Chars allowed is 100");
		}

		if (user.getAddressLine1().length() > 200) {
			errors.rejectValue("addressLine1", "addressLine1Len",
					"Max Chars allowed is 200");
		}

		if (null != user.getAddressLine2()
				&& user.getAddressLine2().length() > 200) {
			errors.rejectValue("addressLine2", "addressLine2Len",
					"Max Chars allowed is 200");
		}

		if (user.getCity().length() > 50) {
			errors.rejectValue("city", "cityLen", "Max Chars allowed is 50");
		}

		if (user.getState().length() > 50) {
			errors.rejectValue("state", "stateLen", "Max Chars allowed is 50");
		}

		if (user.getPin().length() != 6) {
			errors.rejectValue("pin", "pinLen", "Max Chars allowed is 6");
		}

		if (user.getMobileNumber().length() != 10) {
			errors.rejectValue("mobileNumber", "mobileNumberLen",
					"Max Chars allowed is 10");
		}

		if (user.getEmailId().length() > 50) {
			errors.rejectValue("emailId", "emailLen", "Max Chars allowed is 50");
		}

		if (null != user.getAadharId() && user.getAadharId().length() != 12) {
			errors.rejectValue("aadharId", "aadharLen", "Invalid Aadhar Number");
		}

		if (null != user.getPan() && user.getPan().length() != 10) {
			errors.rejectValue("pan", "panLen", "Invalid Pan Number");
		}

		if (user.getUserName().length() < 8 || user.getUserName().length() > 15) {
			errors.rejectValue("userName", "userNameLen",
					"User Name Should be between 8 - 15 Characters");
		}

		if (user.getPassword().length() < 8 || user.getPassword().length() > 15) {
			errors.rejectValue("password", "passwordLen",
					"Password Should be between 8 - 15 Characters");
		}

		if (!user.getPassword().equals(user.getConfirmPassword())) {
			errors.rejectValue("password", "passwordMismatch",
					"Passwords Doesn't Match");
		}

		if (!user.getFirstName().trim().matches(onlyAlphabetsRegex)) {
			errors.rejectValue("firstName", "firstNameReg",
					"Only Alphabets allowed");
		}

		if (!user.getLastName().trim().matches(onlyAlphabetsRegex)) {
			errors.rejectValue("lastName", "lastNameReg",
					"Only Alphabets allowed");
		}

		if (!user.getAddressLine1().trim().matches(onlyAlphaNumericRegex)) {
			errors.rejectValue("addressLine1", "addressLine1Reg",
					"Only Alpha Numeric allowed");
		}

		if (!user.getAddressLine2().trim().matches(onlyAlphaNumericRegex)) {
			errors.rejectValue("addressLine2", "addressLine1Re2",
					"Only Alpha Numeric allowed");
		}

		if (!user.getCity().trim().matches(onlyAlphabetsRegex)) {
			errors.rejectValue("city", "cityReg", "Only Alphabets allowed");
		}

		if (!user.getState().trim().matches(onlyAlphabetsRegex)) {
			errors.rejectValue("state", "stateReg", "Only Alphabets allowed");
		}

		if (!user.getPin().trim().matches(onlyNumericRegex)
				|| user.getPin().equals("000000")) {
			errors.rejectValue("pin", "pinReg", "Invalid Pin Number");
		}

		if (!user.getMobileNumber().trim().matches(onlyNumericRegex)
				|| user.getPin().equals("0000000000")) {
			errors.rejectValue("mobileNumber", "mobileNumberReg",
					"Invalid Mobile Number");
		}

		if (!user.getEmailId().trim().matches(VALID_EMAIL_ADDRESS_REGEX)) {
			errors.rejectValue("emailId", "emailReg", "Invalid Email");
		}

		if (!user.getAadharId().trim().matches(onlyNumericRegex)
				|| user.getAadharId().equals("0000000000000000")) {
			errors.rejectValue("aadharId", "aadharReg", "Invalid Aadhar Number");
		}

		if (!user.getPan().trim().matches(onlyAlphaNumericRegex)) {
			errors.rejectValue("pan", "panrReg", "Invalid Pan Number");
		}
		
		if (!user.getUserName().trim().matches(onlyAlphaNumericRegex)) {
			errors.rejectValue("", "Reg", "Invalid User name");
		}

		if (!user.getPassword().matches(passwordRegex)) {
			errors.rejectValue(
					"password",
					"passwordReg",
					"Password Should Contain atleast One Upper Case One Digit One Special Character");
		}
		
		try {
			logger.info("User Name Check"+accService.isUserNameExists(user.getUserName()));
			
		} catch (NoResultException e) {
			logger.error("Exception occur ",e);
		} catch (Exception e) {
			logger.error("User Name Already Exists",e);
		}
		

	}
}
