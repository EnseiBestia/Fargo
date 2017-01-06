package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="对象",textSearch=true,combinedSearch=false,parent="CfgFormInfo")
@Entity
@Table(name="cfg_form_info")
public class CfgFormInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="对象ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long formId;
	
	@FieldAnnoExtend(description="对象名称",required=true,name=true)
	private String formName;
	
	@FieldAnnoExtend(description="对象标识",required=true)
	private String formCode;
	
	@FieldAnnoExtend(description="对象路径")
	private String modelClassName;
	
	@FieldAnnoExtend(type=7)
	private Long parent;
	
	@FieldAnnoExtend(type=1,enumCode="BB",description="值变化拦截处理类型",required=true)
	private String valueChangeDoType;//List,MultiList,TreeList
	
	
	public Long getParent() {
		return parent;
	}
	public String getValueChangeDoType() {
		return valueChangeDoType;
	}
	public void setValueChangeDoType(String valueChangeDoType) {
		this.valueChangeDoType = valueChangeDoType;
	}
	public void setParent(Long parent) {
		this.parent = parent;
	}
	public String getModelClassName() {
		return modelClassName;
	}
	public void setModelClassName(String modelClassName) {
		this.modelClassName = modelClassName;
	}
	public Long getFormId() {
		return formId;
	}
	public void setFormId(Long formId) {
		this.formId = formId;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getFormCode() {
		return formCode;
	}
	public void setFormCode(String formCode) {
		this.formCode = formCode;
	}
	
}
