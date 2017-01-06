package com.fargo.basis.cache.model;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;

import com.fargo.basis.cache.cfg.CfgFormInfoCache;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.OrderedMap;

public class BaseCache<T,PK extends Serializable> {
	
	protected static synchronized void  initIncrease(Class<?> c){
		if(!initSizeMap.containsKey(c)){
			initSizeMap.put(c, 0);
		}
		initSizeMap.put(c, initSizeMap.get(c)+1);
	}
	protected static synchronized void  destroyIncrease(Class<?> c){
		if(!destroySizeMap.containsKey(c)){
			destroySizeMap.put(c, 0);
		}
		destroySizeMap.put(c, destroySizeMap.get(c)+1);
	}
	public static volatile  Map<Class,Integer> initSizeMap=new Hashtable<Class,Integer>();
	public static volatile  Map<Class,Integer> destroySizeMap=new Hashtable<Class,Integer>();
	protected static volatile  Map<Class,Object> instanceMap=new Hashtable<Class,Object>();
	
	protected static  Object getInstance(Class<?> c){
		synchronized(c){
			if(!instanceMap.containsKey(c)){
				try {
					instanceMap.put(c, c.newInstance());
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return instanceMap.get(c);
		}
		
	}
	public static void refresh(Class<?> c){
		synchronized(c){
			if(instanceMap.containsKey(c)){
				destroyIncrease(c);
				instanceMap.remove(c);
			}
		}
	}
//	protected GenericDao<T, PK> dao;
	protected Criteria criteria;
	Class<T> entityClass;
	ExtendFormInfo form;
	public BaseCache(){
	}
	public BaseCache(final Class<T> entityClass1){
		initIncrease(entityClass1);
		criteria = SpringContext.getHibernateSession().createCriteria(entityClass1);
		entityClass=entityClass1;
		form=CfgFormInfoCache.getInstance().getCfgFormInfoByClass(entityClass);
		
		init();
	}
	
	public BaseCache(final Class<T> entityClass1,boolean init){
		initIncrease(entityClass1);
		criteria = SpringContext.getHibernateSession().createCriteria(entityClass1);
		entityClass=entityClass1;
		form=CfgFormInfoCache.getInstance().getCfgFormInfoByClass(entityClass);
		if(init){
			
			init();
		}
		
	}
	
	
	//protected List<T> list=new ArrayList<T>();
	
	protected OrderedMap<PK,T> map=new OrderedMap<PK,T>();
	
	private void init(){
		if(form!=null && form.getIdGetMethod()!=null){
			List<T> list=criteria.list();
			if(list!=null){
				for(int i=0;i<list.size();i++){
					PK id;
					try {
						id = (PK) form.getIdGetMethod().invoke(list.get(i));
						map.put(id,list.get(i));
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			}
		}else{
			throw new RuntimeException("get ids error");
			/*
			List<T> list=criteria.list();
			List<PK> list1=dao.findIds();
			if(list!=null){
				for(int i=0;i<list1.size();i++){
					map.put(list1.get(i),list.get(i));
				}
			}
			*/
		}
		
	}
	
	public List<T> getList(){
		return map.getList();
	}
	
	public T getEntityById(PK key){
		if(map!=null){
			return map.get(key);	
		}else{
			return null;
		}
		
	}
	
}
