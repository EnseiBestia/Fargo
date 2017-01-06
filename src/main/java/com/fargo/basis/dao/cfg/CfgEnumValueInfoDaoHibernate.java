package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgEnumValueInfo;


@Repository("cfgEnumValueInfoDao")
public class CfgEnumValueInfoDaoHibernate extends GenericDaoHibernate<CfgEnumValueInfo, Long> implements CfgEnumValueInfoDao {

    public CfgEnumValueInfoDaoHibernate() {
         super(CfgEnumValueInfo.class);
    }
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		// TODO Auto-generated method stub
		
	}    
}
