package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

import com.fargo.basis.common.Constant;



@TableAnnoExtend(description="基础对象定义",textSearch=true,combinedSearch=false,parent="" ,foreignParent="DmObjectModelInfo")
@Entity
//@javax.persistence.Table(name="dm_object_info")
public class DmObjectInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="基础对象ID")
	private Long objectId;
	@FieldAnnoExtend(description="基础对象名称",required=true,textSearch=true,name=true)
	private String objectName;
	
	
	private Long objectModelId;
	
	@FieldAnnoExtend(type=5,childModel="DmObjectAttribute")
	List<DmObjectAttribute> attributeList=new ArrayList<DmObjectAttribute>();
	
	@FieldAnnoExtend(type=5,childModel="DmObjectIndex")
	List<DmObjectIndex> indexList=new ArrayList<DmObjectIndex>();
	
	Long library;
	@FieldAnnoExtend(description="是否公开",required=true)
	
	
	boolean overt;
	
	@FieldAnnoExtend(description="是否运行时缓存",required=true)
	boolean ifCacheOnRunning;

	@FieldAnnoExtend(description="列表字段",required=true)
	List<Long> tableShowIdList=new ArrayList<Long>();
	
	@FieldAnnoExtend(description="查询字段",required=true)
	List<Long> searchIdList=new ArrayList<Long>();
	
	@FieldAnnoExtend(description="导航字段")
	List<Long> operatorHrefIdList=new ArrayList<Long>();
	
	@FieldAnnoExtend(description="按字段缓存")
	Long cacheByAttId;
	
	@Transient
	boolean haveIndexForBuild=false;
	
	@Transient
	boolean ifRebuildingIndex;
	
	@Transient
	DmObjectAttribute nameAttribute;
	
	@FieldAnnoExtend(description="是否创建登陆用户")
	boolean ifCreateOrgUser;
	
	@FieldAnnoExtend(type=9,description="登陆用户角色",foreignModel="AuthAppRole")
	Long orgUserRole;
	
	
	@FieldAnnoExtend(description="密码")
	private String password;
	
	
	
	public boolean isIfCreateOrgUser() {
		return ifCreateOrgUser;
	}
	public void setIfCreateOrgUser(boolean ifCreateOrgUser) {
		this.ifCreateOrgUser = ifCreateOrgUser;
	}
	public Long getOrgUserRole() {
		return orgUserRole;
	}
	public void setOrgUserRole(Long orgUserRole) {
		this.orgUserRole = orgUserRole;
	}
	public DmObjectAttribute getNameAttribute() {
		if(nameAttribute==null){
			for(DmObjectAttribute a12:getAttributeList() ){
				if(Constant.OBJECT_ATT_TYPE_NAME.equals(a12.getType())){
					setNameAttribute(a12);
				}
			}
		}
		return nameAttribute;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setNameAttribute(DmObjectAttribute nameAttribute) {
		this.nameAttribute = nameAttribute;
	}
	public boolean isHaveIndexForBuild() {
		return haveIndexForBuild;
	}
	public void setHaveIndexForBuild(boolean haveIndexForBuild) {
		this.haveIndexForBuild = haveIndexForBuild;
	}
	public boolean isIfRebuildingIndex() {
		return ifRebuildingIndex;
	}
	public void setIfRebuildingIndex(boolean ifRebuildingIndex) {
		this.ifRebuildingIndex = ifRebuildingIndex;
	}
	public List<Long> getOperatorHrefIdList() {
		return operatorHrefIdList;
	}
	public void setOperatorHrefIdList(List<Long> operatorHrefIdList) {
		this.operatorHrefIdList = operatorHrefIdList;
	}
	public List<Long> getSearchIdList() {
		return searchIdList;
	}
	public void setSearchIdList(List<Long> searchIdList) {
		this.searchIdList = searchIdList;
	}
	public boolean isIfCacheOnRunning() {
		return ifCacheOnRunning;
	}
	public void setIfCacheOnRunning(boolean ifCacheOnRunning) {
		this.ifCacheOnRunning = ifCacheOnRunning;
	}
	public List<Long> getTableShowIdList() {
		return tableShowIdList;
	}
	public void setTableShowIdList(List<Long> tableShowIdList) {
		this.tableShowIdList = tableShowIdList;
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
	
	public List<DmObjectAttribute> getAttributeList() {
		return attributeList;
	}
	public void setAttributeList(List<DmObjectAttribute> attributeList) {
		this.attributeList = attributeList;
	}
	public Long getObjectModelId() {
		return objectModelId;
	}
	public void setObjectModelId(Long objectModelId) {
		this.objectModelId = objectModelId;
	}
	public Long getObjectId() {
		return objectId;
	}
	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}
	public String getObjectName() {
		return objectName;
	}
	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	public List<DmObjectIndex> getIndexList() {
		return indexList;
	}
	public void setIndexList(List<DmObjectIndex> indexList) {
		this.indexList = indexList;
	}
	public Long getCacheByAttId() {
		return cacheByAttId;
	}
	public void setCacheByAttId(Long cacheByAttId) {
		this.cacheByAttId = cacheByAttId;
	}
	
	
	
}
