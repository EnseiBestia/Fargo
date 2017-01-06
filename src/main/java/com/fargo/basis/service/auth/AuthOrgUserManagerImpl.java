package com.fargo.basis.service.auth;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.GenericDao;
import com.fargo.basis.dao.auth.AuthOrgUserDao;
import com.fargo.basis.model.AuthOrgUser;
import com.fargo.basis.service.GenericManagerImpl;


@Service("authOrgUserManager")
public class AuthOrgUserManagerImpl extends GenericManagerImpl<AuthOrgUser, Long> implements AuthOrgUserManager {
	private AuthOrgUserDao authOrgUserDao;
	@Autowired
	public AuthOrgUserManagerImpl(AuthOrgUserDao authOrgUserDao) {
		super(authOrgUserDao);
		this.authOrgUserDao = authOrgUserDao;
		// TODO Auto-generated constructor stub
	}

	@Override
	public Boolean checkUniqueIndexForUserName(Long userId, String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean checkUniqueIndexForEmail(Long userId, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean checkUniqueIndexForPhoneNumber(Long userId,
			String phoneNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuthOrgUser getAuthOrgUserByObjectId(Long objectInfoId, Long objectId) {
		// TODO Auto-generated method stub
		return null;
	}
  /*  AuthOrgUserDao authOrgUserDao;

    @Autowired
    public AuthOrgUserManagerImpl(AuthOrgUserDao authOrgUserDao) {
        super(authOrgUserDao);
        this.authOrgUserDao = authOrgUserDao;
    }
    @Override
	public void saveMainBody(AuthOrgUser authOrgUser) {
		// TODO Auto-generated method stub
		this.authOrgUserDao.saveMainBody(authOrgUser);
	}
    @Override
	public Boolean checkUniqueIndexForUserName(Long userId,String userName) {
		// TODO Auto-generated method stub
		if(userName==null || "".equals(userName.trim())){
			return true;
		}else{
			Query<AuthOrgUser> q=this.dao.createQuery();
			q.and(q.criteria("userName").equal(userName),q.criteria("_id").notEqual(userId));
			int cc=q.asKeyList().size();//this.dao.findIds("userName", userName).size();
			return cc<=0;
		}
		
	}


	@Override
	public Boolean checkUniqueIndexForEmail(Long userId,String email) {
		// TODO Auto-generated method stub
		if(email==null || "".equals(email.trim())){
			return true;
		}else{
			//int cc=this.dao.findIds("email", email).size();
			Query<AuthOrgUser> q=this.dao.createQuery();
			q.and(q.criteria("email").equal(email),q.criteria("_id").notEqual(userId));
			int cc=q.asKeyList().size();
			return cc<=0;
		}
	}


	@Override
	public Boolean checkUniqueIndexForPhoneNumber(Long userId,String phoneNumber) {
		// TODO Auto-generated method stub
		if(phoneNumber==null || "".equals(phoneNumber.trim())){
			return true;
		}else{
			//int cc=this.dao.findIds("phoneNumber", new Long(phoneNumber)).size();
			Query<AuthOrgUser> q=this.dao.createQuery();
			q.and(q.criteria("phoneNumber").equal(phoneNumber),q.criteria("_id").notEqual(userId));
			int cc=q.asKeyList().size();
			return cc<=0;
		}
	}
	public AuthOrgUser getAuthOrgUserByObjectId(Long objectInfoId,Long objectId){
		Query<AuthOrgUser> q=this.dao.createQuery();
		q.criteria("objectId").equal(objectInfoId);
		q.criteria("objectInstanceId").equal(objectId);
		List<AuthOrgUser> list=q.asList();
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}*/
}