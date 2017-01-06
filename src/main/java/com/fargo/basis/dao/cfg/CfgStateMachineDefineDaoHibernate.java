package com.fargo.basis.dao.cfg;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.CfgStateMachineDefine;
import com.fargo.basis.util.list.ListUtil;

@Repository("cfgStateMachineDefineDao")
public class CfgStateMachineDefineDaoHibernate extends GenericDaoHibernate<CfgStateMachineDefine, Long> implements CfgStateMachineDefineDao {

    public CfgStateMachineDefineDaoHibernate() {
         super(CfgStateMachineDefine.class);
    }
	@Override
	public void saveMainBody(CfgStateMachineDefine cfgStateMachineDefine)  {
		CfgStateMachineDefine cfgStateMachineDefine2=super.get(cfgStateMachineDefine.getMachineId());
		if(cfgStateMachineDefine!=null && cfgStateMachineDefine2!=null){
		}	
		super.save(cfgStateMachineDefine);
	     
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		
		if(searchValue.getCombinedConditionValue()!=null){
			if(searchValue.getCombinedConditionValue().containsKey("enumId")){
				Object cvalue=searchValue.getCombinedConditionValue().get("enumId");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.in("enumId", ListUtil.pasreLongList(cvalue.toString(),",")));
				}
			}
			if(searchValue.getCombinedConditionValue().containsKey("machineName")){
				Object cvalue=searchValue.getCombinedConditionValue().get("machineName");
				if(cvalue!=null && !cvalue.toString().trim().equals("")){
					cr.add(Restrictions.like("machineName", cvalue.toString().trim(),MatchMode.ANYWHERE));
				}
			}
		}
	}
}
