package com.fargo.basis.cache.auth;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.fargo.basis.cache.cfg.CfgFormInfoCache;
import com.fargo.basis.cache.cfg.CfgStateMachineDefineCache;
import com.fargo.basis.cache.model.AuthPrivilegeView;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.OrderedMap;
import com.fargo.basis.model.AuthAppRole;
import com.fargo.basis.model.AuthAppUser;
import com.fargo.basis.model.AuthPrivilegeInfo;
import com.fargo.basis.service.auth.AuthAppUserManager;
import com.fargo.basis.util.list.comparator.ComparatorAuthPrivilege;
import com.fargo.basis.util.map.MapUtil;

public class AuthAppUserCache{
	//private static AuthPrivilegeInfoCache instance;
	
	
	protected static volatile Map<String,AuthAppUserCache> instanceMap=new Hashtable<String,AuthAppUserCache>();
	
	public static AuthAppUserCache getInstance(Long userId,Long library){
		synchronized(AuthAppUserCache.class){
			String key=library+"-"+userId;
			
			if(!instanceMap.containsKey(key)){
				instanceMap.put(key, new AuthAppUserCache(userId,library));
			}
			return instanceMap.get(key);
		}
	}
	public static void refresh(Long userId,Long library){
		synchronized(AuthAppUserCache.class){
			String key=library+"-"+userId;
			instanceMap.remove(key);
		}
	}
	public static void refreshAll(){
		synchronized(AuthAppUserCache.class){
			instanceMap.clear();
		}
	}
	////////////////////////////////////////////////////////////////////////////////////
	private AuthAppUserManager authAppUserManager;
	private Long userId;
	private AuthAppUser user;
	
	public AuthAppUser getUser() {
		return user;
	}
	public void setUser(AuthAppUser user) {
		this.user = user;
	}
	private Long library;
	public AuthAppUserCache(Long userId1,Long library1){
		authAppUserManager=(AuthAppUserManager) SpringContext.getApplicationContext().getBean("authAppUserManager");
		userId=userId1;
		library=library1;
		
		init();
	}
	OrderedMap<Long,AuthPrivilegeInfo> privilegeMap=new OrderedMap<Long,AuthPrivilegeInfo>();
	
	List<AuthPrivilegeView> treeList=new ArrayList<AuthPrivilegeView>();
	
	Map<String,List<AuthPrivilegeInfo>> buttonGroupMap=new HashMap<String,List<AuthPrivilegeInfo>>();
	
	
	
	private void init(){
		user=this.authAppUserManager.get(userId);
		List<Long> lroles=user.getRoleList(library);
		if(lroles!=null){
			for(Long roleId:lroles){
				AuthAppRole role=AuthAppRoleCache.getInstance(library).getEntityById(roleId);
				if(role!=null){
					List<Long> prilist=role.getPrivilegeList();
					if(prilist!=null){
						for(Long id1:prilist){
							AuthPrivilegeInfoCache authPrivilegeInfoCache=AuthPrivilegeInfoCache.getInstance();
							AuthPrivilegeInfo p=authPrivilegeInfoCache.getEntityById(id1);
							if(p!=null){
								privilegeMap.put(p.getPrivilegeId(), p);
							}
						}
					}
				}
			}
		}
		initPtree();
	}
	private void initPtree(){
		List<AuthPrivilegeInfo> list=privilegeMap.getList();
    	Map<Long,List<AuthPrivilegeInfo>> map=new HashMap<Long,List<AuthPrivilegeInfo>>();
    	
    	for(int i=0;list!=null && i<list.size();i++){
    		AuthPrivilegeInfo one=list.get(i);
    		if(one.getFormId()!=null && one.getFormId().longValue()!=0){
    			one.setForm(CfgFormInfoCache.getInstance().getEntityById(one.getFormId()));
    		}
    		if(one.getMachineId()!=null && one.getMachineId().longValue()!=0){
    			one.setStateMachineDefine(CfgStateMachineDefineCache.getInstance().getEntityById(one.getMachineId()));
    		}
    	}
    	for(int i=0;list!=null && i<list.size();i++){
    		 MapUtil.appendListEntityToMap(map, list.get(i).getParent(), list.get(i));
    	}
    	initTree(0l,treeList,map);
		
    	for(int i=0;list!=null && i<list.size();i++){
    		AuthPrivilegeInfo one=list.get(i);
    		if(one.isIfButtonGroup()){
    			if(one.getParent()!=null){
    				AuthPrivilegeInfo a1=privilegeMap.get(one.getParent());
    				if(a1!=null && a1.getForm()!=null){
    					MapUtil.appendListEntityToMap(buttonGroupMap, a1.getForm().getFormCode(), one);
    				}
    			}
    		}
    	}
    	//Collections.sort(treeList, new ComparatorAuthPrivilege());
    	sortTree(treeList);
	}
	private void sortTree(List<AuthPrivilegeView> tl){
		Collections.sort(tl, new ComparatorAuthPrivilege());
		if(tl!=null && tl.size()>0){
			for(AuthPrivilegeView one:tl){
				sortTree(one.getChilden());
	    	}
		}
    	
	}
	private void initTree(Long parentId,List<AuthPrivilegeView> array,Map<Long,List<AuthPrivilegeInfo>> map){
    	List<AuthPrivilegeInfo> list1=map.get(parentId);
    	if(list1!=null){
    		for(AuthPrivilegeInfo one:list1){
    			AuthPrivilegeView av=new AuthPrivilegeView();
    			av.setAuthPrivilegeInfo(one);
    			array.add(av);
    			initTree(one.getPrivilegeId(),av.getChilden(),map);
    		}
    	}
    }
	

	public List<AuthPrivilegeView> getTreeList() {
		return treeList;
	}
	
	public List<AuthPrivilegeInfo> getButtonGroupByFormCode(String formName){
		return buttonGroupMap.get(formName);
	}
	
}
