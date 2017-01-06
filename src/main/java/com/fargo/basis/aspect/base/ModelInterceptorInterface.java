package com.fargo.basis.aspect.base;

public interface ModelInterceptorInterface<T> {
	
	public void onChange(T t,int type);
		
}
