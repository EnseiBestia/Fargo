package com.fargo.basis.cache;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fargo.basis.cache.cfg.CfgFormInfoCache;
import com.fargo.basis.cache.model.ExtendFormInfo;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.model.LabelValue;
import com.fargo.basis.service.GenericManager;


public class LookUpInfoCache {
	private static Map<String,LookUpInfoCache> lookUpCacheMap=new HashMap<String,LookUpInfoCache>();;
	
	public static LookUpInfoCache getInstance(String name){
		if(!lookUpCacheMap.containsKey(name)){
			LookUpInfoCache cache1=new LookUpInfoCache(name);
			lookUpCacheMap.put(name, cache1);
		}
		return lookUpCacheMap.get(name);
	}
	
	Class<?> formClass;
	
	String formName;
	ExtendFormInfo formInfo;
	Map<Long,String> idNameMap;
	Field nameField=null;
	Field idField=null;
	
	Method nameGetMethod;
	Method idGetMethod;
	public void init(){
		formInfo=CfgFormInfoCache.getInstance().getCfgFormInfoByFormCode(formName);
		formClass=formInfo.getFormClass();
		idField=formInfo.getIdField();
		nameField=formInfo.getNameField();
		idGetMethod=formInfo.getIdGetMethod();
		nameGetMethod=formInfo.getNameGetMethod();
		idNameMap=new HashMap<Long,String>();
	}
	public String getNameById(Long id){
		if(nameField==null){
			return id==null?"":id.toString();
		}else{
			Object obj = null;
			
			GenericManager manager = SpringContext.getApplicationContext().getBean(formName+"Manager", GenericManager.class);
			try{
				obj=manager.get(id);
			}catch(Exception e){};
			
			if(obj!=null){
				String name=null;
				if (nameField.getType().getName().equals(  
	                    java.lang.String.class.getName())) {  
	                // String type  
	                try {  
	                	
	                	name=(String) nameGetMethod.invoke(obj);//执行get方法返回一个Object
	                } catch (IllegalArgumentException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (IllegalAccessException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                }  catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
	            }
				return name;
			}else{
				return null;
			}
	
		}
	
	}
	
	public List<LabelValue> getIdNameList(String filter){
		List<LabelValue> list=new ArrayList<LabelValue>();
		List<?> objlist = null;
		try {
			Session session = SpringContext.getHibernateSession();
			Criteria cri = session.createCriteria(formClass);
			if (StringUtils.isNotBlank(filter)) {
				JSONObject json = JSON.parseObject(filter);
				Set<String> keys = json.keySet();
				for (String key : keys) {
					cri.add(Restrictions.eq(key, json.get(key)));
				}
			}
			objlist=cri.list();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (objlist == null) {
			objlist = SpringContext.getHibernateSession().createCriteria(formClass).list();
		}
		if(objlist!=null && objlist.size()>0){
			if(nameField!=null && nameField.getType().getName().equals(  
                    java.lang.String.class.getName())){
				 try {  
	                	for(Object objone:objlist){
	                		LabelValue label=new LabelValue();
	                		
		                	String name=(String) nameGetMethod.invoke(objone);//执行get方法返回一个Object
		                	
		                	Long id=(Long) idGetMethod.invoke(objone);//执行get方法返回一个Object
	                		label.setLabel(name);
	                		label.setValue(id==null?"":id.toString());
	                		
	                		list.add(label);
	                	}
	                	
	                } catch (IllegalArgumentException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (IllegalAccessException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
				
			}else{
				 try {  
	                	for(Object objone:objlist){
	                		LabelValue label=new LabelValue();
	                		
		                	
		                	Long id=(Long) idGetMethod.invoke(objone);//执行get方法返回一个Object
	                		label.setLabel(id==null?"":id.toString());
	                		label.setValue(id==null?"":id.toString());
	                		
	                		list.add(label);
	                	}
	                	
	                } catch (IllegalArgumentException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (IllegalAccessException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
			}
			
			
		}
		
		return list;
	
	}
	public List<LabelValue> getNotContainsIdNameList(String filter,String dataSource){
		List<LabelValue> list=new ArrayList<LabelValue>();
		List<?> objlist = null;
		try {
			
				Session session  = SpringContext.getHibernateSession();
				Criteria cri  = session.createCriteria(formClass);
				if (StringUtils.isNotBlank(filter)) {
					JSONObject json = JSON.parseObject(filter);
					Set<String> keys = json.keySet();
					for (String key : keys) {
						cri.add(Restrictions.eq(key, json.get(key)));
					}
				}
				objlist=cri.list();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if (objlist == null) {
			objlist = SpringContext.getHibernateSession().createCriteria(formClass).list();
		}
		if(objlist!=null && objlist.size()>0){
			if(nameField!=null && nameField.getType().getName().equals(  
                    java.lang.String.class.getName())){
				 try {  
	                	for(Object objone:objlist){
	                		LabelValue label=new LabelValue();
	                		
		                	String name=(String) nameGetMethod.invoke(objone);//执行get方法返回一个Object
		                	
		                	Long id=(Long) idGetMethod.invoke(objone);//执行get方法返回一个Object
	                		label.setLabel(name);
	                		label.setValue(id==null?"":id.toString());
	                		
	                		list.add(label);
	                	}
	                	
	                } catch (IllegalArgumentException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (IllegalAccessException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
				
			}else{
				 try {  
	                	for(Object objone:objlist){
	                		LabelValue label=new LabelValue();
	                		
		                	
		                	Long id=(Long) idGetMethod.invoke(objone);//执行get方法返回一个Object
	                		label.setLabel(id==null?"":id.toString());
	                		label.setValue(id==null?"":id.toString());
	                		
	                		list.add(label);
	                	}
	                	
	                } catch (IllegalArgumentException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (IllegalAccessException e) {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                } catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
			}
			
			
		}
		
		return list;
	
	}
	public LookUpInfoCache(String name){
		formName=name;
		init();
	}
	
}
