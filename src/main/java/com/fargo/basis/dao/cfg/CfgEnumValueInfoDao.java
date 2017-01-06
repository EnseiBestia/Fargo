package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgEnumValueInfo;
public interface CfgEnumValueInfoDao extends GenericDao<CfgEnumValueInfo, Long> {

public void saveMainBody(CfgEnumValueInfo a0);
}