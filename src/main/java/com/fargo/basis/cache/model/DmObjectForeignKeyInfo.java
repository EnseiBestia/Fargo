package com.fargo.basis.cache.model;

import java.io.Serializable;

import com.fargo.basis.model.DmObjectAttribute;
import com.fargo.basis.model.DmObjectInfo;
public class DmObjectForeignKeyInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	DmObjectInfo dmObjectInfo;
	DmObjectAttribute dmObjectAttribute;
	
	

	public DmObjectForeignKeyInfo(DmObjectInfo object,DmObjectAttribute att){
		dmObjectInfo=object;
		dmObjectAttribute=att;
		
				
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

	
	
	
}
