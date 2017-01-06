package com.fargo.basis.service.cfg;

import com.fargo.basis.model.CfgEnumValueInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface CfgEnumValueInfoManager extends GenericManager<CfgEnumValueInfo, Long> {
    public void saveMainBody(CfgEnumValueInfo a0);
}