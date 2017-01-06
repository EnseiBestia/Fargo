package com.fargo.basis.aspect.auth;
import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.auth.AuthAppRoleCache;
import com.fargo.basis.cache.auth.AuthAppUserCache;
import com.fargo.basis.model.AuthAppRole;


public class AuthAppRoleInterceptorImpl implements ModelInterceptorInterface<AuthAppRole> {

    @Override
	public void onChange(AuthAppRole t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:AuthAppRoleInterceptorImpl=====[t:"+t+",type:"+type+"]");
		AuthAppRoleCache.refreshAll();
		
		AuthAppUserCache.refreshAll();
	}  
}
