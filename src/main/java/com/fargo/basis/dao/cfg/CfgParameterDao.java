package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgParameter;



/**
 * An interface that provides a data management interface to the CfgParameter table.
 */
public interface CfgParameterDao extends GenericDao<CfgParameter, Long> {

public void saveMainBody(CfgParameter a0);
}