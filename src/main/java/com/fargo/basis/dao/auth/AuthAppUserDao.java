package com.fargo.basis.dao.auth;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.AuthAppUser;

/**
 * An interface that provides a data management interface to the AuthAppUser table.
 */
public interface AuthAppUserDao extends GenericDao<AuthAppUser, Long> {
	 String PROP_USERNAME = "userName";
	 String PROP_EMAIL = "email";
	 String PROP_PHONENUMBER = "phoneNumber";
public boolean checkExistsProperty(Long userId,String propValue,String propType);
public void saveMainBody(AuthAppUser a0);
}