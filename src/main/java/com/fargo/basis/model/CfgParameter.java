package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;
@TableAnnoExtend(description="系统参数配置",textSearch=true,combinedSearch=false,parent="")
@Entity 
@Table(name="cfg_parameter_info")
public class CfgParameter implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2769756503509583157L;

	@Id
	@FieldAnnoExtend(description="参数ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long parameterId;
	
	@FieldAnnoExtend(description="参数名称",required=true,textSearch=true)
	String name;
	@FieldAnnoExtend(description="参数值",required=true,textSearch=true)
	String value;
	@FieldAnnoExtend(description="参数描述",required=true,textSearch=true)
	String description;

	@FieldAnnoExtend(description="是否允许修改",required=true)
	boolean canModify;
	
	
	
	@FieldAnnoExtend(description="备注")
	String note;

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Long getParameterId() {
		return parameterId;
	}

	public void setParameterId(Long parameterId) {
		this.parameterId = parameterId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isCanModify() {
		return canModify;
	}

	public void setCanModify(boolean canModify) {
		this.canModify = canModify;
	}

	

	
}
