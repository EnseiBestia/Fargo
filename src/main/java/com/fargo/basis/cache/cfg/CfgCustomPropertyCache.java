package com.fargo.basis.cache.cfg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.fargo.basis.cache.model.BaseCacheByLibrary;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.model.CfgCustomProperty;
import com.fargo.basis.util.map.MapUtil;

public class CfgCustomPropertyCache extends BaseCacheByLibrary<CfgCustomProperty,Long>{
	//private static AuthPrivilegeInfoCache instance;
	
	public static CfgCustomPropertyCache getInstance(Long library){
		return (CfgCustomPropertyCache) getInstance(CfgCustomPropertyCache.class,library);	
	}
	
	///////////////////////////////////////////////////////////////////////////////
	public CfgCustomPropertyCache(Long library) {
		super(CfgCustomProperty.class,library,false);
		init();
	}
	
	public CfgCustomProperty getCfgCustomProperty(Long id){
		return map.get(id);
	}
	public CfgCustomProperty getCfgCustomProperty(String code){
		return defineMapWithCode.get(code);
	}
	
	public List<CfgCustomProperty> getCfgCustomPropertyList(String formCode){
		if(defineMapWithCode.containsKey(formCode)){
			return cfgFixedPropertyWithFormCode.get(defineMapWithCode.get(formCode).getFormInfo().getFormId());
		}else{
			return new ArrayList<CfgCustomProperty>();
		}
		
	}
	
	
	Map<Long,List<CfgCustomProperty>> cfgFixedPropertyWithFormCode=new HashMap<Long,List<CfgCustomProperty>>();

	Map<String,CfgCustomProperty> defineMapWithCode=new HashMap<String,CfgCustomProperty>();
	public void init(){
		Session session = SpringContext.getHibernateSession();
		Criteria cri = session.createCriteria(CfgCustomProperty.class);
		List<CfgCustomProperty> list=cri.list();
		if(list!=null){
			for(CfgCustomProperty one:list){
				map.put(one.getPropertyId(), one);
				defineMapWithCode.put(one.getPropertyCode(), one);
				if(one.getFormInfo()!=null){
					MapUtil.appendListEntityToMap(cfgFixedPropertyWithFormCode, one.getFormInfo().getFormId(), one);
				}
				
				//init(one);
			}
		}
		
	}
	}
