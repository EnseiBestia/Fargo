package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgParameterDao;
import com.fargo.basis.model.CfgParameter;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgParameterManager")
public class CfgParameterManagerImpl extends GenericManagerImpl<CfgParameter, Long> implements CfgParameterManager {
    CfgParameterDao cfgParameterDao;

    @Autowired
    public CfgParameterManagerImpl(CfgParameterDao cfgParameterDao) {
        super(cfgParameterDao);
        this.cfgParameterDao = cfgParameterDao;
    }
    @Override
	public void saveMainBody(CfgParameter cfgParameter) {
		// TODO Auto-generated method stub
		this.cfgParameterDao.saveMainBody(cfgParameter);
	}
}