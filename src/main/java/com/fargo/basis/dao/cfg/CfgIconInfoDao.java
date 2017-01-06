package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgIconInfo;



/**
 * An interface that provides a data management interface to the CfgIconInfo table.
 */
public interface CfgIconInfoDao extends GenericDao<CfgIconInfo, Long> {

public void saveMainBody(CfgIconInfo a0);
}