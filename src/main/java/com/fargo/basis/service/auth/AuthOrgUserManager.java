package com.fargo.basis.service.auth;


import com.fargo.basis.model.AuthOrgUser;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface AuthOrgUserManager extends GenericManager<AuthOrgUser, Long> {
    public void saveMainBody(AuthOrgUser a0);
    
    public Boolean checkUniqueIndexForUserName(Long userId, String userName);

	public Boolean checkUniqueIndexForEmail(Long userId,String email);

	public Boolean checkUniqueIndexForPhoneNumber(Long userId,String phoneNumber);
	
	public AuthOrgUser getAuthOrgUserByObjectId(Long objectInfoId,Long objectId);
}