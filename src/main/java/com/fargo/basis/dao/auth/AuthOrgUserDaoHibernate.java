package com.fargo.basis.dao.auth;


import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.SpringContext;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.AuthOrgUser;

@Repository("authOrgUserDao")
public class AuthOrgUserDaoHibernate extends GenericDaoHibernate<AuthOrgUser, Long> implements AuthOrgUserDao {

    public AuthOrgUserDaoHibernate() {
         super(AuthOrgUser.class);
    }
	@Override
	public void saveMainBody(AuthOrgUser authOrgUser)  {
		AuthOrgUser authOrgUser2=super.get(authOrgUser.getUserId());
		if(authOrgUser!=null && authOrgUser2!=null){
			authOrgUser.setLibraryRoleList(authOrgUser2.getLibraryRoleList());
		}	
		super.save(authOrgUser);
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
		// TODO Auto-generated method stub
		
	}    
}
