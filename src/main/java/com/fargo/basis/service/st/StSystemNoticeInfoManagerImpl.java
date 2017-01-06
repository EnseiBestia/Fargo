package com.fargo.basis.service.st;

import java.util.List;

import org.apache.tools.ant.types.Mapper;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.st.StSystemNoticeInfoDao;
import com.fargo.basis.model.AuthUser;
import com.fargo.basis.model.StSystemNoticeInfo;
import com.fargo.basis.service.GenericManagerImpl;



@Service("stSystemNoticeInfoManager")
public class StSystemNoticeInfoManagerImpl extends GenericManagerImpl<StSystemNoticeInfo, Long> implements StSystemNoticeInfoManager {
    StSystemNoticeInfoDao stSystemNoticeInfoDao;

    @Autowired
    public StSystemNoticeInfoManagerImpl(StSystemNoticeInfoDao stSystemNoticeInfoDao) {
        super(stSystemNoticeInfoDao);
        this.stSystemNoticeInfoDao = stSystemNoticeInfoDao;
    }
    @Override
	public void saveMainBody(StSystemNoticeInfo stSystemNoticeInfo) {
		// TODO Auto-generated method stub
		this.stSystemNoticeInfoDao.saveMainBody(stSystemNoticeInfo);
	}
	@Override
	public List<StSystemNoticeInfo> getNoticeByUser(AuthUser user, Long library) {
		// TODO Auto-generated method stub
		return  stSystemNoticeInfoDao.getNoticeByUser(user, library);
	}
}