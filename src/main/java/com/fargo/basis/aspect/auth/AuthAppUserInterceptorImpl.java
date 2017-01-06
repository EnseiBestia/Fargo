package com.fargo.basis.aspect.auth;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.auth.AuthAppRoleCache;
import com.fargo.basis.cache.auth.AuthAppUserCache;
import com.fargo.basis.model.AuthAppUser;


public class AuthAppUserInterceptorImpl implements ModelInterceptorInterface<AuthAppUser> {

    @Override
	public void onChange(AuthAppUser t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:AuthAppUserInterceptorImpl=====[t:"+t+",type:"+type+"]");
		AuthAppUserCache.refreshAll();
		AuthAppRoleCache.refreshAll();
	}  
}
