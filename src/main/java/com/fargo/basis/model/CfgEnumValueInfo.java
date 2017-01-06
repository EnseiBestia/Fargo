package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Transient;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

@TableAnnoExtend(description="枚举变量值",textSearch=true,combinedSearch=false,parent="CfgEnumInfo")
@javax.persistence.Entity
public class CfgEnumValueInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	@FieldAnnoExtend(description="枚举变量值ID")
	private String enumValueId;
	@FieldAnnoExtend(description="枚举变量值编码",required=true)
	private String code;
	@FieldAnnoExtend(description="枚举变量值名称",required=true)
	private String value;
	@FieldAnnoExtend(description="Java常量名称",required=true)
	private String constantName;
	
	
	public String getEnumValueId() {
		return enumValueId;
	}

	public void setEnumValueId(String enumValueId) {
		this.enumValueId = enumValueId;
	}

	@Transient
	private String fullCode;
	
	public String getFullCode() {
		return fullCode;
	}

	public void setFullCode(String fullCode) {
		this.fullCode = fullCode;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getConstantName() {
		return constantName;
	}

	public void setConstantName(String constantName) {
		this.constantName = constantName;
	}
	
}
