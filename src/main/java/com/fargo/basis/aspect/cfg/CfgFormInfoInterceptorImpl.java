package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgFixedPropertyDefineCache;
import com.fargo.basis.cache.cfg.CfgFormInfoCache;
import com.fargo.basis.model.CfgFormInfo;

public class CfgFormInfoInterceptorImpl implements ModelInterceptorInterface<CfgFormInfo> {

    @Override
	public void onChange(CfgFormInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgFormInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgFixedPropertyDefineCache.refreshAll();
		CfgFormInfoCache.refresh(CfgFormInfoCache.class);
	}  
}
