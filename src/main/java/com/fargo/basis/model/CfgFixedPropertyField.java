package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

import com.fargo.basis.common.SpringContext;

@TableAnnoExtend(description="系统可变属性扩展字段",textSearch=false,parent="CfgFixedPropertyDefine")
@Entity
//@Table(name="cfg_custom_property")
public class CfgFixedPropertyField implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="字段ID")
	private Long fieldId;
	
	@FieldAnnoExtend(description="字段名称",required=true)
	private String fieldName;
	
	/*@FieldAnnoExtend(description="字段编码",required=true)
	private String fieldCode;*/
	
	@FieldAnnoExtend(type=1,enumCode="AV",description="字段值类型",required=true)
	private String valueType;
	
	@FieldAnnoExtend(description="默认值")
	private String defaultValue;
	
	@FieldAnnoExtend(description="是否必填",required=true)
	private boolean required;
	
	
	private List<String> valueList=new ArrayList<String>();
	
	
	@FieldAnnoExtend(description="是否多选")
	private boolean multiple;
	@FieldAnnoExtend(description="最大长度")
	private long maxlength;
	@FieldAnnoExtend(description="最小长度")
	private long mimlength;
	@FieldAnnoExtend(description="最大值")
	private long max;
	@FieldAnnoExtend(description="最小值")
	private long min;
	
	private long library;
	private boolean overt=false;
	
	
	
	public Long getFieldId() {
		return fieldId;
	}



	public void setFieldId(Long fieldId) {
		this.fieldId = fieldId;
	}



	public String getFieldName() {
		return fieldName;
	}



	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
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



	public List<String> getValueList() {
		return valueList;
	}



	public void setValueList(List<String> valueList) {
		this.valueList = valueList;
	}



	public boolean isMultiple() {
		return multiple;
	}



	public void setMultiple(boolean multiple) {
		this.multiple = multiple;
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



	public long getLibrary() {
		return library;
	}



	public void setLibrary(long library) {
		this.library = library;
	}



	public boolean isOvert() {
		return overt;
	}



	public void setOvert(boolean overt) {
		this.overt = overt;
	}
	
}
