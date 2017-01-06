package com.fargo.basis.service.auth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.auth.AuthAppRoleDao;
import com.fargo.basis.model.AuthAppRole;
import com.fargo.basis.service.GenericManagerImpl;


@Service("authAppRoleManager")
public class AuthAppRoleManagerImpl extends GenericManagerImpl<AuthAppRole, Long> implements AuthAppRoleManager {
    AuthAppRoleDao authAppRoleDao;

    @Autowired
    public AuthAppRoleManagerImpl(AuthAppRoleDao authAppRoleDao) {
        super(authAppRoleDao);
        this.authAppRoleDao = authAppRoleDao;
    }
    @Override
	public void saveMainBody(AuthAppRole authAppRole) {
		// TODO Auto-generated method stub
		this.authAppRoleDao.saveMainBody(authAppRole);
	}
}