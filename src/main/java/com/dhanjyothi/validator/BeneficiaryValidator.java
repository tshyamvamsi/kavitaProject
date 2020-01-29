package com.dhanjyothi.validator;

import javax.persistence.Column;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.service.AccountService;

@Component
public class BeneficiaryValidator implements Validator {
	
	private static final Logger logger = Logger.getLogger(BeneficiaryValidator.class);
	
	@Autowired
	private AccountService accService;

	public boolean supports(Class<?> clazz) {
		return Beneficiaries.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		Beneficiaries ben = (Beneficiaries) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "beneficiaryNickName",
				"NickNameEmptyMsg", "Nick Name is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "beneficiaryName",
				"PayeeNameEmptyMsg", "Payee Name is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "beneficiaryAccountNumber",
				"PayeeAccNumEmptyMsg", "Acc Num is required");

		if (ben.getBeneficiaryNickName().length() > 100) {
			errors.rejectValue("beneficiaryNickName", "payeeNickNameLength",
					"Max length allowed is 100");
		}
		if (ben.getBeneficiaryName().length() > 100) {
			errors.rejectValue("beneficiaryName", "payeeNameLength",
					"Max length allowed is 100");
		}
		if (ben.getBeneficiaryAccountNumber() == 0) {
			errors.rejectValue("beneficiaryAccountNumber", "payeeAccNumMsg",
					"Account Number does not exist, Please add correct number !!!");
		}

		if (ben.getBeneficiaryType().equalsIgnoreCase("External")) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "beneficiaryBank",
					"BankNameEmptyMsg", "Bank Name is required");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "beneficiaryBankIfsc",
					"IfscEmptyMsg", "Ifsc Code is required");
			if (ben.getBeneficiaryBank().length() > 100) {
				errors.rejectValue("beneficiaryBank", "bankNameMsg",
						"Max length allowed is 100");
			}
			if (ben.getBeneficiaryBankIfsc() == null) {
				errors.rejectValue("beneficiaryBankIfsc", "ifscCodeMsg",
						"Invalid IFSC Code");
			}
		}
		logger.info("*****BenType-->"+ben.getBeneficiaryType());
		
	}

}
