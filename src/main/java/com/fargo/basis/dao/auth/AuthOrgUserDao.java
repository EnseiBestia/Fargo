package com.fargo.basis.dao.auth;


import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.AuthOrgUser;


/**
 * An interface that provides a data management interface to the AuthOrgUser table.
 */
public interface AuthOrgUserDao extends GenericDao<AuthOrgUser, Long> {

public void saveMainBody(AuthOrgUser a0);
}