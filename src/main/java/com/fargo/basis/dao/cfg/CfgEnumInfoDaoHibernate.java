package com.fargo.basis.dao.cfg;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgEnumInfo;


@Repository("cfgEnumInfoDao")
public class CfgEnumInfoDaoHibernate extends GenericDaoHibernate<CfgEnumInfo, Long> implements CfgEnumInfoDao {

    public CfgEnumInfoDaoHibernate() {
    	super(CfgEnumInfo.class);
    }
	@Override
	public void saveMainBody(CfgEnumInfo cfgEnumInfo)  {
		CfgEnumInfo cfgEnumInfo2=super.get(cfgEnumInfo.getEnumId());
		if(cfgEnumInfo!=null && cfgEnumInfo2!=null){
			cfgEnumInfo.setValues(cfgEnumInfo2.getValues());
		}	
		super.save(cfgEnumInfo);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
			cr.add(Restrictions.or(
					Restrictions.like("constantName", searchValue.getTextValue(), MatchMode.ANYWHERE),
					Restrictions.like("enumCode", searchValue.getTextValue(),MatchMode.ANYWHERE),
					Restrictions.like("enumName", searchValue.getTextValue(),MatchMode.ANYWHERE)));
			cr.addOrder(Order.desc("enumCode"));
    	}		
	}
	@Override
	public List<CfgEnumInfo> getCfgEnumInfoByCode(String enumCode) {
		Criteria cri=this.getSession().createCriteria(CfgEnumInfo.class);
		cri.add(Restrictions.eq("enumCode", enumCode));
		return cri.list();
	}    
}
