package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="快捷权限",textSearch=true,combinedSearch=false,parent="")
@Entity
//@javax.persistence.Table(name="auth_short_cut_privilege_info")
public class AuthShortCutPrivilege implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="快捷权限ID")
	Long shortCutId;
	
	@FieldAnnoExtend(description="权限名称",required=true,name=true,textSearch=true)
	String shortCutName;
	
	@FieldAnnoExtend(description="图标")
	String icon;
	
	
	
	@FieldAnnoExtend(type=9,description="系统权限",foreignModel="AuthPrivilegeInfo")
	Long privilegeId;

	@FieldAnnoExtend(description="排序")

	Long order;

	@FieldAnnoExtend(type=9,description="角色列表",foreignModel="AuthAppRole",multiple=true)
	List<Long> roleList=new ArrayList<Long>();
	
	
	
	@Transient
	AuthPrivilegeInfo authPrivilegeInfo;
	
	
	public AuthPrivilegeInfo getAuthPrivilegeInfo() {
		return authPrivilegeInfo;
	}



	public void setAuthPrivilegeInfo(AuthPrivilegeInfo authPrivilegeInfo) {
		this.authPrivilegeInfo = authPrivilegeInfo;
	}



	public List<Long> getRoleList() {
		return roleList;
	}



	public void setRoleList(List<Long> roleList) {
		this.roleList = roleList;
	}



	public Long getOrder() {
		return order;
	}



	public void setOrder(Long order) {
		this.order = order;
	}



	public Long getShortCutId() {
		return shortCutId;
	}



	public void setShortCutId(Long shortCutId) {
		this.shortCutId = shortCutId;
	}



	public String getShortCutName() {
		return shortCutName;
	}



	public void setShortCutName(String shortCutName) {
		this.shortCutName = shortCutName;
	}



	public String getIcon() {
		return icon;
	}



	public void setIcon(String icon) {
		this.icon = icon;
	}



	public Long getPrivilegeId() {
		return privilegeId;
	}



	public void setPrivilegeId(Long privilegeId) {
		this.privilegeId = privilegeId;
	}
	
	
}
