package com.fargo.basis.dao.auth;
import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.AuthPrivilegeInfo;

/**
 * An interface that provides a data management interface to the AuthPrivilegeInfo table.
 */
public interface AuthPrivilegeInfoDao extends GenericDao<AuthPrivilegeInfo, Long> {

public void saveMainBody(AuthPrivilegeInfo a0);
public AuthPrivilegeInfo getPreOrPostPrivilege(Long parentId, Integer moveType,AuthPrivilegeInfo currentAuth);
}