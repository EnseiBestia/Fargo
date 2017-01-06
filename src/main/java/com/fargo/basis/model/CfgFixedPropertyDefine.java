package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="系统可变属性",textSearch=true)
@Entity
//@javax.persistence.Table(name="cfg_fixed_property_def")
public class CfgFixedPropertyDefine implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id	
	@FieldAnnoExtend(description="属性ID")
	private Long propertyId;
	
	
	@FieldAnnoExtend(description="属性名称",required=true)
	private String propertyName;
	@FieldAnnoExtend(description="属性编码",required=true)
	private String propertyCode;
	@FieldAnnoExtend(type=1,enumCode="AX",description="属性值类型",required=true)
	private String valueType;//List,MultiList,TreeList
	
	
	@FieldAnnoExtend(type=6,description="对象",foreignModel="CfgFormInfo")
	private List<CfgFormInfo> formList=new ArrayList<CfgFormInfo>();
	
	@FieldAnnoExtend(type=5,childModel="CfgFixedPropertyField")
	private List<CfgFixedPropertyField> fieldList=new ArrayList<CfgFixedPropertyField>();
	
	
	@FieldAnnoExtend(type=9,description="角色列表",foreignModel="AuthAppRole",multiple=true)
	List<Long> roleList=new ArrayList<Long>();
	
	
	
	public List<Long> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Long> roleList) {
		this.roleList = roleList;
	}
	public List<CfgFixedPropertyField> getFieldList() {
		return fieldList;
	}
	public void setFieldList(List<CfgFixedPropertyField> fieldList) {
		this.fieldList = fieldList;
	}
	@Transient
	private List<Long> formIdList=new ArrayList<Long>();
		
	
	public List<Long> getFormIdList() {
		return formIdList;
	}
	public void setFormIdList(List<Long> formIdList){
		this.formIdList = formIdList;
	}
	public List<CfgFormInfo> getFormList() {
		return formList;
	}
	public void setFormList(List<CfgFormInfo> formList) {
		this.formList = formList;
	}
	public Long getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getPropertyCode() {
		return propertyCode;
	}
	public void setPropertyCode(String propertyCode) {
		this.propertyCode = propertyCode;
	}
	public String getValueType() {
		return valueType;
	}
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}
	
	
}
