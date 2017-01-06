package com.fargo.basis.dao.st;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.LibraryInfo;
/**
 * An interface that provides a data management interface to the LibraryInfo table.
 */
public interface LibraryInfoDao extends GenericDao<LibraryInfo, Long> {

public void saveMainBody(LibraryInfo a0);
}