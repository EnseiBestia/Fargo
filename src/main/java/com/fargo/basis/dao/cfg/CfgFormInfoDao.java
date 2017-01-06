package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgFormInfo;



/**
 * An interface that provides a data management interface to the CfgFormInfo table.
 */
public interface CfgFormInfoDao extends GenericDao<CfgFormInfo, Long> {

public void saveMainBody(CfgFormInfo a0);
}