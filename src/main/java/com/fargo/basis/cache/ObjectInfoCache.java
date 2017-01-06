package com.fargo.basis.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.fargo.basis.cache.model.DmObjectBuildIndexInfo;
import com.fargo.basis.cache.model.DmObjectForeignKeyInfo;
import com.fargo.basis.common.Constant;
import com.fargo.basis.common.SpringContext;
import com.fargo.basis.model.DmObjectAttribute;
import com.fargo.basis.model.DmObjectIndex;
import com.fargo.basis.model.DmObjectInfo;
import com.fargo.basis.util.map.MapUtil;
import com.fargo.basis.util.zx.LongUtil;

public class ObjectInfoCache {
	private static Map<Long,ObjectInfoCache> objectInfoCache=new Hashtable<Long,ObjectInfoCache>();
	
	public static ObjectInfoCache getInstance(Long objectInfoId){
		if(!objectInfoCache.containsKey(objectInfoId)){
			ObjectInfoCache c1=new ObjectInfoCache(objectInfoId);
			objectInfoCache.put(objectInfoId, c1);
		}
		return objectInfoCache.get(objectInfoId);
	}
	
	public DmObjectInfo getDmObjectInfo() {
		return dmObjectInfo;
	}
	public void setDmObjectInfo(DmObjectInfo dmObjectInfo) {
		this.dmObjectInfo = dmObjectInfo;
	}
	

	DmObjectInfo dmObjectInfo;
	
	List<DmObjectAttribute> searchAttributList;
	List<DmObjectAttribute> tableShowAttributList;
	
	Map<Long,DmObjectAttribute> dmObjectAttributeMapWithId;
	
	List<DmObjectForeignKeyInfo> childrenObjectList;
	List<DmObjectForeignKeyInfo> operatorHrefObjectList;
	
	List<DmObjectBuildIndexInfo> objectBuildIndexInfoList;
	
	List<DmObjectIndex> objectIndexList;
	Map<Long,DmObjectIndex> dmObjectIndexMapWithIndexId;
	public List<DmObjectAttribute> getSearchAttributList() {
		return searchAttributList;
	}
	public List<DmObjectForeignKeyInfo> getOperatorHrefObjectList() {
		return operatorHrefObjectList;
	}
	public void setOperatorHrefObjectList(List<DmObjectForeignKeyInfo> operatorHrefObjectList) {
		this.operatorHrefObjectList = operatorHrefObjectList;
	}
	public void setSearchAttributList(List<DmObjectAttribute> searchAttributList) {
		this.searchAttributList = searchAttributList;
	}
	public List<DmObjectAttribute> getTableShowAttributList() {
		return tableShowAttributList;
	}
	public void setTableShowAttributList(
			List<DmObjectAttribute> tableShowAttributList) {
		this.tableShowAttributList = tableShowAttributList;
	}
	public Map<Long, DmObjectAttribute> getDmObjectAttributeMapWithId() {
		return dmObjectAttributeMapWithId;
	}



	public void setDmObjectAttributeMapWithId(
			Map<Long, DmObjectAttribute> dmObjectAttributeMapWithId) {
		this.dmObjectAttributeMapWithId = dmObjectAttributeMapWithId;
	}

	public List<DmObjectBuildIndexInfo> getObjectBuildIndexInfoList() {
		return objectBuildIndexInfoList;
	}

	public void setObjectBuildIndexInfoList(
			List<DmObjectBuildIndexInfo> objectBuildIndexInfoList) {
		this.objectBuildIndexInfoList = objectBuildIndexInfoList;
	}

	public void init(Long objectInfoId){
		Session session = SpringContext.getHibernateSession();
		dmObjectInfo=(DmObjectInfo)session.get(DmObjectInfo.class, objectInfoId);
		
		searchAttributList=new ArrayList<DmObjectAttribute>();
		tableShowAttributList=new ArrayList<DmObjectAttribute>();
		dmObjectAttributeMapWithId=new HashMap<Long,DmObjectAttribute>();
		
		if(dmObjectInfo!=null){
			initAttributeObjectLazy(dmObjectInfo);
			//initObjectForeignKey(dmObjectInfo,null);
			if(dmObjectInfo.getAttributeList()!=null){
				for(DmObjectAttribute a1:dmObjectInfo.getAttributeList()){
					dmObjectAttributeMapWithId.put(a1.getObjectAttributeId(), a1);
					
				}
			}
		}
		if(dmObjectInfo.getSearchIdList()!=null){
			for(Long id1:dmObjectInfo.getSearchIdList()){
				if(dmObjectAttributeMapWithId.containsKey(id1)){
					searchAttributList.add(dmObjectAttributeMapWithId.get(id1));
				}
				
			}
		}
		if(dmObjectInfo.getTableShowIdList()!=null){
			for(Long id1:dmObjectInfo.getTableShowIdList()){
				if(dmObjectAttributeMapWithId.containsKey(id1)){
					tableShowAttributList.add(dmObjectAttributeMapWithId.get(id1));
				}
				
			}
		}
		
		childrenObjectList=new ArrayList<DmObjectForeignKeyInfo>();
		
		List<DmObjectInfo> list11=session.createCriteria(DmObjectInfo.class).add(Restrictions.eq("objectModelId", dmObjectInfo.getObjectModelId())).list();
		if(list11!=null){
			for(DmObjectInfo obj1:list11){
				if(obj1.getAttributeList()!=null){
					for(DmObjectAttribute a1:obj1.getAttributeList()){
						if(Constant.OBJECT_ATT_TYPE_OBJECT.equals(a1.getType())){
							if(a1.getObjectInfo()!=null && a1.getObjectInfo().getObjectId()!=null && a1.getObjectInfo().getObjectId().longValue()!=0l){
								if(a1.getObjectInfo().getObjectId().longValue()==dmObjectInfo.getObjectId().longValue()){
									DmObjectForeignKeyInfo obj2=new DmObjectForeignKeyInfo(obj1,a1);
									childrenObjectList.add(obj2);
								}
							}
						}
						
						
					}
				}
			}
		}
		
		operatorHrefObjectList=new ArrayList<DmObjectForeignKeyInfo>();
		if(dmObjectInfo.getOperatorHrefIdList()!=null && childrenObjectList!=null){
			for(Long id1:dmObjectInfo.getOperatorHrefIdList()){
				for(DmObjectForeignKeyInfo do10:childrenObjectList){
					if(LongUtil.ifEqual(id1, do10.getDmObjectAttribute().getObjectAttributeId())){
						operatorHrefObjectList.add(do10);
					}
				}
				
			}
		}
		objectIndexList=this.dmObjectInfo.getIndexList();
		dmObjectIndexMapWithIndexId=new HashMap<Long,DmObjectIndex>();
		indexOfObjectAttributeMap=new HashMap<Long,List<DmObjectIndex>>();
		if(objectIndexList!=null){
			for(DmObjectIndex oneindex:objectIndexList){
				dmObjectIndexMapWithIndexId.put(oneindex.getObjectIndexId(), oneindex);
				
				if(oneindex.getIndexDetail()!=null){
					for(Long indexattid:oneindex.getIndexDetail()){
						MapUtil.appendListEntityToMap(indexOfObjectAttributeMap, indexattid, oneindex);
					}
				}
			}
		}
		initRebuildIndex();
		System.out.println(1111);
    	//initTree("",0l,map);
	}
	Map<Long,List<DmObjectIndex>> indexOfObjectAttributeMap;
	
	private void initRebuildIndex(){
		objectBuildIndexInfoList=new ArrayList<DmObjectBuildIndexInfo>();
			
		Map<Long,DmObjectAttribute> attMap=new HashMap<Long,DmObjectAttribute>();
		for(DmObjectAttribute doab:dmObjectInfo.getAttributeList()){
			attMap.put(doab.getObjectAttributeId(), doab);
		}
		
		fillObject(attMap,null);
	}
	private void fillObject(Map<Long,DmObjectAttribute> attMap,DmObjectBuildIndexInfo parent){
		if(dmObjectInfo.getAttributeList()!=null){
    		for(DmObjectAttribute doab:dmObjectInfo.getAttributeList()){
    			if(doab.isIfHidden() && doab.getExtendsFrom()!=null && attMap.containsKey(doab.getExtendsFrom())){
    				DmObjectAttribute a1=attMap.get(doab.getExtendsFrom());
    				if(a1!=null && (!a1.isIfHidden() && parent==null)){
    					if(a1.getObjectInfo()!=null && doab.getTargetObjAttId()!=null){
    						DmObjectBuildIndexInfo doii=new DmObjectBuildIndexInfo();
    						doii.setDmObjectInfo(dmObjectInfo);
    						doii.setDmObjectAttribute(doab);
    						doii.setExdendsFrom(a1);
    						doii.setTargetObjectId(doab.getObjectInfo()==null?0l:doab.getObjectInfo().getObjectId());
    						doii.setTargetObjectAttributeId(doab.getTargetObjAttId());
    						objectBuildIndexInfoList.add(doii);
    						
    						fillObject(attMap,doii);
    						/*Object result=getObjectForFill(dbobj,a1.getObjectInfo().getObjectId(),doab.getObjectAttributeId(),doab.getTargetObjAttId(),dbobj.get("p"+doab.getExtendsFrom()));
    						if(result!=null){
    			    			dbobj.put("p"+doab.getObjectAttributeId(), result);
    			    			br=true;
    			    			//fillObject(dmObjectInfo,dbobj,attMap,doab.getObjectAttributeId());
    			    		}*/
    					}
    				}else if(a1!=null && a1.isIfHidden() && parent!=null){
    					if(a1.getObjectInfo()!=null && doab.getTargetObjAttId()!=null && LongUtil.ifEqual(a1.getObjectAttributeId(), parent.getDmObjectAttribute())){
    						DmObjectBuildIndexInfo doii=new DmObjectBuildIndexInfo();
    						doii.setDmObjectInfo(dmObjectInfo);
    						doii.setDmObjectAttribute(doab);
    						doii.setExdendsFrom(a1);
    						doii.setTargetObjectId(doab.getObjectInfo().getObjectId());
    						doii.setTargetObjectAttributeId(doab.getTargetObjAttId());
    						objectBuildIndexInfoList.add(doii);
    						
    						fillObject(attMap,doii);
    						
    					}
    				}
    			}
    		}
    	}
	}
	private void initAttributeObjectLazy(DmObjectInfo one){
		if(one.getAttributeList()!=null){
			for(DmObjectAttribute a1:one.getAttributeList()){
				if(Constant.OBJECT_ATT_TYPE_OBJECT.equals(a1.getType())){
					if(a1.getObjectInfo()!=null && a1.getObjectInfo().getObjectId()!=null && a1.getObjectInfo().getObjectId().longValue()!=0l){
						a1.getObjectAttributeName();
						initAttributeObjectLazy(a1.getObjectInfo());
					}
				}
				
				
			}
		}
	}
	
	
	public List<DmObjectIndex> getObjectIndexList() {
		return objectIndexList;
	}
	
	public DmObjectIndex getDmObjectIndexByIndexId(Long indexId){
		return this.dmObjectIndexMapWithIndexId.get(indexId);
	}


	public List<DmObjectForeignKeyInfo> getChildrenObjectList() {
		return childrenObjectList;
	}

	public List<DmObjectIndex> getIndexOfObjectAttributeByAttId(Long attId){
		return indexOfObjectAttributeMap.get(attId);
	}

	public ObjectInfoCache(Long objectInfoId){
		init(objectInfoId);
	}
	
	public static void refresh(Long objectInfoId){
		ObjectInfoCache.objectInfoCache.remove(objectInfoId);
	}
	public static void main(String[] args) {
		ObjectInfoCache.getInstance(4l);
		System.out.println(1);
	}
}
