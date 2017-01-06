package com.fargo.basis.cache.cfg;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.criterion.Order;

import com.fargo.basis.cache.model.BaseCache;
import com.fargo.basis.model.AuthShortCutPrivilege;
import com.fargo.basis.util.zx.LongUtil;


public class AuthShortCutPrivilegeCache extends BaseCache<AuthShortCutPrivilege,Long>{
	//private static AuthPrivilegeInfoCache instance;
	
	
	public static  AuthShortCutPrivilegeCache getInstance(){
		return (AuthShortCutPrivilegeCache) getInstance(AuthShortCutPrivilegeCache.class);	
	}
	
	public AuthShortCutPrivilegeCache(){
		super(AuthShortCutPrivilege.class,false);
		init();
	}
	private void init(){
		
		criteria.addOrder(Order.asc("order"));
		List<AuthShortCutPrivilege> list=criteria.list();
		
		if(list!=null){
			for(int i=0;i<list.size();i++){
				map.put(list.get(i).getShortCutId(),list.get(i));
			}
		}
	}

	public List<AuthShortCutPrivilege> getShortCutPrivilegeListForRole(
			List<Long> roleList) {
		// TODO Auto-generated method stub
		
		List<AuthShortCutPrivilege> list=new ArrayList<AuthShortCutPrivilege>();
		if(super.getList()!=null){
			for(AuthShortCutPrivilege one:super.getList()){
				if(ifEqual(roleList,one.getRoleList())){
					list.add(one);
				}
			}	
		}
		
		return list;
	}
		
	private boolean ifEqual(List<Long> roleList1,List<Long> roleList2){
		if(roleList1!=null && roleList2!=null){
			for(Long role1:roleList1){
				for(Long role2:roleList2){
					if(LongUtil.ifEqual(role1,role2)){
						return true;
					}
				}
			}
		}
		return false;
	}
}
