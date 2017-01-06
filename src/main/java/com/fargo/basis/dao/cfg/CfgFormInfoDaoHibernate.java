package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgFormInfo;

@Repository("cfgFormInfoDao")
public class CfgFormInfoDaoHibernate extends GenericDaoHibernate<CfgFormInfo, Long> implements CfgFormInfoDao {

    public CfgFormInfoDaoHibernate() {
         super(CfgFormInfo.class);
    }
	@Override
	public void saveMainBody(CfgFormInfo cfgFormInfo)  {
		CfgFormInfo cfgFormInfo2=super.get(cfgFormInfo.getFormId());
		if(cfgFormInfo!=null && cfgFormInfo2!=null){
		}	
		super.save(cfgFormInfo);
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
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(
					Restrictions.like("formCode", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("formName", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("modelClassName", searchValue.getTextValue(), MatchMode.ANYWHERE)));
		}			    	
	}    
}
