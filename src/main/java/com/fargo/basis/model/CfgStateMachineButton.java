package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="状态项操作",textSearch=false,combinedSearch=true,parent="CfgStateMachineValue" ,foreignParent="")
@Entity
//@javax.persistence.Table(name="cfg_state_machine_button",catalog="bsquiz")
public class CfgStateMachineButton implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="状态项操作ID")
	private Long buttonId;
	
	
	@FieldAnnoExtend(description="操作名称",required=true,textSearch=true,name=true)
	String buttonName;

	@FieldAnnoExtend(type=9,description="角色列表",foreignModel="AuthAppRole",multiple=true)
	List<Long> roleList=new ArrayList<Long>();
	
	
	
	@FieldAnnoExtend(type=1,enumCode="BE",description="目标状态",required=true)
	private String targetStat;
	
	@FieldAnnoExtend(type=1,enumCode="BS",description="显示方式",required=true,multiple=true)
	private List<String> viewType;
	
	
	@FieldAnnoExtend(description="URL")
	String URL;
	
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	public Long getButtonId() {
		return buttonId;
	}
	public void setButtonId(Long buttonId) {
		this.buttonId = buttonId;
	}
	public List<Long> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Long> roleList) {
		this.roleList = roleList;
	}
	public String getTargetStat() {
		return targetStat;
	}
	public void setTargetStat(String targetStat) {
		this.targetStat = targetStat;
	}
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	public List<String> getViewType() {
		return viewType;
	}
	public void setViewType(List<String> viewType) {
		this.viewType = viewType;
	}
	
	
}
