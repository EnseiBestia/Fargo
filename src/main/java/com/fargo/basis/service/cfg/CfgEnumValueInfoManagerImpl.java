package com.fargo.basis.service.cfg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgEnumValueInfoDao;
import com.fargo.basis.model.CfgEnumValueInfo;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgEnumValueInfoManager")
public class CfgEnumValueInfoManagerImpl extends GenericManagerImpl<CfgEnumValueInfo, Long> implements CfgEnumValueInfoManager {
    CfgEnumValueInfoDao cfgEnumValueInfoDao;

    @Autowired
    public CfgEnumValueInfoManagerImpl(CfgEnumValueInfoDao cfgEnumValueInfoDao) {
        super(cfgEnumValueInfoDao);
        this.cfgEnumValueInfoDao = cfgEnumValueInfoDao;
    }
    @Override
	public void saveMainBody(CfgEnumValueInfo cfgEnumValueInfo) {
		// TODO Auto-generated method stub
		this.cfgEnumValueInfoDao.saveMainBody(cfgEnumValueInfo);
	}
}