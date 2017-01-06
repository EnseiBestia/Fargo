package com.fargo.basis.cache.cfg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.fargo.basis.common.SpringContext;
import com.fargo.basis.model.DmObjectInfo;
import com.fargo.basis.model.DmObjectModelInfo;
import com.fargo.basis.model.LibraryInfo;
import com.fargo.basis.util.zx.LongUtil;



public class LibraryInfoCache {
	private static LibraryInfoCache libraryInfoCache;
	
	public static LibraryInfoCache getInstance(){
		if(libraryInfoCache==null){
			libraryInfoCache=new LibraryInfoCache();
		}
		return libraryInfoCache;
	}
	
	Map<String,LibraryInfo> libraryInfoMapWithPath=new HashMap<String,LibraryInfo>();
	Map<Long,LibraryInfo> libraryInfoMapWithId=new HashMap<Long,LibraryInfo>();
	
	Map<Long,DmObjectModelInfo> dmObjectModelInfoMAPWithLibraryId=new HashMap<Long,DmObjectModelInfo>();
	Map<Long,List<DmObjectInfo>> dmObjectListMAPWithLibraryId=new HashMap<Long,List<DmObjectInfo>>();
	
	public DmObjectModelInfo getDmObjectModelInfoByPath(String path){
		LibraryInfo library=libraryInfoMapWithPath.get(path);
		if(library!=null){
			return dmObjectModelInfoMAPWithLibraryId.get(library.getLibraryId());
		}
		return null;
	}
	public List<DmObjectInfo> getObjectListByPath(String path){
		LibraryInfo library=libraryInfoMapWithPath.get(path);
		if(library!=null){
			return dmObjectListMAPWithLibraryId.get(library.getLibraryId());
		}
		return null;
	}
	
	public LibraryInfo getLibraryInfoByPath(String path){
		return libraryInfoMapWithPath.get(path);
	}
	
	public LibraryInfo getLibraryInfoById(Long id){
		return libraryInfoMapWithId.get(id);
	}
	public Long getLibraryIdByPath(String path){
		return libraryInfoMapWithPath.get(path)==null?0l:libraryInfoMapWithPath.get(path).getLibraryId();
	}
	public void init(){
		List<LibraryInfo> list1=SpringContext.getHibernateSession().createCriteria(LibraryInfo.class).list();
		Session session = SpringContext.getHibernateSession();
		for(LibraryInfo oneLibrary:list1){
			libraryInfoMapWithPath.put(oneLibrary.getPath(), oneLibrary);
			libraryInfoMapWithId.put(oneLibrary.getLibraryId(), oneLibrary);

			Criteria cri = session.createCriteria(DmObjectModelInfo.class);
			cri.add(Restrictions.or(Restrictions.eq("library", oneLibrary.getLibraryId()),Restrictions.eq("overt", true)));
	    	
			List<DmObjectModelInfo> list2= cri.list();
			
			if(list2!=null){
	    		DmObjectModelInfo activeDmObjectModelInfo=null;
	    		
	    		for(DmObjectModelInfo one:list2){
	    			if(LongUtil.ifEqual(one.getLibrary(), oneLibrary.getLibraryId()) && one.isActive()){
	    				activeDmObjectModelInfo=one;
	    			}
	    		}
	    		if(activeDmObjectModelInfo==null){
	    			for(DmObjectModelInfo one:list2){
	        			if(one.isActive() ){
	        				activeDmObjectModelInfo=one;
	        			}
	        		}
	    		}
	    		final DmObjectModelInfo dmObjectModelInfo=activeDmObjectModelInfo;
	    		Criteria cri1 = session.createCriteria(DmObjectInfo.class);
				
	    		if(activeDmObjectModelInfo!=null){
	    			dmObjectModelInfoMAPWithLibraryId.put(oneLibrary.getLibraryId(), activeDmObjectModelInfo);
	    			cri.add(Restrictions.or(Restrictions.eq("library", oneLibrary.getLibraryId()),Restrictions.eq("overt", true)));
	    			cri.add(Restrictions.eq("objectModelId", dmObjectModelInfo.getObjectModelId()));
	    		}
	    		
		    	
	    		List<DmObjectInfo> dmObjectInfoList=cri1.list();
	    		
	    		dmObjectListMAPWithLibraryId.put(oneLibrary.getLibraryId(), dmObjectInfoList);
	    	}
		}
	}
	public LibraryInfoCache(){
		init();
	}
	
	
	public static void staticrefresh(){
		LibraryInfoCache.libraryInfoCache=null;
	}
	
}
