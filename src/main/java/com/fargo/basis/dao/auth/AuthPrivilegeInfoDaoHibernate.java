package com.fargo.basis.dao.auth;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.AuthPrivilegeInfo;
import com.fargo.basis.util.list.ListUtil;

@Repository("authPrivilegeInfoDao")
public class AuthPrivilegeInfoDaoHibernate extends GenericDaoHibernate<AuthPrivilegeInfo, Long> implements AuthPrivilegeInfoDao {

    public AuthPrivilegeInfoDaoHibernate() {
         super(AuthPrivilegeInfo.class);
    }
	@Override
	public void saveMainBody(AuthPrivilegeInfo a0)  {
		AuthPrivilegeInfo authPrivilegeInfo1=super.get(a0.getPrivilegeId());
		if(authPrivilegeInfo1!=null && authPrivilegeInfo1!=null){

		}	
		super.save(a0);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
			Long parentId = null;
			try{
				parentId = Long.parseLong(searchValue.getCustomPropertyValue().get("parentIdT").toString());
			}catch(Exception e){}
			if(parentId!=null){
				cr.add(Restrictions.eq("parent", parentId));
			}
			if(searchValue.getCombinedConditionValue()!=null){
				if(searchValue.getCombinedConditionValue().containsKey("operateName")){
					Object cvalue=searchValue.getCombinedConditionValue().get("operateName");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.in("operateName", ListUtil.pasreStringList(cvalue.toString(),",")));
					}
				}
				if(searchValue.getCombinedConditionValue().containsKey("operatorRequestType")){
					Object cvalue=searchValue.getCombinedConditionValue().get("operatorRequestType");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.in("operatorRequestType", ListUtil.pasreStringList(cvalue.toString(),",")));
					}
				}
				if(searchValue.getCombinedConditionValue().containsKey("privilegeName")){
					Object cvalue=searchValue.getCombinedConditionValue().get("privilegeName");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.like("privilegeName", cvalue.toString().trim(), MatchMode.ANYWHERE));
					}
				}
				if(searchValue.getCombinedConditionValue().containsKey("privilegeType")){
					Object cvalue=searchValue.getCombinedConditionValue().get("privilegeType");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.in("privilegeType", ListUtil.pasreStringList(cvalue.toString(),",")));
					}
				}
				if(searchValue.getCombinedConditionValue().containsKey("taskType")){
					Object cvalue=searchValue.getCombinedConditionValue().get("taskType");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.in("taskType", ListUtil.pasreStringList(cvalue.toString(),",")));
					}
				}
			}
	}
	@Override
	public AuthPrivilegeInfo getPreOrPostPrivilege(Long parentId,
			Integer moveType, AuthPrivilegeInfo currentAuth) {
		Criteria cri=this.getSession().createCriteria(AuthPrivilegeInfo.class);
		cri.add(Restrictions.eq("parent", parentId));
		if(moveType==0){
			cri.add(Restrictions.lt("sortNo", currentAuth.getSortNo()));
			cri.addOrder(Order.asc("sortNo"));
		}
		else if(moveType == 1){
			cri.add(Restrictions.gt("sortNo", currentAuth.getSortNo()));
			cri.addOrder(Order.desc("sortNo"));
		}
		AuthPrivilegeInfo privious= null;
		List<AuthPrivilegeInfo> preList = (List<AuthPrivilegeInfo>)cri.list().get(0);
		if(preList.size()>0){
			privious = preList.get(0);
		}
		return privious;
	}    
}
