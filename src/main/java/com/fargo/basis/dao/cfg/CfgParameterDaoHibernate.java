package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgParameter;


@Repository("cfgParameterDao")
public class CfgParameterDaoHibernate extends GenericDaoHibernate<CfgParameter, Long> implements CfgParameterDao {
    public CfgParameterDaoHibernate() {
         super(CfgParameter.class);
    }
	@Override
	public void saveMainBody(CfgParameter cfgParameter)  {
		CfgParameter cfgParameter2=super.get(cfgParameter.getParameterId());
		if(cfgParameter!=null && cfgParameter2!=null){
		}	
		super.save(cfgParameter);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(
					Restrictions.like("description", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("name", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("note", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("value", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("iconSize", searchValue.getTextValue(), MatchMode.ANYWHERE)));
    	}		
	}    
		
}
