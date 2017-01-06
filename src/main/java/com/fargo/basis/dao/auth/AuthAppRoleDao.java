package com.fargo.basis.dao.auth;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.AuthAppRole;

/**
 * An interface that provides a data management interface to the AuthAppRole table.
 */
public interface AuthAppRoleDao extends GenericDao<AuthAppRole, Long> {

public void saveMainBody(AuthAppRole a0);
}