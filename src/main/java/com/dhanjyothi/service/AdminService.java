package com.dhanjyothi.service;

import java.util.List;
import com.dhanjyothi.model.User;

public interface AdminService {
	
	List<User> getUserDetails() throws Exception;

	List<User> deleteUserById(String userName) throws Exception;
	

}
