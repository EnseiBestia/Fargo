package com.fargo.basis.aspect.base;

import java.util.Date;

import com.fargo.basis.cache.ehcache.ObjectUpdateMsgCache;
import com.fargo.basis.model.LogModelChangeInfo;



public class ModelInterceptorImpl<T> implements ModelInterceptorInterface<T>{
	public final static int CHANGE_TYPE_SAVE=0;
	public final static int CHANGE_TYPE_REMOVE=1;
	static final int CHANGE_TYPE_INSERT=1;
	static final int CHANGE_TYPE_UPDATE=2;
	
	@Override
	public void onChange(T t, int type) {
		// TODO Auto-generated method stub
		System.out.println("ModelInterceptorImpl"+t+"|"+type);
		LogModelChangeInfo log1=new LogModelChangeInfo();
		log1.setChangeType(type);
	//	log1.setId(SequenceUtil.getNext(LogModelChangeInfo.class));
		log1.setObject(t);
		log1.setTime(new Date());
		log1.setUserId(0l);
		
		
		ObjectUpdateMsgCache.getInstance().set("md_"+type+"_"+log1.getId(), log1);
	}
	
	
}
