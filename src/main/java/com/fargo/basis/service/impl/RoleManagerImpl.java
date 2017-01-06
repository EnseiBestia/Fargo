package com.fargo.basis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.RoleDao;
import com.fargo.basis.model.Role;
import com.fargo.basis.service.GenericManagerImpl;
import com.fargo.basis.service.RoleManager;

/**
 * Implementation of RoleManager interface.
 *
 * @author <a href="mailto:dan@getrolling.com">Dan Kibler</a>
 */
@Service("roleManager")
public class RoleManagerImpl extends GenericManagerImpl<Role, Long> implements RoleManager {
    RoleDao roleDao;

    @Autowired
    public RoleManagerImpl(RoleDao roleDao) {
        super(roleDao);
        this.roleDao = roleDao;
    }

    /**
     * {@inheritDoc}
     */
    public List<Role> getRoles(Role role) {
        return roleDao.getAll();
    }

    /**
     * {@inheritDoc}
     */
    public Role getRole(String rolename) {
        return roleDao.getRoleByName(rolename);
    }

    /**
     * {@inheritDoc}
     */
    public Role saveRole(Role role) {
        return roleDao.save(role);
    }

    /**
     * {@inheritDoc}
     */
    public void removeRole(String rolename) {
        roleDao.removeRole(rolename);
    }
}