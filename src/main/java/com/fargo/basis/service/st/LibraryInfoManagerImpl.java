package com.fargo.basis.service.st;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.st.LibraryInfoDao;
import com.fargo.basis.model.LibraryInfo;
import com.fargo.basis.service.GenericManagerImpl;


@Service("libraryInfoManager")
public class LibraryInfoManagerImpl extends GenericManagerImpl<LibraryInfo, Long> implements LibraryInfoManager {
    LibraryInfoDao libraryInfoDao;

    @Autowired
    public LibraryInfoManagerImpl(LibraryInfoDao libraryInfoDao) {
        super(libraryInfoDao);
        this.libraryInfoDao = libraryInfoDao;
    }
    @Override
	public void saveMainBody(LibraryInfo libraryInfo) {
		// TODO Auto-generated method stub
		this.libraryInfoDao.saveMainBody(libraryInfo);
	}
}