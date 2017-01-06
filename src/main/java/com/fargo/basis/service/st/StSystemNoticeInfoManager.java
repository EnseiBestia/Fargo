package com.fargo.basis.service.st;

import java.util.List;

import com.fargo.basis.model.AuthUser;
import com.fargo.basis.model.StSystemNoticeInfo;
import com.fargo.basis.service.GenericManager;


//@WebService
public interface StSystemNoticeInfoManager extends GenericManager<StSystemNoticeInfo, Long> {
    public void saveMainBody(StSystemNoticeInfo a0);

	public List<StSystemNoticeInfo> getNoticeByUser(AuthUser user, Long library);
}