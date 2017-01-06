package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgStateMachineValueDao;
import com.fargo.basis.model.CfgStateMachineValue;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgStateMachineValueManager")
public class CfgStateMachineValueManagerImpl extends GenericManagerImpl<CfgStateMachineValue, Long> implements CfgStateMachineValueManager {
    CfgStateMachineValueDao cfgStateMachineValueDao;

    @Autowired
    public CfgStateMachineValueManagerImpl(CfgStateMachineValueDao cfgStateMachineValueDao) {
        super(cfgStateMachineValueDao);
        this.cfgStateMachineValueDao = cfgStateMachineValueDao;
    }
    @Override
	public void saveMainBody(CfgStateMachineValue cfgStateMachineValue) {
		// TODO Auto-generated method stub
		this.cfgStateMachineValueDao.saveMainBody(cfgStateMachineValue);
	}
}