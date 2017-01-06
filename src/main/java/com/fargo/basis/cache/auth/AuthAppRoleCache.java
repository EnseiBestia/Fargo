package com.fargo.basis.cache.auth;

import com.fargo.basis.cache.model.BaseCacheByLibrary;
import com.fargo.basis.model.AuthAppRole;



public class AuthAppRoleCache extends BaseCacheByLibrary<AuthAppRole,Long>{
	//private static AuthPrivilegeInfoCache instance;
	
	public static AuthAppRoleCache getInstance(Long library){
		return (AuthAppRoleCache) getInstance(AuthAppRoleCache.class,library);	
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public AuthAppRoleCache(Long library) {
		super(AuthAppRole.class,library,true);
	}
	
}
