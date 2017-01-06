package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.common.ConfigureContext;
import com.fargo.basis.model.CfgParameter;


public class CfgParameterInterceptorImpl implements ModelInterceptorInterface<CfgParameter> {

    @Override
	public void onChange(CfgParameter t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgParameterInterceptorImpl=====[t:"+t+",type:"+type+"]");
		ConfigureContext.refreshDbParameters();
	}  
}
