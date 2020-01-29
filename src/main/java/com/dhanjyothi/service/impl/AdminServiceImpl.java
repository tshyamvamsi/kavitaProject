package com.dhanjyothi.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhanjyothi.dao.AdminDao;
import com.dhanjyothi.dao.impl.AccountDaoImpl;
import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.User;
import com.dhanjyothi.service.AdminService;
import com.dhanjyothi.util.DhanJyothiUtil;

@Service
public class AdminServiceImpl implements AdminService{
	private static final Logger logger = Logger.getLogger(AdminServiceImpl.class);
	
	@Autowired
	public AdminDao adminDao;
	
	@Override
	public List<User> getUserDetails() throws Exception {
		
		return adminDao.getUserDetails();
	}

	@Override
	public List<User>  deleteUserById(String userName) throws Exception {
		
		logger.info("******* Inside deleteUserById(int id) of AdminServiceImpl*******");
		adminDao.deleteuserById(userName);
		logger.info("******* Inside deleteUserById(int id) of AdminServiceImpl::: after adminDao.deleteuserById(id)*******");
		return adminDao.getUserDetails();
		
	}
	
	

}
