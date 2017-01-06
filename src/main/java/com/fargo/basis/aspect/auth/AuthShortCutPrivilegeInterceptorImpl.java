package com.fargo.basis.aspect.auth;
import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.auth.AuthAppRoleCache;
import com.fargo.basis.cache.auth.AuthAppUserCache;
import com.fargo.basis.cache.cfg.AuthShortCutPrivilegeCache;
import com.fargo.basis.model.AuthShortCutPrivilege;

public class AuthShortCutPrivilegeInterceptorImpl implements ModelInterceptorInterface<AuthShortCutPrivilege> {

    @Override
	public void onChange(AuthShortCutPrivilege t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:AuthShortCutPrivilegeInterceptorImpl=====[t:"+t+",type:"+type+"]");
		AuthShortCutPrivilegeCache.refresh(AuthShortCutPrivilegeCache.class);
		
		
		AuthAppUserCache.refreshAll();
		AuthAppRoleCache.refreshAll();
	}  
}
