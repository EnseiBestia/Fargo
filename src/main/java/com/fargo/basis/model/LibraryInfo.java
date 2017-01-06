package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;


@TableAnnoExtend(description="系统用户",textSearch=true,combinedSearch=false,parent="")
@Entity
@Table(name="cfg_library_info")
public class LibraryInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3595299476929745026L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@FieldAnnoExtend(description="数据库ID")
	private Long libraryId;
	
	@FieldAnnoExtend(description="数据库名称",required=true,textSearch=true,name=true,minlength=1,maxlength=20)
	private String libraryName;
	
	@FieldAnnoExtend(description="数据库路径",required=true,minlength=1,maxlength=20)
	private String path;
	@FieldAnnoExtend(description="数据库标识",required=true,minlength=1,maxlength=20)
	
	private String identification;
	public Long getLibraryId() {
		return libraryId;
	}
	public void setLibraryId(Long libraryId) {
		this.libraryId = libraryId;
	}
	public String getLibraryName() {
		return libraryName;
	}
	public void setLibraryName(String libraryName) {
		this.libraryName = libraryName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getIdentification() {
		return identification;
	}
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	
	public static void main(String[] args) {
	
	}
}
