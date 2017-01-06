package com.fargo.basis.dao.cfg;

import java.util.List;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgEnumInfo;

/**
 * An interface that provides a data management interface to the CfgEnumInfo table.
 */
public interface CfgEnumInfoDao extends GenericDao<CfgEnumInfo, Long> {

public void saveMainBody(CfgEnumInfo a0);
List<CfgEnumInfo> getCfgEnumInfoByCode(String enumCode);
}