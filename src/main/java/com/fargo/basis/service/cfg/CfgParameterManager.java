package com.fargo.basis.service.cfg;

import com.fargo.basis.model.CfgParameter;
import com.fargo.basis.service.GenericManager;

//@WebService
public interface CfgParameterManager extends GenericManager<CfgParameter, Long> {
    public void saveMainBody(CfgParameter a0);
}