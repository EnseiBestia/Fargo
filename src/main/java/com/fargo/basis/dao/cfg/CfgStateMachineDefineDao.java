package com.fargo.basis.dao.cfg;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.CfgStateMachineDefine;




/**
 * An interface that provides a data management interface to the CfgStateMachineDefine table.
 */
public interface CfgStateMachineDefineDao extends GenericDao<CfgStateMachineDefine, Long> {

public void saveMainBody(CfgStateMachineDefine a0);
}