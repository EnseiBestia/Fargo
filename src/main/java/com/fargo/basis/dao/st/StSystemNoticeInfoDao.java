package com.fargo.basis.dao.st;

import java.util.List;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.model.AuthUser;
import com.fargo.basis.model.StSystemNoticeInfo;

/**
 * An interface that provides a data management interface to the StSystemNoticeInfo table.
 */
public interface StSystemNoticeInfoDao extends GenericDao<StSystemNoticeInfo, Long> {

public void saveMainBody(StSystemNoticeInfo a0);
List<StSystemNoticeInfo> getNoticeByUser(AuthUser user, Long library);
}