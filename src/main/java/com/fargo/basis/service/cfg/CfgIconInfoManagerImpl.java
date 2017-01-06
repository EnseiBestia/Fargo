package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgIconInfoDao;
import com.fargo.basis.model.CfgIconInfo;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgIconInfoManager")
public class CfgIconInfoManagerImpl extends GenericManagerImpl<CfgIconInfo, Long> implements CfgIconInfoManager {
    CfgIconInfoDao cfgIconInfoDao;

    @Autowired
    public CfgIconInfoManagerImpl(CfgIconInfoDao cfgIconInfoDao) {
        super(cfgIconInfoDao);
        this.cfgIconInfoDao = cfgIconInfoDao;
    }
    @Override
	public void saveMainBody(CfgIconInfo cfgIconInfo) {
		// TODO Auto-generated method stub
		this.cfgIconInfoDao.saveMainBody(cfgIconInfo);
	}
}