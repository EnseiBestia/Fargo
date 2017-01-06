package com.fargo.basis.aspect.auth;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.model.AuthOrgUser;

public class AuthOrgUserInterceptorImpl implements ModelInterceptorInterface<AuthOrgUser> {

    @Override
	public void onChange(AuthOrgUser t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:AuthOrgUserInterceptorImpl=====[t:"+t+",type:"+type+"]");
	}  
}
