package com.fargo.basis.util.list.comparator;

import java.util.Comparator;

import com.fargo.basis.cache.model.AuthPrivilegeView;


public class ComparatorAuthPrivilege implements Comparator<AuthPrivilegeView> {

	@Override
	public int compare(AuthPrivilegeView user0, AuthPrivilegeView user1) {
		// TODO Auto-generated method stub
		// 首先比较年龄，如果年龄相同，则比较名字

		int flag = new Double(user0.getAuthPrivilegeInfo().getSortNo()).compareTo(user1.getAuthPrivilegeInfo().getSortNo());
		if (flag == 0) {
			return user0.getAuthPrivilegeInfo().getPrivilegeId().compareTo(user1.getAuthPrivilegeInfo().getPrivilegeId());
		} else {
			return flag;
		}
	}

}
