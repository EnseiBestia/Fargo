package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="基础对象属性",textSearch=true,combinedSearch=false,parent="DmObjectInfo" ,foreignParent="")
@Entity
//@javax.persistence.Table(name="dm_object_info")

public class DmObjectAttribute implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@FieldAnnoExtend(description="对象属性ID")
	Long objectAttributeId;
	@FieldAnnoExtend(description="对象属性名称",required=true,textSearch=true)
	String objectAttributeName;
	
	
	@FieldAnnoExtend(type=1,enumCode="BD",description="类型",required=true)
	private String type;
	
	@FieldAnnoExtend(description="是否隐藏",required=true)
	boolean ifHidden=false;
	
	@FieldAnnoExtend(description="扩展自",required=true)
	Long extendsFrom;
	
	@FieldAnnoExtend(description="目标对象属性",required=true)
	Long targetObjAttId;
	
	
	/*@FieldAnnoExtend(description="是否对象",required=true)
	boolean ifObject;*/
	@FieldAnnoExtend(type=6,description="基础对象定义",foreignModel="DmObjectInfo")
	DmObjectInfo objectInfo;
	
	
	/*@FieldAnnoExtend(description="是否运行时缓存",required=true)
	boolean ifCacheOnRunning;*/


	/*@FieldAnnoExtend(description="是否名称字段",required=true)
	
	
	boolean ifName;
	
	@FieldAnnoExtend(description="是否自定义属性",required=true)
	boolean ifFixedProperty;*/
	
	@FieldAnnoExtend(description="自定义属性Id")
	Long fixedPropertyDefineId;
	
	@FieldAnnoExtend(type=1,enumCode="AV",description="值类型",required=true)
	private String valueType;
	
	@FieldAnnoExtend(description="默认值")
	private String defaultValue;
	
	@FieldAnnoExtend(description="是否必填",required=true)
	private boolean required;
	
	@FieldAnnoExtend(description="是否用于搜索",required=true)
	private boolean useQuery=false;
	
	@FieldAnnoExtend(description="枚举值")
	private List<String> valueList=new ArrayList<String>();
	
	@FieldAnnoExtend(description="最大长度")
	private long maxlength;
	@FieldAnnoExtend(description="最小长度")
	private long mimlength;
	@FieldAnnoExtend(description="最大值")
	private long max;
	@FieldAnnoExtend(description="最小值")
	private long min;
	
	@FieldAnnoExtend(description="是否多选")
	private boolean multiple;
	
	public Long getExtendsFrom() {
		return extendsFrom;
	}
	public void setExtendsFrom(Long extendsFrom) {
		this.extendsFrom = extendsFrom;
	}
	public Long getTargetObjAttId() {
		return targetObjAttId;
	}
	public void setTargetObjAttId(Long targetObjAttId) {
		this.targetObjAttId = targetObjAttId;
	}
	public boolean isMultiple() {
		return multiple;
	}
	public void setMultiple(boolean multiple) {
		this.multiple = multiple;
	}
	public Long getObjectAttributeId() {
		return objectAttributeId;
	}
	public void setObjectAttributeId(Long objectAttributeId) {
		this.objectAttributeId = objectAttributeId;
	}
	public String getObjectAttributeName() {
		return objectAttributeName;
	}
	public void setObjectAttributeName(String objectAttributeName) {
		this.objectAttributeName = objectAttributeName;
	}
	
	public DmObjectInfo getObjectInfo() {
		return objectInfo;
	}
	public void setObjectInfo(DmObjectInfo objectInfo) {
		this.objectInfo = objectInfo;
	}
	
	public Long getFixedPropertyDefineId() {
		return fixedPropertyDefineId;
	}
	public void setFixedPropertyDefineId(Long fixedPropertyDefineId) {
		this.fixedPropertyDefineId = fixedPropertyDefineId;
	}
	public String getValueType() {
		return valueType;
	}
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	public boolean isRequired() {
		return required;
	}
	public void setRequired(boolean required) {
		this.required = required;
	}
	public boolean isUseQuery() {
		return useQuery;
	}
	public void setUseQuery(boolean useQuery) {
		this.useQuery = useQuery;
	}
	public List<String> getValueList() {
		return valueList;
	}
	public void setValueList(List<String> valueList) {
		this.valueList = valueList;
	}
	public long getMaxlength() {
		return maxlength;
	}
	public void setMaxlength(long maxlength) {
		this.maxlength = maxlength;
	}
	public long getMimlength() {
		return mimlength;
	}
	public void setMimlength(long mimlength) {
		this.mimlength = mimlength;
	}
	public long getMax() {
		return max;
	}
	public void setMax(long max) {
		this.max = max;
	}
	public long getMin() {
		return min;
	}
	public void setMin(long min) {
		this.min = min;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isIfHidden() {
		return ifHidden;
	}
	public void setIfHidden(boolean ifHidden) {
		this.ifHidden = ifHidden;
	}
	
	
}
