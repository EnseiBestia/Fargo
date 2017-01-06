package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;
import org.hibernate.annotations.Type;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@TableAnnoExtend(description="系统用户",textSearch=true,combinedSearch=false,parent="")
@Entity
@Table(name="auth_app_user")
public class AuthAppUser implements AuthUser,Serializable, UserDetails{

	/**	
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@FieldAnnoExtend(description="用户ID")
	protected Long userId;
	@FieldAnnoExtend(description="用户名")
	protected String userName;
	@FieldAnnoExtend(description="用户姓名",required=true,textSearch=true,name=true,minlength=1,maxlength=20)
	protected String fullName;
	
	@FieldAnnoExtend(description="用户密码",required=true,minlength=6,maxlength=20)
	protected String password;
	
	@FieldAnnoExtend(description="用户密码提示",required=true,minlength=6,maxlength=20)
	protected String passwordHint;
	@FieldAnnoExtend(description="用户邮箱",required=true,textSearch=true,email=true)
	protected String email;

	@FieldAnnoExtend(description="手机号码",textSearch=true,digits=true,minlength=11,maxlength=11)
	protected Long phoneNumber;
	
	@FieldAnnoExtend(description="是否激活",required=true)
	protected boolean enabled;

	/*@FieldAnnoExtend(type=6,description="角色列表",foreignModel="AuthAppRole")*/
	@FieldAnnoExtend(type=5,childModel="AuthUserLibraryRole")
	@Type(type = "com.fargo.basis.common.hbm.JsonListType",
          parameters = {@org.hibernate.annotations.Parameter(name = "element", value = "com.fargo.basis.model.AuthUserLibraryRole"),
		@org.hibernate.annotations.Parameter(name = "type", value = "LIST")})	
	List<AuthUserLibraryRole> libraryRoleList=new ArrayList<AuthUserLibraryRole>();
	
	
	
	protected Date createTime;
	
	protected Date updateTime;
	
	
	@FieldAnnoExtend(description="库",required=true)
	Long library;
	@FieldAnnoExtend(description="是否公开",required=true)
	boolean overt;
	
	@Transient
	String oldPassword;
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public Long getDefaultLibrary(){
		if(libraryRoleList!=null){
			for(AuthUserLibraryRole rid:libraryRoleList){
				if(rid.ifDefault){
					return rid.getLibraryId();
				}
			}
		}
		return library;
	}
	public List<Long> getRoleList(Long library) {
		List<Long> list=new ArrayList<Long>();
		if(libraryRoleList!=null){
			for(AuthUserLibraryRole rid:libraryRoleList){
				if(rid.getRoleList()!=null && rid.getLibraryId().longValue()==library.longValue()){
					for(Long ridl:rid.getRoleList()){
						list.add(ridl);
					}
					
				}
				
			}
		}
		return list;
	}
	public List<Long> getServerReportList(Long library) {
		List<Long> list=new ArrayList<Long>();
		if(libraryRoleList!=null){
			for(AuthUserLibraryRole rid:libraryRoleList){
				if(rid.getReportServerList()!=null && rid.getLibraryId().longValue()==library.longValue()){
					for(Long ridl:rid.getReportServerList()){
						if(!list.contains(ridl)){
							list.add(ridl);
						}
					}
					
				}
				
			}
		}
		return list;
	}
	public List<Long> getAdminReportList(Long library) {
		List<Long> list=new ArrayList<Long>();
		if(libraryRoleList!=null){
			for(AuthUserLibraryRole rid:libraryRoleList){
				if(rid.getAdminServerList()!=null && rid.getLibraryId().longValue()==library.longValue()){
					for(Long ridl:rid.getAdminServerList()){
						if(!list.contains(ridl)){
							list.add(ridl);
						}
					}
					
				}
				
			}
		}
		return list;
	}
	
	public List<AuthUserLibraryRole> getLibraryRoleList() {
		return libraryRoleList;
	}

	public void setLibraryRoleList(List<AuthUserLibraryRole> libraryRoleList) {
		this.libraryRoleList = libraryRoleList;
	}

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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	

	@Override
	public Set<GrantedAuthority>  getAuthorities() {
		// TODO Auto-generated method stub
		Set<GrantedAuthority> authorities = new LinkedHashSet<GrantedAuthority>();
		if(libraryRoleList!=null){
			for(AuthUserLibraryRole rid:libraryRoleList){
				if(rid.getRoleList()!=null){
					for(Long ridl:rid.getRoleList()){
						AuthAppRole ar=new AuthAppRole();
						ar.setRoleId(ridl);
						authorities.add(ar);
					}
					
				}
				
			}
		}
        
        return authorities;
 	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	public String getPasswordHint() {
		return passwordHint;
	}

	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}

	@Override
	public String toString() {
		return "AuthAppUser [userId=" + userId + ", userName=" + userName
				+ ", fullName=" + fullName + ", password=" + password
				+ ", passwordHint=" + passwordHint + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", enabled=" + enabled
				+ ", roleList=" + this.libraryRoleList + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + "]";
	}
}
