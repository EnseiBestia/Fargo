package my.project.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.appfuse.anno.FieldAnnoExtend;
import org.appfuse.anno.TableAnnoExtend;

@Entity
@TableAnnoExtend(description="审批路径",textSearch=true,combinedSearch=true,parent="ExExamineDefined" ,foreignParent="")
@javax.persistence.Table(name="ExExamineRoute")
public class ExExamineRoute implements Serializable,Comparable<ExExamineRoute>{
	private static final long serialVersionUID = 6321962241111211195L;

	@Id
	@FieldAnnoExtend(description="审批路径ID")
	private String routeId;
	
	@FieldAnnoExtend(description="审批节点",required=true,name=true)
	private String routeName;
	
	//从1开始，一个审批路径不允许重复，不允许跳过
	@FieldAnnoExtend(description="审批顺序",required=true)
	private Integer routeIndex;
	
	//系统操作员ID，实际执行审批的代码读取系统用户表获取邮箱等一系列信息
	@FieldAnnoExtend(type=9,description="审批人",required=true,foreignModel="AuthAppUser")
	private Long userId;
	
	@FieldAnnoExtend(description="描述")
	private String description;

	

	public String getRouteId() {
		return routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	
	public Integer getRouteIndex() {
		return routeIndex;
	}

	public void setRouteIndex(Integer routeIndex) {
		this.routeIndex = routeIndex;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int compareTo(ExExamineRoute o) {
		if(this.routeIndex>o.routeIndex){
			return 0;
		}else{
			return -1;
		}
	}

	public static void main(String[] args){
		ExExamineDefined d = new ExExamineDefined();
		List<ExExamineRoute> routes = new ArrayList<ExExamineRoute>();
		ExExamineRoute rout1 = new ExExamineRoute();
		rout1.setRouteIndex(2);
		routes.add(rout1);
		ExExamineRoute rout2 = new ExExamineRoute();
		rout2.setRouteIndex(3);
		routes.add(rout2);
		ExExamineRoute rout3 = new ExExamineRoute();
		rout3.setRouteIndex(5);
		routes.add(rout3);
		ExExamineRoute rout4 = new ExExamineRoute();
		rout4.setRouteIndex(1);
		routes.add(rout4);
		System.out.println(routes);
		d.setExamineRouteList(routes);
		System.out.println(d.getExamineRouteList());
	}
}
