package com.fargo.basis.service.auth;


import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.auth.AuthAppUserDao;
import com.fargo.basis.model.AuthAppUser;
import com.fargo.basis.model.AuthUserLibraryRole;
import com.fargo.basis.service.GenericManagerImpl;
import com.fargo.basis.util.codec.AES;


@Service("authAppUserManager")
public class AuthAppUserManagerImpl extends GenericManagerImpl<AuthAppUser, Long> implements AuthAppUserManager {
    AuthAppUserDao authAppUserDao;
    protected final Log log = LogFactory.getLog(getClass());
    @Autowired
    public AuthAppUserManagerImpl(AuthAppUserDao authAppUserDao) {
        super(authAppUserDao);
        this.authAppUserDao = authAppUserDao;
    }
    
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    
    @Override
	public void saveMainBody(AuthAppUser authAppUser) {
		// TODO Auto-generated method stub
		this.authAppUserDao.saveMainBody(authAppUser);
	}

    public AuthAppUser save(AuthAppUser object) {    	
    	return save(object,false);
    }
    public String getEncoderedPasword(String password){
    	if (passwordEncoder != null) {
            return passwordEncoder.encodePassword(password, null);
        } else {
        	return null;
        } 
    }
    public AuthAppUser saveForChangePassword(AuthAppUser user){
        if (passwordEncoder != null) {
            // Check whether we have to encrypt (or re-encrypt) the password
            
        	try {
				user.setPasswordHint(new AES().encrypt(user.getPassword()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
        	
        } else {
            log.warn("PasswordEncoder not set, skipping password encryption...");
        }
        authAppUserDao.save(user);
        return user;
    }
    public AuthAppUser save(AuthAppUser user,boolean ifNew){
        if (passwordEncoder != null) {
            // Check whether we have to encrypt (or re-encrypt) the password
            if (ifNew) {
                // New user, always encrypt
            	try {
					user.setPasswordHint(new AES().encrypt(user.getPassword()));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
            	user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
            	
            	user.setCreateTime(new Date());
            	user.setUpdateTime(new Date());
                
            } else {
            	
            	AuthAppUser olduser=this.get(user.getUserId());
                /*if(olduser!=null && olduser.getPasswordHint()!=null && olduser.getPasswordHint().equals(user.getPasswordHint())){*/
            	if(olduser!=null){
                	user.setPassword(olduser.getPassword());
                	user.setPasswordHint(olduser.getPasswordHint());
                	user.setLibraryRoleList(olduser.getLibraryRoleList());
                }
                user.setCreateTime(olduser.getCreateTime());
                user.setUpdateTime(new Date());
            }

        } else {
            log.warn("PasswordEncoder not set, skipping password encryption...");
        }
        authAppUserDao.save(user);
        return user;
    }

    public AuthAppUser libraryRoleSave(AuthAppUser user){
        
    	AuthAppUser olduser=this.get(user.getUserId());
        /*if(olduser!=null && olduser.getPasswordHint()!=null && olduser.getPasswordHint().equals(user.getPasswordHint())){*/
    	if(olduser!=null){
        	user.setPassword(olduser.getPassword());
        	user.setPasswordHint(olduser.getPasswordHint());
        	//user.setLibraryRoleList(olduser.getLibraryRoleList());
        }
        //user.setCreateTime(olduser.getCreateTime());
        user.setUpdateTime(new Date());

        authAppUserDao.save(user);
        return user;
    }

	@Override
	public Boolean checkUniqueIndexForUserName(Long userId,String userName) {
		// TODO Auto-generated method stub
		if(userName==null || "".equals(userName.trim())){
			return true;
		}else{
			return authAppUserDao.checkExistsProperty(userId, userName, AuthAppUserDao.PROP_USERNAME);
		}
	}

	@Override
	public Boolean checkUniqueIndexForEmail(Long userId,String email) {
		// TODO Auto-generated method stub
		if(email==null || "".equals(email.trim())){
			return true;
		}else{
			return authAppUserDao.checkExistsProperty(userId, email, AuthAppUserDao.PROP_EMAIL);
		}
	}


	@Override
	public Boolean checkUniqueIndexForPhoneNumber(Long userId,String phoneNumber) {
		// TODO Auto-generated method stub
		if(phoneNumber==null || "".equals(phoneNumber.trim())){
			return true;
		}else{
			return authAppUserDao.checkExistsProperty(userId, phoneNumber, AuthAppUserDao.PROP_PHONENUMBER);
		}
	}


	@Override
	public void saveAuthUserLibraryRole(AuthAppUser authAppUser,
			List<AuthUserLibraryRole> list) {
		// TODO Auto-generated method stub
		AuthAppUser olduser=this.get(authAppUser.getUserId());
        /*if(olduser!=null && olduser.getPasswordHint()!=null && olduser.getPasswordHint().equals(user.getPasswordHint())){*/
    	if(olduser!=null){
        	
    		olduser.setLibraryRoleList(list);
        }
    	authAppUserDao.save(olduser);
	}
    
}