package com.fargo.basis.dao.auth;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.dao.hibernate.GenericDaoHibernate;
import com.fargo.basis.model.AuthAppUser;
import com.fargo.basis.util.ValidateUtil;

@Repository("authAppUserDao")
public class AuthAppUserDaoHibernate extends GenericDaoHibernate<AuthAppUser, Long> implements AuthAppUserDao,UserDetailsService {
    public AuthAppUserDaoHibernate() {
         super(AuthAppUser.class);
    }
	@Override
	public void saveMainBody(AuthAppUser authAppUser)  {
		AuthAppUser authAppUser2=super.get(authAppUser.getUserId());
		if(authAppUser!=null && authAppUser2!=null){
			authAppUser.setLibraryRoleList(authAppUser2.getLibraryRoleList());
		}	
		super.save(authAppUser);
	      
	}
	
	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Criteria cri = this.getSession().createCriteria(AuthAppUser.class);
		if(ValidateUtil.checkEmail(username)){
			cri.add(Restrictions.eq("email", username));
		}else if(ValidateUtil.checkPhone(username)){
			cri.add(Restrictions.eq("phoneNumber", new Long(username)));
		}else{
			cri.add(Restrictions.eq("userName", username));
		}
		List<AuthAppUser> users =null;
		try{
		 users = cri.list();
		}catch(Exception e){
			e.printStackTrace();
		}
        if (users == null || users.isEmpty()) {
            throw new UsernameNotFoundException("user '" + username + "' not found...");
        } else {
        	System.out.println("loadUserByUsername["+username+"]:"+users.get(0).toString());
            return (UserDetails) users.get(0);
        }
	}
	@Override
	protected void assembleQryParam(SearchConditionValue searchValue,
			Criteria cr) {
				// TODO Auto-generated method stub
			if(searchValue.getTextValue()!=null && !"".equals(searchValue.getTextValue())){
				cr.add(Restrictions.or(
						Restrictions.like("email", searchValue.getTextValue(), MatchMode.ANYWHERE),
						Restrictions.like("fullName", searchValue.getTextValue(), MatchMode.ANYWHERE),
						Restrictions.like("password", searchValue.getTextValue(), MatchMode.ANYWHERE),
						Restrictions.like("passwordHint", searchValue.getTextValue(), MatchMode.ANYWHERE),
						Restrictions.like("userName", searchValue.getTextValue(), MatchMode.ANYWHERE)));
	    	}
		    	
	}
	@Override
	public boolean checkExistsProperty(Long userId, String propValue,
			String propType) {
		Criteria cri=this.getSession().createCriteria(AuthAppUser.class);
		cri.add(Restrictions.eq(propType, propValue));
		cri.add(Restrictions.ne("userId", userId));
		int cc=cri.list().size();
		return cc<=0;
	}    
	
	
}
