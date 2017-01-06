package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="基础对象模型",textSearch=true,combinedSearch=false,parent="" ,foreignParent="")
@Entity
@Table(name="dm_object_model_info")
public class DmObjectModelInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="基础对象模型ID")
	private Long objectModelId;
	@FieldAnnoExtend(description="基础对象模型名称",required=true,textSearch=true,name=true)
	private String objectModelName;
	
	public Long getObjectModelId() {
		return objectModelId;
	}
	public void setObjectModelId(Long objectModelId) {
		this.objectModelId = objectModelId;
	}
	public String getObjectModelName() {
		return objectModelName;
	}
	public void setObjectModelName(String objectModelName) {
		this.objectModelName = objectModelName;
	}
	
	@FieldAnnoExtend(description="是否激活",required=true)
	boolean active;
	
	
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}

	Long library;
	@FieldAnnoExtend(description="是否公开",required=true)
	boolean overt;

	public Long getLibrary() {
		return library;
	}
	public void setLibrary(Long library) {
		this.library = library;
	}
	public boolean isOvert() {
		return overt;
	}
	public void setOvert(boolean overt) {
		this.overt = overt;
	}
	
	
	
}
