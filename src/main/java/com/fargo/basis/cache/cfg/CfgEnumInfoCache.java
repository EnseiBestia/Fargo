package com.fargo.basis.cache.cfg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fargo.basis.cache.model.BaseCache;
import com.fargo.basis.model.CfgEnumInfo;
import com.fargo.basis.model.CfgEnumValueInfo;
import com.fargo.basis.model.CfgStateMachineButton;
import com.fargo.basis.model.CfgStateMachineValue;


public class CfgEnumInfoCache extends BaseCache<CfgEnumInfo,Long>{
	//private static AuthPrivilegeInfoCache instance;
	
	public static CfgEnumInfoCache getInstance(){
		return (CfgEnumInfoCache) getInstance(CfgEnumInfoCache.class);	
	}
	
	///////////////////////////////////////////////////////////////////////////////
	public CfgEnumInfoCache() {
		super(CfgEnumInfo.class);
		init();
	}
	public List<CfgEnumValueInfo> getEnumValueList(String code,Long machineId,String state){
		if(cfgEnumInfoMap.containsKey(code)){
			List<CfgEnumValueInfo> list=new ArrayList<CfgEnumValueInfo>();
			
			CfgEnumInfo cfgEnumInfo=cfgEnumInfoMap.get(code);
			
			CfgStateMachineValue machineValue=CfgStateMachineValueCache.getInstance().getStateMachineValue(machineId, state);
			
			if(machineValue!=null && machineValue.getButtons()!=null){
				
				if(cfgEnumInfo!=null){
					if(cfgEnumInfo.getValues()!=null){
						
						for(CfgEnumValueInfo one:cfgEnumInfo.getValues()){
							if(state!=null && state.equals(one.getFullCode())){
								list.add(one);
							}else{
								for(CfgStateMachineButton button:machineValue.getButtons()){
									if(button.getTargetStat()!=null && button.getTargetStat().equals(one.getFullCode())){
										list.add(one);
									} 
								}
							}
							
						}
						return list;
					}
				}
			}else{
				for(CfgEnumValueInfo one:cfgEnumInfo.getValues()){
					if(state!=null && state.equals(one.getFullCode())){
						list.add(one);
					}
					
				}
				return list;
			}
			
		}
		return null;
	}
	public List<CfgEnumValueInfo> getEnumValueList(String code){
		if(cfgEnumInfoMap.containsKey(code)){
			CfgEnumInfo cfgEnumInfo=cfgEnumInfoMap.get(code);
			if(cfgEnumInfo!=null){
				return cfgEnumInfo.getValues();
			}
		}
		return null;
	}
	private Map<String,String> cfgAllEnumValueMap=new HashMap<String,String>();
	Map<String,CfgEnumInfo> cfgEnumInfoMap=new HashMap<String,CfgEnumInfo>();
	public void init(){
		if(map.getList()!=null){
			for(CfgEnumInfo one:map.getList()){
				for(int j=0;one.getValues()!=null && j<one.getValues().size();j++){
					one.getValues().get(j).setFullCode(one.getEnumCode()+one.getValues().get(j).getCode());
				}
			}
		}
		List<CfgEnumInfo> list2=criteria.list();
		for(int i=0;i<list2.size();i++){
			CfgEnumInfo one=list2.get(i);
			
			for(int j=0;one.getValues()!=null && j<one.getValues().size();j++){
				one.getValues().get(j).setFullCode(one.getEnumCode()+one.getValues().get(j).getCode());				
				cfgAllEnumValueMap.put(one.getValues().get(j).getFullCode(), one.getValues().get(j).getValue());
			}
			cfgEnumInfoMap.put(one.getEnumCode(), one);
		}
	}
	public CfgEnumInfo getCfgEnumInfoById(Long enumId) {
		// TODO Auto-generated method stub
		return map.get(enumId);
	}
	public Map<String, CfgEnumInfo> getCfgEnumInfoMap() {
		// TODO Auto-generated method stub
		return cfgEnumInfoMap;
	}
	public String getEnumValueByEnumCode(String enumCode){
		return cfgAllEnumValueMap.get(enumCode);
	}
	public Map<String, String> getCfgAllEnumValueMap() {
		// TODO Auto-generated method stub
		return cfgAllEnumValueMap;
	}
}
