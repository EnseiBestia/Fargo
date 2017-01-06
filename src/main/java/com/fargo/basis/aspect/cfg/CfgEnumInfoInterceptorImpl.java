package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgEnumInfoCache;
import com.fargo.basis.model.CfgEnumInfo;

public class CfgEnumInfoInterceptorImpl implements ModelInterceptorInterface<CfgEnumInfo> {

    @Override
	public void onChange(CfgEnumInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come CfgEnumInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgEnumInfoCache.refresh(CfgEnumInfoCache.class);
	}  
}
