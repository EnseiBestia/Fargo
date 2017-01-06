package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgStateMachineValueCache;
import com.fargo.basis.model.CfgStateMachineValue;

public class CfgStateMachineValueInterceptorImpl implements ModelInterceptorInterface<CfgStateMachineValue> {

    @Override
	public void onChange(CfgStateMachineValue t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgStateMachineValueInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgStateMachineValueCache.refresh(CfgStateMachineValueCache.class);
	}  
}
