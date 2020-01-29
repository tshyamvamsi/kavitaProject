package com.dhanjyothi.dao.impl;

import java.util.Base64;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.dhanjyothi.dao.LoginDao;
import com.dhanjyothi.model.User;


@Repository("LoginDao")
public class LoginDaoImpl implements LoginDao {
	
	private static final Logger logger = Logger.getLogger(LoginDaoImpl.class);
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public int validateUser(User user) {
		int valid = -1;
		logger.info("Inside Validate Customer Dao");
		logger.info(user.getUserName() + "-" + user.getPassword());
		
		List<User> list = hibernateTemplate.loadAll(User.class);
		logger.info("User List Size" + list.size());

		for (User c : list) {
			logger.info("Inside List Entered --> UserName:::" + user.getUserName() + "::Password:::" + user.getPassword());
			logger.info("Inside List Customer -->" + c.getUserName() + "-" + c.getPassword());

			Base64.Decoder decoder = Base64.getDecoder();
			byte[] decodedByteArrayUser = decoder.decode(user.getPassword());
			byte[] decodedByteArrayC = decoder.decode(c.getPassword());
			logger.info("New Password --> " + new String(decodedByteArrayUser));
			logger.info("condition user.getUserName().equals(c.getUserName()) ??? -->" + user.getUserName().equals(c.getUserName()));
			logger.info("condition new String(decodedByteArray).equals(c.getPassword()) ??? -->" + (new String(decodedByteArrayUser)).equals(new String(decodedByteArrayC)));
			
		
			if (user.getUserName().equals(c.getUserName()) && (new String(decodedByteArrayUser)).equals(new String(decodedByteArrayC))) {
				
				logger.info("Inside if condition user.getUserName().equals(c.getUserName()) ??? -->" + user.getUserName().equals(c.getUserName()));
				logger.info("Inside if condition new String(decodedByteArray).equals(c.getPassword()) ??? -->" + (new String(decodedByteArrayUser)).equals(new String(decodedByteArrayC)));
				
				if (user.getUserName().equals("admin")) {
					
					logger.info("before assigning valid::: Validate Data Admin ???"+valid);
					valid = 0;
					logger.info("after assigning valid::: Validate Data Admin ???"+valid);
					return valid;
				}
				else {
					logger.info("before assigning valid::: Validate Data Customer ???"+valid);
					valid = 1;
					logger.info("after assigning valid::: Validate Data Customer ???"+valid);
					return valid;
				}
			}
			/*
			 * else { logger.info("before assigning valid::: Validate Data None ???"+
			 * valid); valid = -1;
			 * logger.info("after assigning valid::: Validate Data None ???"+valid); //
			 * return valid; }
			 */
			
		}
		logger.info(" valid final result returned:::"+valid);
		return valid;
	}
}