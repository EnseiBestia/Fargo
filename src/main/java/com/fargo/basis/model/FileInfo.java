package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;

import com.alibaba.fastjson.JSONObject;


/**
 * This class is used to represent an address with address,
 * city, province and postal-code information.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@Entity
@org.appfuse.anno.TableAnnoExtend(description="文件",textSearch=false,combinedSearch=true)
@javax.persistence.Table(name="FileInfo")
public class FileInfo implements Serializable {
    private static final long serialVersionUID = 3617859655330969141L;
    
    @Id
	private Long id;
	
	
	@FieldAnnoExtend(description="文件ID")
    private String fileId;
    
    @FieldAnnoExtend(description="文件名称",textSearch=true)
    private String fileName;
    
    @FieldAnnoExtend(description="文件类型")
    private String contentType;
    
    @FieldAnnoExtend(description="文件大小")
    private Long size;
    
    //@FieldAnnoExtend(description="文件相对路径")
    //private String relativeLocation;
    
    @FieldAnnoExtend(description="文件绝对路径")
    private String absoluteLocation;
    
    @FieldAnnoExtend(description="文件KEY")
    private String key;
    
    @FieldAnnoExtend(description="下载URL")
    private String downloadUrl;
    
    @FieldAnnoExtend(description="日期")
    private String dateId;
    
    @FieldAnnoExtend(description="文件系统")
    private Integer fileSystemType;
    
    
	public Integer getFileSystemType() {
		return fileSystemType;
	}


	public void setFileSystemType(Integer fileSystemType) {
		this.fileSystemType = fileSystemType;
	}


	public String getDateId() {
		return dateId;
	}


	public void setDateId(String dateId) {
		this.dateId = dateId;
	}


	@Override
	public String toString() {
		JSONObject obj=new JSONObject();
		/*obj.put("fileId", string.delnull(fileId));
		obj.put("fileName", string.delnull(fileName));
		obj.put("contentType", string.delnull(contentType));
		obj.put("size", string.delnull(size));
		obj.put("absoluteLocation", string.delnull(absoluteLocation));
		obj.put("key", string.delnull(key));
		obj.put("downloadUrl", string.delnull(downloadUrl));*/
		return obj.toJSONString();
	}
	
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getDownloadUrl() {
		return downloadUrl;
	}
	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public Long getSize() {
		return size;
	}
	public void setSize(Long size) {
		this.size = size;
	}
	
	public String getAbsoluteLocation() {
		return absoluteLocation;
	}


	public void setAbsoluteLocation(String absoluteLocation) {
		this.absoluteLocation = absoluteLocation;
	}
    
}
