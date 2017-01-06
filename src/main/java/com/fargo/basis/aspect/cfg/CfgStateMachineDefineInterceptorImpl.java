package com.fargo.basis.aspect.cfg;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.cfg.CfgStateMachineDefineCache;
import com.fargo.basis.model.CfgStateMachineDefine;

public class CfgStateMachineDefineInterceptorImpl implements ModelInterceptorInterface<CfgStateMachineDefine> {

    @Override
	public void onChange(CfgStateMachineDefine t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:CfgStateMachineDefineInterceptorImpl=====[t:"+t+",type:"+type+"]");
		CfgStateMachineDefineCache.refresh(CfgStateMachineDefineCache.class);
	}  
}
