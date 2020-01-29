package com.dhanjyothi.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhanjyothi.dao.AdminDao;
import com.dhanjyothi.model.User;

@Repository
public class AdminDaoImpl implements AdminDao {

	private static final Logger logger = Logger.getLogger(AccountDaoImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public List<User> getUserDetails() throws Exception {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		TypedQuery<User> typedQuery = session.createQuery("from User");
		List<User> users = typedQuery.getResultList();
		session.close();
		return users;
	}


	
	  
	public List<User> deleteuserById(String userName) throws Exception { 
		  Session session = sessionFactory.openSession();
			session.beginTransaction();
			// String hql = "DELETE FROM User u WHERE u.userName = :user_id";
			logger.info("******* Inside deleteUserById(int id) of AdmindaoImpl::: before Query*******");
			TypedQuery<User> typedQuery = session.createQuery("from User WHERE user_name = :userName");
			logger.info("******* Inside deleteUserById(int id) of AdmindaoImpl::: AFTER Query*******");
			typedQuery.setParameter("userName", userName);
			
			
			List<User> users = typedQuery.getResultList();
			
			User userResult = typedQuery.getSingleResult();
			session.remove(userResult);
			
			session.close();
			logger.info("******* Inside deleteUserById(int id) of AdmindaoImpl::: Before return*******");
			return users;
	  
	  }
	 
	
	
	
	
	

}
