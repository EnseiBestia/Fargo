package com.fargo.basis.dao.auth;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.AuthAppRole;

@Repository("authAppRoleDao")
public class AuthAppRoleDaoHibernate extends GenericDaoHibernate<AuthAppRole, Long> implements AuthAppRoleDao {

    public AuthAppRoleDaoHibernate() {
         super(AuthAppRole.class);
    }
	@Override
	public void saveMainBody(AuthAppRole authAppRole)  {
/*		AuthAppRole authAppRole2=super.get(authAppRole.getRoleId());
		if(authAppRole!=null && authAppRole2!=null){
		}	
		super.save(authAppRole);*/
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
			if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
				cr.add(Restrictions.or(Restrictions.like("description", searchValue.getTextValue(), MatchMode.ANYWHERE),Restrictions.like("roleName", searchValue.getTextValue(),MatchMode.ANYWHERE)));
	    	}
	}    
}
