package com.fargo.basis.aspect.auth;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.auth.AuthAppRoleCache;
import com.fargo.basis.cache.auth.AuthAppUserCache;
import com.fargo.basis.cache.auth.AuthPrivilegeInfoCache;
import com.fargo.basis.model.AuthPrivilegeInfo;

public class AuthPrivilegeInfoInterceptorImpl implements ModelInterceptorInterface<AuthPrivilegeInfo> {

    @Override
	public void onChange(AuthPrivilegeInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:AuthPrivilegeInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
		AuthPrivilegeInfoCache.refresh(AuthPrivilegeInfoCache.class);
		
		AuthAppUserCache.refreshAll();
		AuthAppRoleCache.refreshAll();
	}  
}
