package com.fargo.basis.service.auth;


import com.fargo.basis.model.AuthPrivilegeInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface AuthPrivilegeInfoManager extends GenericManager<AuthPrivilegeInfo, Long> {
    public void saveMainBody(AuthPrivilegeInfo a0);
    public void rebuildChildPivilege(AuthPrivilegeInfo authPrivilegeInfo);
	public void saveMove(Long parentId, Long privilegeId, Integer moveType);
}