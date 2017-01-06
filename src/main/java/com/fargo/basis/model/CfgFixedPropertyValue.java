package com.fargo.basis.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@Entity
@TableAnnoExtend(description="系统可变属性值",textSearch=true,combinedSearch=false,parent="CfgFixedPropertyValue")
//@javax.persistence.Table(name="cfg_fixed_property_val")
public class CfgFixedPropertyValue implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id	
	@FieldAnnoExtend(description="属性ID")
	private Long propertyValueId;
	
	@FieldAnnoExtend(type=7)
	private Long parent;
	
	@FieldAnnoExtend(description="属性值",required=true,textSearch=true)
	private String propertyName;
	
	
	private Long library;
	
	private boolean overt;

	private Long cfgFixedPropertyDefineId;
	
	
	Map<String,Object> customPropertyMap=new HashMap<String,Object>();
	
	
	@FieldAnnoExtend(type=1,enumCode="11",description="状态",required=true)
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Map<String, Object> getCustomPropertyMap() {
		return customPropertyMap;
	}

	public void setCustomPropertyMap(Map<String, Object> customPropertyMap) {
		this.customPropertyMap = customPropertyMap;
	}

	public Long getCfgFixedPropertyDefineId() {
		return cfgFixedPropertyDefineId;
	}

	public void setCfgFixedPropertyDefineId(Long cfgFixedPropertyDefineId) {
		this.cfgFixedPropertyDefineId = cfgFixedPropertyDefineId;
	}

	public Long getPropertyValueId() {
		return propertyValueId;
	}

	public void setPropertyValueId(Long propertyValueId) {
		this.propertyValueId = propertyValueId;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

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
