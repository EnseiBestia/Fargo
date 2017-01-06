package com.fargo.basis.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;



@TableAnnoExtend(description="对象索引 ",textSearch=true,combinedSearch=false,parent="DmObjectInfo" ,foreignParent="")
@Entity
//@javax.persistence.Table(name="dm_object_info")

public class DmObjectIndex implements Serializable{
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@FieldAnnoExtend(description="索引ID")
	Long objectIndexId;
	@FieldAnnoExtend(description="索引名称",required=true,textSearch=true)
	String objectIndexName;
	
	@FieldAnnoExtend(description="索引字段",required=true)
	List<Long> indexDetail=new ArrayList<Long>();
	
	@FieldAnnoExtend(type=1,enumCode="BE",description="索引类型",required=true)
	private String type;

	@FieldAnnoExtend(description="以此索引导入数据",required=true)
	boolean importIndex;
	
	@FieldAnnoExtend(description="是否存在即覆盖",required=true)
	boolean ifExistCover;
	
	
	
	public boolean isIfExistCover() {
		return ifExistCover;
	}

	public void setIfExistCover(boolean ifExistCover) {
		this.ifExistCover = ifExistCover;
	}

	public boolean isImportIndex() {
		return importIndex;
	}

	public void setImportIndex(boolean importIndex) {
		this.importIndex = importIndex;
	}

	public Long getObjectIndexId() {
		return objectIndexId;
	}

	public void setObjectIndexId(Long objectIndexId) {
		this.objectIndexId = objectIndexId;
	}

	public String getObjectIndexName() {
		return objectIndexName;
	}

	public void setObjectIndexName(String objectIndexName) {
		this.objectIndexName = objectIndexName;
	}

	

	public List<Long> getIndexDetail() {
		return indexDetail;
	}

	public void setIndexDetail(List<Long> indexDetail) {
		this.indexDetail = indexDetail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "DmObjectIndex [objectIndexId=" + objectIndexId
				+ ", objectIndexName=" + objectIndexName + ", indexDetail="
				+ indexDetail + ", type=" + type + "]";
	}
	
	
}
