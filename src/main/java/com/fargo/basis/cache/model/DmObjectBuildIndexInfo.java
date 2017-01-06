package com.fargo.basis.cache.model;

import java.io.Serializable;

import com.fargo.basis.model.DmObjectAttribute;
import com.fargo.basis.model.DmObjectInfo;

public class DmObjectBuildIndexInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	DmObjectInfo dmObjectInfo;
	DmObjectAttribute dmObjectAttribute;
	
	DmObjectAttribute exdendsFrom;
	Long targetObjectAttributeId;
	Long targetObjectId;
	

	public Long getTargetObjectId() {
		return targetObjectId;
	}



	public void setTargetObjectId(Long targetObjectId) {
		this.targetObjectId = targetObjectId;
	}



	public DmObjectBuildIndexInfo(){
			
	}



	public DmObjectInfo getDmObjectInfo() {
		return dmObjectInfo;
	}



	public void setDmObjectInfo(DmObjectInfo dmObjectInfo) {
		this.dmObjectInfo = dmObjectInfo;
	}



	public DmObjectAttribute getDmObjectAttribute() {
		return dmObjectAttribute;
	}



	public void setDmObjectAttribute(DmObjectAttribute dmObjectAttribute) {
		this.dmObjectAttribute = dmObjectAttribute;
	}



	public DmObjectAttribute getExdendsFrom() {
		return exdendsFrom;
	}



	public void setExdendsFrom(DmObjectAttribute exdendsFrom) {
		this.exdendsFrom = exdendsFrom;
	}



	public Long getTargetObjectAttributeId() {
		return targetObjectAttributeId;
	}



	public void setTargetObjectAttributeId(Long targetObjectAttributeId) {
		this.targetObjectAttributeId = targetObjectAttributeId;
	}


	
	
}
