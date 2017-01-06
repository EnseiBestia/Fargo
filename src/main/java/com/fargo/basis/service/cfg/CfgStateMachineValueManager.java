package com.fargo.basis.service.cfg;


import com.fargo.basis.model.CfgStateMachineValue;
import com.fargo.basis.service.GenericManager;

//@WebService
public interface CfgStateMachineValueManager extends GenericManager<CfgStateMachineValue, Long> {
    public void saveMainBody(CfgStateMachineValue a0);
}