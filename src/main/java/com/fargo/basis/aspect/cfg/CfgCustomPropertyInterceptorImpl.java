package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgFixedPropertyDefineCache;
import com.fargo.basis.model.CfgCustomProperty;

public class CfgCustomPropertyInterceptorImpl implements ModelInterceptorInterface<CfgCustomProperty> {

    @Override
	public void onChange(CfgCustomProperty t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgCustomPropertyInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgFixedPropertyDefineCache.refresh(CfgFixedPropertyDefineCache.class,t.getLibrary());
	}  
}
