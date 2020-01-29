package com.dhanjyothi.dao;

import java.util.List;


import com.dhanjyothi.model.User;

public interface AdminDao {
	

	List<User> getUserDetails() throws Exception;
	
	List<User> deleteuserById(String userName) throws Exception;
	
	

}
