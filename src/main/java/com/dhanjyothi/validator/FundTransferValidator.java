package com.dhanjyothi.validator;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dhanjyothi.dao.impl.AccountDaoImpl;
import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.service.AccountService;

@Component
public class FundTransferValidator implements Validator {
	
	private static final Logger logger = Logger.getLogger(FundTransferValidator.class);
	
	@Autowired
	private AccountService accService;

	public boolean supports(Class<?> clazz) {
		return Transaction.class.equals(clazz);
	}

	public void validate(Object target, Errors errors) {
		Transaction trans = (Transaction) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "benificiary.beneficiaryId",
				"beneficiaryEmptyMsg", "Beneficiary is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "transactionAmount",
				"transAmtEmptyMsg", "Transaction amount is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "transactionDescription",
				"remarksEmptyMsg", "Pls add description");
		
		if(trans.getBenificiary().getBeneficiaryId()== 0) {
			errors.rejectValue("benificiary.benificiaryId",
				"beneficiaryEmptyMsg", "Invalid Beneficiary");
		}
		
		if(trans.getTransactionAmount() == 0) {
			errors.rejectValue("transactionAmount",
					"transAmtEmptyMsg", "Transaction Amount is not valid");
		}
		
		if(trans.getTransactionDescription() == null) {
			errors.rejectValue("transactionDescription",
					"remarksEmptyMsg", "Please enter Remarks");
		}
		
		try {
			logger.info(accService.checkSavingsAccBalance(trans.getTransactionAmount()));
			if(!accService.checkSavingsAccBalance(trans.getTransactionAmount())) {
				errors.rejectValue("transactionAmount", "transAmtBalValue","Insufficient Balance for fund transfer");
			}
		} catch (Exception e) {
			errors.rejectValue("transactionAmount", "transAmtBalValue","Insufficient Balance for fund transfer");
		}
		
	}

}
