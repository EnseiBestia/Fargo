package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;
import org.hibernate.annotations.Type;

@TableAnnoExtend(description="枚举变量",textSearch=true,combinedSearch=false,parent="")
@Entity
@Table(name="cfg_enum_info")
public class CfgEnumInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	@FieldAnnoExtend(description="枚举ID")
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long enumId;
	@FieldAnnoExtend(description="枚举名称",required=true,name=true)
	private String enumName;
	@FieldAnnoExtend(description="枚举编码",required=true)
	private String enumCode;
	
	//private boolean editable;
	
	@FieldAnnoExtend(description="Java常量名称",required=true)
	private String constantName;
	
	@FieldAnnoExtend(type=5,childModel="CfgEnumValueInfo")
	@Type(type = "com.fargo.basis.common.hbm.JsonListType",
    	  parameters = {@org.hibernate.annotations.Parameter(name = "element", value = "com.fargo.basis.model.CfgEnumValueInfo"),
	      @org.hibernate.annotations.Parameter(name = "type", value = "LIST")})
	@Column(name="`values`")
	List<CfgEnumValueInfo> values=new ArrayList<CfgEnumValueInfo>();

	public Long getEnumId() {
		return enumId;
	}

	public void setEnumId(Long enumId) {
		this.enumId = enumId;
	}

	public String getEnumName() {
		return enumName;
	}

	public void setEnumName(String enumName) {
		this.enumName = enumName;
	}

	public String getEnumCode() {
		return enumCode;
	}

	public void setEnumCode(String enumCode) {
		this.enumCode = enumCode;
	}



	public String getConstantName() {
		return constantName;
	}

	public void setConstantName(String constantName) {
		this.constantName = constantName;
	}

	public List<CfgEnumValueInfo> getValues() {
		return values;
	}

	public void setValues(List<CfgEnumValueInfo> values) {
		this.values = values;
	}
	
	
}
