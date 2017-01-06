package com.fargo.basis.service.st;

import com.fargo.basis.model.LibraryInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface LibraryInfoManager extends GenericManager<LibraryInfo, Long> {
    public void saveMainBody(LibraryInfo a0);
}