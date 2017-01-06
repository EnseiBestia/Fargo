package com.fargo.basis.dao.st;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.AuthUser;
import com.fargo.basis.model.StSystemNoticeInfo;
import com.fargo.basis.util.list.ListUtil;


@Repository("stSystemNoticeInfoDao")
public class StSystemNoticeInfoDaoHibernate extends GenericDaoHibernate<StSystemNoticeInfo, Long> implements StSystemNoticeInfoDao {

    public StSystemNoticeInfoDaoHibernate() {
         super(StSystemNoticeInfo.class);
    }
	@Override
	public void saveMainBody(StSystemNoticeInfo stSystemNoticeInfo)  {
		StSystemNoticeInfo stSystemNoticeInfo2=super.get(stSystemNoticeInfo.getNoticeId());
		if(stSystemNoticeInfo!=null && stSystemNoticeInfo2!=null){
		}	
		super.save(stSystemNoticeInfo);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(Restrictions.eq("noticeLevel", searchValue.getTextValue()),
					Restrictions.eq("noticeName", searchValue.getTextValue()),
					Restrictions.eq("noticeText", searchValue.getTextValue()),
					Restrictions.eq("noticeType", searchValue.getTextValue()),
					Restrictions.eq("status", searchValue.getTextValue())));
		}
		    	
		//if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){}
		if(searchValue.getCombinedConditionValue()!=null){
			if(searchValue.getCombinedConditionValue().containsKey("noticeLevel")){
					Object cvalue=searchValue.getCombinedConditionValue().get("noticeLevel");
					if(cvalue!=null && !cvalue.toString().trim().equals("")){
						cr.add(Restrictions.in("noticeLevel", ListUtil.pasreStringList(cvalue.toString(),",")));
					}
			}
			if(searchValue.getCombinedConditionValue().containsKey("noticeName")){
				Object cvalue=searchValue.getCombinedConditionValue().get("noticeName");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.like("noticeName", cvalue.toString().trim(), MatchMode.ANYWHERE));
				}
			}
			if(searchValue.getCombinedConditionValue().containsKey("noticeType")){
				Object cvalue=searchValue.getCombinedConditionValue().get("noticeType");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.in("noticeType", ListUtil.pasreStringList(cvalue.toString(),",")));
				}
			}
			if(searchValue.getCombinedConditionValue().containsKey("status")){
				Object cvalue=searchValue.getCombinedConditionValue().get("status");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.in("status", ListUtil.pasreStringList(cvalue.toString(),",")));
				}
			}
		}
	}
	@Override
	public List<StSystemNoticeInfo> getNoticeByUser(AuthUser user, Long library) {
		/*Criteria cri=this.getSession().createCriteria(AuthUser.class);
		if(user.getRoleList(library)!=null && user.getRoleList(library).size()>0){
			cri.add(Restrictions.eq("status", "BVF"));
			cri.add(Restrictions.or(arg0))
			q.and(q.criteria("status").equal("BVF"),q.or(
					q.criteria("overt").equal(true),q.and(
							q.criteria("library").equal(library),q.or(
									q.criteria("roleList").hasAnyOf(user.getRoleList(library)),q.criteria("userList").hasThisOne(user.getUserId())
							)
					)
			));

		}else{
			q.and(q.criteria("status").equal("BVF"),q.or(
					q.criteria("overt").equal(true),q.and(
							q.criteria("library").equal(library),q.criteria("userList").hasThisOne(user.getUserId())
					)
			));

		}
		//q.and(q.criteria("status").equal("BVF"),q.or(q.criteria("userList").hasThisOne(user.getUserId())));
		q.order("-"+Mapper.ID_KEY);
		return q.asList();*/
		return null;
	}    
}
