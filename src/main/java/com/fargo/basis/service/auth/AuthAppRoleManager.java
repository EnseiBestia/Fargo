package com.fargo.basis.service.auth;


import com.fargo.basis.model.AuthAppRole;
import com.fargo.basis.service.GenericManager;

//@WebService
public interface AuthAppRoleManager extends GenericManager<AuthAppRole, Long> {
    public void saveMainBody(AuthAppRole a0);
}