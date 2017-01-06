package com.fargo.basis.service.cfg;

import java.util.List;

import com.fargo.basis.model.CfgEnumInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface CfgEnumInfoManager extends GenericManager<CfgEnumInfo, Long> {
    public void saveMainBody(CfgEnumInfo a0);
    
    public List<CfgEnumInfo> getCfgEnumInfoByCode(String enumCode);
}