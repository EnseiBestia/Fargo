package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgStateMachineValue;



/**
 * An interface that provides a data management interface to the CfgStateMachineValue table.
 */
public interface CfgStateMachineValueDao extends GenericDao<CfgStateMachineValue, Long> {

public void saveMainBody(CfgStateMachineValue a0);
}