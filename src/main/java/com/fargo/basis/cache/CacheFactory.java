package com.fargo.basis.cache;

import java.util.HashMap;
import java.util.Map;

public class CacheFactory {
	private static Map<String,Object> instanceMap=new HashMap<String,Object>();
	private static Map<String,Map<Long,Object>> instanceMapWithLibrary=new HashMap<String,Map<Long,Object>>();
	
	/*public static<T,PK> BaseCache<T,PK> getInstance(final Class<T> entityClass){
		if(!instanceMap.containsKey(entityClass.getName())){
			instanceMap.put(entityClass.getName(),new BaseCache<T,PK>(entityClass));
		}
		return (BaseCache<T,PK>) instanceMap.get(entityClass.getName());
	}*/
	
	/*public static StTaskInfoCache getStTaskInfoCache(Long library){
		if(!instanceMap.containsKey(StTaskInfoCache.class.getName())){
			instanceMap.put(StTaskInfoCache.class.getName(),new StTaskInfoCache(library));
		}
		return (StTaskInfoCache) instanceMap.get(StTaskInfoCache.class.getName());
	}
	public static AuthPrivilegeInfoCache getStTaskInfoCache(Long library){
		if(!instanceMap.containsKey(StTaskInfoCache.class.getName())){
			instanceMap.put(StTaskInfoCache.class.getName(),new StTaskInfoCache(library));
		}
		return (StTaskInfoCache) instanceMap.get(StTaskInfoCache.class.getName());
	}*/
	/*public static<T,PK> BaseCache<T,PK> getInstance(final Class<T> entityClass,Long library){
		if(!instanceMap.containsKey(entityClass.getName())){
			instanceMap.put(entityClass.getName(),new BaseCache<T,PK>(entityClass));
		}
		return (BaseCache<T,PK>) instanceMap.get(entityClass.getName());
	}*/
}
