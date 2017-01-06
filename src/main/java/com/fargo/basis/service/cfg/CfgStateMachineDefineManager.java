package com.fargo.basis.service.cfg;

import com.fargo.basis.model.CfgStateMachineDefine;
import com.fargo.basis.service.GenericManager;

//@WebService
public interface CfgStateMachineDefineManager extends GenericManager<CfgStateMachineDefine, Long> {
    public void saveMainBody(CfgStateMachineDefine a0);
}