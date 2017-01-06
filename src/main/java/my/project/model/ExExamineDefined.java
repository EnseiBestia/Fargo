package my.project.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;
import org.hibernate.annotations.Type;

import com.fargo.basis.util.zx.LongUtil;

/*

CREATE TABLE exexaminedefined(examineid INT PRIMARY KEY AUTO_INCREMENT,examineName VARCHAR(30),examineTitile VARCHAR(50),examineObject VARCHAR(50),examineRouteList
text,description VARCHAR(100),updateTime DATE,createTime DATE);
 */
@Entity
@TableAnnoExtend(description="审批定义",textSearch=true,combinedSearch=true)
@Table(name="ExExamineDefined")
public class ExExamineDefined implements Serializable{
	private static final long serialVersionUID = -5110739758996499452L;

	@Id
	@FieldAnnoExtend(description="定义ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long examineId;
	
	@FieldAnnoExtend(description="名称",required=true,name=true)
	private String examineName;
	
	@FieldAnnoExtend(description="标题")
	private String examineTitile;
	
	//提供一个接口输入上述字段返回一个审批路径对象
	//计提	策划案	资源包调拨	返款		账户扣款		账户调拨
	//@FieldAnnoExtend(type=1,enumCode="13",description="审批对象",pleaseSelect=true,combinedSearch=true,required=true,multiple=false)
	@FieldAnnoExtend(description="审批对象",textSearch=true)
	private String examineObject;
    @Type(type = "com.fargo.basis.common.hbm.JsonListType",parameters = {@org.hibernate.annotations.Parameter(name = "element", value = "my.project.model.ExExamineRoute"),@org.hibernate.annotations.Parameter(name = "type", value = "LIST")})
	@FieldAnnoExtend(type=5,description="审批路径",childModel="ExExamineRoute")
	private List<ExExamineRoute> examineRouteList = new ArrayList<ExExamineRoute>();
	
	@FieldAnnoExtend(description="描述",textSearch=true)
	private String description;
	
	@FieldAnnoExtend(description="更新时间")
	private Date updateTime;
	
	@FieldAnnoExtend(description="创建时间")
    private Date createTime;

	public Long getExamineId() {
		return examineId;
	}

	public void setExamineId(Long examineId) {
		this.examineId = examineId;
	}

	public String getExamineName() {
		return examineName;
	}

	public void setExamineName(String examineName) {
		this.examineName = examineName;
	}

	public String getExamineTitile() {
		return examineTitile;
	}

	public void setExamineTitile(String examineTitile) {
		this.examineTitile = examineTitile;
	}

	public String getExamineObject() {
		return examineObject;
	}

	public void setExamineObject(String examineObject) {
		this.examineObject = examineObject;
	}

	public List<ExExamineRoute> getExamineRouteList() {
		return examineRouteList;
	}

	public void setExamineRouteList(List<ExExamineRoute> examineRouteList) {
		Collections.sort(examineRouteList);
		this.examineRouteList = examineRouteList;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public void removeRoute(Long routeId){
		ExExamineRoute  exExamineRoute1 = new ExExamineRoute();
        for(ExExamineRoute one:examineRouteList){
        	if(LongUtil.ifEqual(one.getRouteId(), routeId)){
        		exExamineRoute1=one;
        		break;
        	}
        }
        if(exExamineRoute1!=null){
        	examineRouteList.remove(exExamineRoute1);
        }
        this.resetRouteIndex();
	}
	public void resetRouteIndex(){
		List<ExExamineRoute> routes = new ArrayList<ExExamineRoute>();
		for(int i=0;i<examineRouteList.size();i++){
			ExExamineRoute route = examineRouteList.get(i);
			route.setRouteIndex(i+1);
			routes.add(route);
		}
		this.examineRouteList = routes;
	}
	//direction down  up
	public void moveRoute(int routeIndex,String direction){
		List<ExExamineRoute> routes = this.examineRouteList;
		int cI = routeIndex-1;
		int desI = 0;
		ExExamineRoute routeC = routes.get(cI);
		if("up".equals(direction)){
			desI = cI-1;
		}else{
			desI = cI+1;
		}
		ExExamineRoute routeD = routes.get(desI);
		routes.set(desI, routeC);
		routes.set(cI, routeD);
		this.examineRouteList = routes;
		this.resetRouteIndex();
	}
}
