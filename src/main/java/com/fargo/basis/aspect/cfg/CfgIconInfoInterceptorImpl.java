package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.model.CfgIconInfo;

public class CfgIconInfoInterceptorImpl implements ModelInterceptorInterface<CfgIconInfo> {

    @Override
	public void onChange(CfgIconInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgIconInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
	}  
}
