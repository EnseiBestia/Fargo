package com.fargo.basis.aspect.dt;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.model.DmObjectModelInfo;


public class DmObjectModelInfoInterceptorImpl implements ModelInterceptorInterface<DmObjectModelInfo> {

    @Override
	public void onChange(DmObjectModelInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:DmObjectModelInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
		
	}  
}
