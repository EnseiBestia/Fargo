package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.auth.AuthAppRoleCache;
import com.fargo.basis.cache.auth.AuthAppUserCache;
import com.fargo.basis.cache.cfg.CfgFixedPropertyDefineCache;
import com.fargo.basis.model.CfgFixedPropertyDefine;

public class CfgFixedPropertyDefineInterceptorImpl implements ModelInterceptorInterface<CfgFixedPropertyDefine> {

    @Override
	public void onChange(CfgFixedPropertyDefine t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come CfgFixedPropertyDefineInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgFixedPropertyDefineCache.refreshAll();
		
		AuthAppUserCache.refreshAll();
		AuthAppRoleCache.refreshAll();
	}  
}
