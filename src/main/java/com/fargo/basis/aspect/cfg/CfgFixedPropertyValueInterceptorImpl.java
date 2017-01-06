package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgFixedPropertyDefineCache;
import com.fargo.basis.model.CfgFixedPropertyValue;


public class CfgFixedPropertyValueInterceptorImpl implements ModelInterceptorInterface<CfgFixedPropertyValue> {

    @Override
	public void onChange(CfgFixedPropertyValue t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come CfgFixedPropertyValueInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgFixedPropertyDefineCache.refresh(CfgFixedPropertyDefineCache.class,t.getLibrary());
	}  
}
