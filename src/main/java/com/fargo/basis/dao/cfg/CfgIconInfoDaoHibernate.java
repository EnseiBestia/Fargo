package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgIconInfo;


@Repository("cfgIconInfoDao")
public class CfgIconInfoDaoHibernate extends GenericDaoHibernate<CfgIconInfo, Long> implements CfgIconInfoDao {

    public CfgIconInfoDaoHibernate() {
         super(CfgIconInfo.class);
    }
	@Override
	public void saveMainBody(CfgIconInfo cfgIconInfo)  {
		CfgIconInfo cfgIconInfo2=super.get(cfgIconInfo.getIconId());
		if(cfgIconInfo!=null && cfgIconInfo2!=null){
			
		}	
		super.save(cfgIconInfo);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(
					Restrictions.like("iconCode", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("iconFolder", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("iconName", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("iconSize", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("iconSize", searchValue.getTextValue(), MatchMode.ANYWHERE)));
    	}		
	}    
}
