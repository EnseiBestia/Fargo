package com.fargo.basis.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;
import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

import com.fargo.basis.cache.cfg.CfgEnumInfoCache;


@TableAnnoExtend(description="后台任务",textSearch=true,combinedSearch=false,parent="" ,foreignParent="")
@Entity
@Table(name="StTaskInfo")
public class StTaskInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@FieldAnnoExtend(description="任务ID")
	private Long taskId;
	
	@FieldAnnoExtend(description="任务名称",name=true)
	private String taskName;
	
	@FieldAnnoExtend(type=1,enumCode="BF",description="任务类型",required=true)
	private String taskType;
	
	@FieldAnnoExtend(type=1,enumCode="BG",description="任务状态",required=true)
	private String taskStatus;
	
	@FieldAnnoExtend(type=1,enumCode="BY",description="服务端",required=true)
	private String taskServerType;

	@FieldAnnoExtend(description="执行次数")
	private Integer executeTimes;
	
	@FieldAnnoExtend(description="任务详情")
	private Map<String,Object> taskDetails=new HashMap<String,Object>();
	
	@FieldAnnoExtend(description="创建时间",date=true)
	private Date createTime;
	
	@FieldAnnoExtend(description="开始执行时间",date=true)
	private Date runTime;
	
	@FieldAnnoExtend(description="执行结束时间",date=true)
	private Date doneTime;
	
	@FieldAnnoExtend(type=9,description="对象名称",foreignModel="CfgFormInfo",pleaseSelect=true)
	Long formId;
	
	@FieldAnnoExtend(type=9,description="对象值",foreignModel="CfgFormInfo",pleaseSelect=true)
	private Long objectId;
	
	@FieldAnnoExtend(type=9,description="报告服务端",foreignModel="StReportServerInfo",pleaseSelect=true)
	private Long reportServerId;
	
	@FieldAnnoExtend(type=9,description="管理服务端",foreignModel="StAdminServerInfo",pleaseSelect=true)
	private Long adminServerId;
	
	
	public Long getReportServerId() {
		return reportServerId;
	}

	public void setReportServerId(Long reportServerId) {
		this.reportServerId = reportServerId;
	}

	public Long getFormId() {
		return formId;
	}

	public String getTaskServerType() {
		return taskServerType;
	}

	public void setTaskServerType(String taskServerType) {
		this.taskServerType = taskServerType;
	}

	public Integer getExecuteTimes() {
		return executeTimes;
	}

	public void setExecuteTimes(Integer executeTimes) {
		this.executeTimes = executeTimes;
	}

	public Long getAdminServerId() {
		return adminServerId;
	}

	public void setAdminServerId(Long adminServerId) {
		this.adminServerId = adminServerId;
	}

	public void setFormId(Long formId) {
		this.formId = formId;
	}

	public Long getObjectId() {
		return objectId;
	}

	public void setObjectId(Long objectId) {
		this.objectId = objectId;
	}

	Long library;
	boolean overt;
	
	@FieldAnnoExtend(type=9,description="提交用户",foreignModel="AuthAppUser",pleaseSelect=true)
	private Long user;

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		if (StringUtils.isBlank(this.taskName) && StringUtils.isNotBlank(this.taskType)) {
			return CfgEnumInfoCache.getInstance().getEnumValueByEnumCode(this.taskType);
		}
		return taskName;
	}

	public void setTaskName(String taskName) {
		if (StringUtils.isBlank(this.taskName) && StringUtils.isNotBlank(this.taskType)) {
			this.taskName = CfgEnumInfoCache.getInstance().getEnumValueByEnumCode(this.taskType);
		}
		this.taskName = taskName;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public Map<String, Object> getTaskDetails() {
		return taskDetails;
	}

	public void setTaskDetails(Map<String, Object> taskDetails) {
		this.taskDetails = taskDetails;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getRunTime() {
		return runTime;
	}

	public void setRunTime(Date runTime) {
		this.runTime = runTime;
	}

	public Date getDoneTime() {
		return doneTime;
	}

	public void setDoneTime(Date doneTime) {
		this.doneTime = doneTime;
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

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "StTaskInfo [taskId=" + taskId + ", taskName=" + taskName
				+ ", taskType=" + taskType + ", taskStatus=" + taskStatus
				+ ", taskDetails=" + taskDetails + ", createTime=" + createTime
				+ ", runTime=" + runTime + ", doneTime=" + doneTime
				+ ", library=" + library + ", overt=" + overt + ", user="
				+ user + "]";
	}
	
	
}
