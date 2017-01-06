package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;
import org.hibernate.annotations.Type;
import org.springframework.security.core.GrantedAuthority;

@TableAnnoExtend(description="系统角色",textSearch=true,combinedSearch=false,parent="")
@Entity
@Table(name="auth_app_role")
public class AuthAppRole implements Serializable,GrantedAuthority{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3690197650654049848L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@FieldAnnoExtend(description="角色ID")
	private Long roleId;
	@FieldAnnoExtend(description="角色名",required=true,name=true)
	private String roleName;
	
	@FieldAnnoExtend(description="角色描述")
	private String description;
	
	@Type(type = "com.fargo.basis.common.hbm.JsonListType",
		  parameters = {@org.hibernate.annotations.Parameter(name = "element", value = "java.lang.Long"),
				@org.hibernate.annotations.Parameter(name = "type", value = "LIST")})
	List<Long> privilegeList=new ArrayList<Long>();
	
	
	@FieldAnnoExtend(description="库",required=true)
	Long library;
	@FieldAnnoExtend(description="是否公开",required=true)
	boolean overt;
	
	
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
	public List<Long> getPrivilegeList() {
		return privilegeList;
	}
	public void setPrivilegeList(List<Long> privilegeList) {
		this.privilegeList = privilegeList;
	}
	
	
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return getRoleId().toString();
	}
	
	
	
}
