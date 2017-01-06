package com.fargo.basis.service.auth;


import java.util.List;

import com.fargo.basis.model.AuthAppUser;
import com.fargo.basis.model.AuthUserLibraryRole;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface AuthAppUserManager extends GenericManager<AuthAppUser, Long> {
    public void saveMainBody(AuthAppUser a0);

	public Boolean checkUniqueIndexForUserName(Long userId, String userName);

	public Boolean checkUniqueIndexForEmail(Long userId,String email);

	public Boolean checkUniqueIndexForPhoneNumber(Long userId,String phoneNumber);
	
	public AuthAppUser saveForChangePassword(AuthAppUser user);
	
	public String getEncoderedPasword(String password);
	
	public AuthAppUser libraryRoleSave(AuthAppUser user);

	public void saveAuthUserLibraryRole(AuthAppUser authAppUser,
			List<AuthUserLibraryRole> list);
	AuthAppUser save(AuthAppUser user,boolean ifNew);
}