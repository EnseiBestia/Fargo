package com.fargo.basis.service.cfg;

import com.fargo.basis.model.CfgIconInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface CfgIconInfoManager extends GenericManager<CfgIconInfo, Long> {
    public void saveMainBody(CfgIconInfo a0);
}