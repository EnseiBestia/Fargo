package com.fargo.basis.service.cfg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.cfg.CfgEnumInfoDao;
import com.fargo.basis.model.CfgEnumInfo;
import com.fargo.basis.service.GenericManagerImpl;


@Service("cfgEnumInfoManager")
public class CfgEnumInfoManagerImpl extends GenericManagerImpl<CfgEnumInfo, Long> implements CfgEnumInfoManager {
    CfgEnumInfoDao cfgEnumInfoDao;

    @Autowired
    public CfgEnumInfoManagerImpl(CfgEnumInfoDao cfgEnumInfoDao) {
        super(cfgEnumInfoDao);
        this.cfgEnumInfoDao = cfgEnumInfoDao;
    }
    @Override
	public void saveMainBody(CfgEnumInfo cfgEnumInfo) {
		// TODO Auto-generated method stub
		this.cfgEnumInfoDao.saveMainBody(cfgEnumInfo);
	}
  
	@Override
	public List<CfgEnumInfo> getCfgEnumInfoByCode(String enumCode) {
		return cfgEnumInfoDao.getCfgEnumInfoByCode(enumCode);
	}
}