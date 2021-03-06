package com.fargo.basis.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

@TableAnnoExtend(description="图标",textSearch=true,combinedSearch=false,parent="")
@javax.persistence.Entity
@javax.persistence.Table(name="cfg_icon_info")
public class CfgIconInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@FieldAnnoExtend(description="图标ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long iconId;
	@FieldAnnoExtend(description="图标名称",required=true,name=true)
	private String iconName;
	@FieldAnnoExtend(description="图标编码")
	private String iconCode;
	
	@FieldAnnoExtend(type=1,enumCode="BW",description="图标类型",required=true)
	private String iconType;
	
	@FieldAnnoExtend(description="图标目录")
	private String iconFolder;
	
	@FieldAnnoExtend(description="图标大小")
	private String iconSize;

	
	private Long library;
	private boolean overt;
	
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

	public Long getIconId() {
		return iconId;
	}

	public void setIconId(Long iconId) {
		this.iconId = iconId;
	}

	public String getIconName() {
		return iconName;
	}

	public void setIconName(String iconName) {
		this.iconName = iconName;
	}

	public String getIconCode() {
		return iconCode;
	}

	public void setIconCode(String iconCode) {
		this.iconCode = iconCode;
	}

	public String getIconType() {
		return iconType;
	}

	public void setIconType(String iconType) {
		this.iconType = iconType;
	}

	public String getIconFolder() {
		return iconFolder;
	}

	public void setIconFolder(String iconFolder) {
		this.iconFolder = iconFolder;
	}

	public String getIconSize() {
		return iconSize;
	}

	public void setIconSize(String iconSize) {
		this.iconSize = iconSize;
	}
	
	
	
}
