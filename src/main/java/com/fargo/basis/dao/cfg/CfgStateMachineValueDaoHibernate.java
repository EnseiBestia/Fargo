package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgStateMachineValue;

@Repository("cfgStateMachineValueDao")
public class CfgStateMachineValueDaoHibernate extends GenericDaoHibernate<CfgStateMachineValue, Long> implements CfgStateMachineValueDao {

    public CfgStateMachineValueDaoHibernate() {
         super(CfgStateMachineValue.class);
    }
	@Override
	public void saveMainBody(CfgStateMachineValue cfgStateMachineValue)  {
		CfgStateMachineValue cfgStateMachineValue2=super.get(cfgStateMachineValue.getStatId());
		if(cfgStateMachineValue!=null && cfgStateMachineValue2!=null){
			cfgStateMachineValue.setButtons(cfgStateMachineValue2.getButtons());
		}	
		super.save(cfgStateMachineValue);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		Long machineId = null;
		try{
			machineId = Long.parseLong(searchValue.getCustomPropertyValue().get("machineId_c").toString());
		}catch(Exception e){}
		if(machineId!=null){
			cr.add(Restrictions.eq("machineId", machineId));
		}
	    if(searchValue.getCombinedConditionValue()!=null){
			if(searchValue.getCombinedConditionValue().containsKey("statName")){
				Object cvalue=searchValue.getCombinedConditionValue().get("statName");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.like("statName", cvalue.toString().trim(),MatchMode.ANYWHERE));
				}
			}
	    }

	}    
}
