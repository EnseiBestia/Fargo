package com.fargo.basis.cache.cfg;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Id;

import com.fargo.basis.service.SysConfig;
import org.appfuse.anno.AnnoInfo;
import org.appfuse.anno.FieldAnnoExtend;

import com.fargo.basis.cache.model.BaseCache;
import com.fargo.basis.cache.model.ExtendFormInfo;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.model.CfgFormInfo;


public class CfgFormInfoCache extends BaseCache<CfgFormInfo,Long>{
	//private static CfgFormInfoCache instance;
	
	public static CfgFormInfoCache getInstance(){
		return (CfgFormInfoCache) getInstance(CfgFormInfoCache.class);	
	}
	
	///////////////////////////////////////////////////////////////////////////////
	
	Map<String,ExtendFormInfo> formMapWithCode=new HashMap<String,ExtendFormInfo>();
	
	Map<String,ExtendFormInfo> formMapWithClass=new HashMap<String,ExtendFormInfo>();
	
	Map<String,ExtendFormInfo> formMapWithId=new HashMap<String,ExtendFormInfo>();
	
	public CfgFormInfoCache() {
		//super(CfgFormInfo.class,false);
		init();
	}
	private void init(){
		List<CfgFormInfo> list2=SpringContext.getHibernateSession().createCriteria(CfgFormInfo.class).list();
		if(list2!=null){
			for(CfgFormInfo one:list2){
				map.put(one.getFormId(), one);
				initOne(one);
			}
		}
		
	}
	public ExtendFormInfo getCfgFormInfoByFormCode(String formCode){
		if(formCode!=null && formCode.length()>0){
			formCode=formCode.substring(0, 1).toLowerCase()+formCode.substring(1);
			return formMapWithCode.get(formCode);
		}
		return null;
	}
	public ExtendFormInfo getCfgFormInfoByClass(Class<?> cl){
		if(cl!=null ){
			return formMapWithClass.get(cl.getName());
		}
		return null;
	}
	private void initOne(CfgFormInfo eform){
		
		ExtendFormInfo form=new ExtendFormInfo(eform);
		
		formMapWithCode.put(eform.getFormCode(), form);
		
		
		List<AnnoInfo> list=new ArrayList<AnnoInfo>();
		
		String formClassName=null;
		if(eform!=null){
			formClassName=eform.getModelClassName();
		}else{
			formClassName=SpringContext.getSystemConfig().getProjectModelPackage()+(eform.getFormCode().substring(0, 1).toUpperCase()+eform.getFormCode().substring(1));
		}
		try {
			Class<?> formClass=Class.forName(formClassName);
			
			form.setFormClass(formClass);
			
			formMapWithClass.put(formClass.getName(), form);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(form.getFormClass()!=null){
			for(Field field:form.getFormClass().getDeclaredFields()){
				Id idmeta = field.getAnnotation(Id.class); 
				if(idmeta!=null){
					Field idField=field;
					form.setIdField(idField);
					try {
						System.out.println("form.getFormClass():"+form.getFormClass());
						PropertyDescriptor pd = new PropertyDescriptor(idField.getName(),form.getFormClass());
						Method idGetMethod = pd.getReadMethod();//获得get方法
						if(idGetMethod!=null){
							form.setIdGetMethod(idGetMethod);
						}
					} catch (IntrospectionException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}
		}
			
		
		if(form.getFormClass()!=null){
			Field[] fs = form.getFormClass().getDeclaredFields(); 
			for(Field f:fs){  
		   	 FieldAnnoExtend meta = f.getAnnotation(FieldAnnoExtend.class);  
		        if(meta!=null){  
		        	AnnoInfo annoInfo=new AnnoInfo(f,meta);
		        	
		        	list.add(annoInfo);
		        }  
		    }  
			form.setFieldAnnoInfoList(list);
			
			for(AnnoInfo one:form.getFieldAnnoInfoList()){
				if(one.isName()){
					Field nameField=one.getField();
					form.setNameField(nameField);
					
					try {
						
						PropertyDescriptor pd = new PropertyDescriptor(nameField.getName(),form.getFormClass());
						Method nameGetMethod = pd.getReadMethod();//获得get方法
						form.setNameGetMethod(nameGetMethod);
					} catch (IntrospectionException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	            	
				}
			}
		}
	}
}
