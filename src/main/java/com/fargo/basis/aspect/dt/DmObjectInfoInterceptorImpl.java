

package com.fargo.basis.aspect.dt;

import com.fargo.basis.aspect.base.ModelInterceptorInterface;
import com.fargo.basis.cache.ObjectInfoCache;
import com.fargo.basis.model.DmObjectInfo;

public class DmObjectInfoInterceptorImpl implements ModelInterceptorInterface<DmObjectInfo> {

    @Override
	public void onChange(DmObjectInfo t, int type) {
		// TODO Auto-generated method stub
		System.out.println("======come here:DmObjectInfoInterceptorImpl=====[t:"+t+",type:"+type+"]");
		ObjectInfoCache.refresh(t.getObjectId());
	}  
}
