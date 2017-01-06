package com.fargo.basis.service.cfg;

import com.fargo.basis.model.CfgFormInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface CfgFormInfoManager extends GenericManager<CfgFormInfo, Long> {
    public void saveMainBody(CfgFormInfo a0);
}