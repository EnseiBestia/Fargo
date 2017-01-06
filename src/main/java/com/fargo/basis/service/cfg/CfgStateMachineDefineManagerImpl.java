package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgStateMachineDefineDao;
import com.fargo.basis.model.CfgStateMachineDefine;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgStateMachineDefineManager")
public class CfgStateMachineDefineManagerImpl extends GenericManagerImpl<CfgStateMachineDefine, Long> implements CfgStateMachineDefineManager {
    CfgStateMachineDefineDao cfgStateMachineDefineDao;

    @Autowired
    public CfgStateMachineDefineManagerImpl(CfgStateMachineDefineDao cfgStateMachineDefineDao) {
        super(cfgStateMachineDefineDao);
        this.cfgStateMachineDefineDao = cfgStateMachineDefineDao;
    }
    @Override
	public void saveMainBody(CfgStateMachineDefine cfgStateMachineDefine) {
		// TODO Auto-generated method stub
		this.cfgStateMachineDefineDao.saveMainBody(cfgStateMachineDefine);
	}
}