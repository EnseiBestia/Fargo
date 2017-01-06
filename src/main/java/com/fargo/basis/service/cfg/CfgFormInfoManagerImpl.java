package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgFormInfoDao;
import com.fargo.basis.model.CfgFormInfo;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgFormInfoManager")
public class CfgFormInfoManagerImpl extends GenericManagerImpl<CfgFormInfo, Long> implements CfgFormInfoManager {
    CfgFormInfoDao cfgFormInfoDao;

    @Autowired
    public CfgFormInfoManagerImpl(CfgFormInfoDao cfgFormInfoDao) {
        super(cfgFormInfoDao);
        this.cfgFormInfoDao = cfgFormInfoDao;
    }
    @Override
	public void saveMainBody(CfgFormInfo cfgFormInfo) {
		// TODO Auto-generated method stub
		this.cfgFormInfoDao.saveMainBody(cfgFormInfo);
	}
}