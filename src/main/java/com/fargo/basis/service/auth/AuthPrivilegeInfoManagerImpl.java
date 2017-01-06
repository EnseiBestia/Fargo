package com.fargo.basis.service.auth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fargo.basis.dao.auth.AuthPrivilegeInfoDao;
import com.fargo.basis.model.AuthPrivilegeInfo;
import com.fargo.basis.service.GenericManagerImpl;



@Service("authPrivilegeInfoManager")
public class AuthPrivilegeInfoManagerImpl extends GenericManagerImpl<AuthPrivilegeInfo, Long> implements AuthPrivilegeInfoManager {
    AuthPrivilegeInfoDao authPrivilegeInfoDao;

    @Autowired
    public AuthPrivilegeInfoManagerImpl(AuthPrivilegeInfoDao authPrivilegeInfoDao) {
        super(authPrivilegeInfoDao);
        this.authPrivilegeInfoDao = authPrivilegeInfoDao;
    }
    @Override
	public void saveMainBody(AuthPrivilegeInfo authPrivilegeInfo) {
		// TODO Auto-generated method stub
		this.authPrivilegeInfoDao.saveMainBody(authPrivilegeInfo);
	}
	@Override
	public void rebuildChildPivilege(AuthPrivilegeInfo authPrivilegeInfo) {
		// TODO Auto-generated method stub
		if(authPrivilegeInfo.getForm()!=null){
        	authPrivilegeInfo.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/list/php");
        	
        	{
        		AuthPrivilegeInfo ap1=new AuthPrivilegeInfo();
        		ap1.setForm(authPrivilegeInfo.getForm());
        		ap1.setFormId(authPrivilegeInfo.getForm().getFormId());
        		ap1.setOperateName("AZA");
        		ap1.setParent(authPrivilegeInfo.getPrivilegeId());
        		ap1.setPrivilegeType("AWC");
        		ap1.setIconCode("fa fa-leaf");
        		ap1.setPrivilegeName(authPrivilegeInfo.getForm().getFormName()+"列表");
        		ap1.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/list");
        		authPrivilegeInfoDao.save(ap1);
        	}
        	{
        		AuthPrivilegeInfo ap1=new AuthPrivilegeInfo();
        		ap1.setForm(authPrivilegeInfo.getForm());
        		ap1.setFormId(authPrivilegeInfo.getForm().getFormId());
        		ap1.setOperateName("AZB");
        		ap1.setParent(authPrivilegeInfo.getPrivilegeId());
        		ap1.setPrivilegeType("AWC");
        		ap1.setIconCode("fa fa-leaf");
        		ap1.setPrivilegeName(authPrivilegeInfo.getForm().getFormName()+"添加");
        		ap1.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/add");
        		authPrivilegeInfoDao.save(ap1);
        	}
        	{
        		AuthPrivilegeInfo ap1=new AuthPrivilegeInfo();
        		ap1.setForm(authPrivilegeInfo.getForm());
        		ap1.setFormId(authPrivilegeInfo.getForm().getFormId());
        		ap1.setOperateName("AZC");
        		ap1.setParent(authPrivilegeInfo.getPrivilegeId());
        		ap1.setPrivilegeType("AWC");
        		ap1.setIconCode("fa fa-leaf");
        		ap1.setPrivilegeName(authPrivilegeInfo.getForm().getFormName()+"修改");
        		ap1.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/edit");
        		authPrivilegeInfoDao.save(ap1);
        	}
        	{
        		AuthPrivilegeInfo ap1=new AuthPrivilegeInfo();
        		ap1.setForm(authPrivilegeInfo.getForm());
        		ap1.setFormId(authPrivilegeInfo.getForm().getFormId());
        		ap1.setOperateName("AZD");
        		ap1.setParent(authPrivilegeInfo.getPrivilegeId());
        		ap1.setPrivilegeType("AWC");
        		ap1.setIconCode("fa fa-leaf");
        		ap1.setPrivilegeName(authPrivilegeInfo.getForm().getFormName()+"删除");
        		ap1.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/delete");
        		authPrivilegeInfoDao.save(ap1);
        	}
        	{
        		AuthPrivilegeInfo ap1=new AuthPrivilegeInfo();
        		ap1.setForm(authPrivilegeInfo.getForm());
        		ap1.setFormId(authPrivilegeInfo.getForm().getFormId());
        		ap1.setOperateName("AZE");
        		ap1.setParent(authPrivilegeInfo.getPrivilegeId());
        		ap1.setPrivilegeType("AWC");
        		ap1.setIconCode("fa fa-leaf");
        		ap1.setPrivilegeName(authPrivilegeInfo.getForm().getFormName()+"查看");
        		ap1.setUrl("/"+authPrivilegeInfo.getForm().getFormCode()+"/view");
        		authPrivilegeInfoDao.save(ap1);
        	}
        }
	}
	@Override
	public void saveMove(Long parentId, Long privilegeId, Integer moveType) {
		AuthPrivilegeInfo authPrivilegeInfo=this.get(privilegeId);
		// TODO Auto-generated method stub
		if(moveType==0 && authPrivilegeInfo!=null){//up
        	//@Cre 2016-05-09
			AuthPrivilegeInfo privious = authPrivilegeInfoDao.getPreOrPostPrivilege(parentId,moveType,authPrivilegeInfo);
			if(privious!=null){
				double sortNo1=authPrivilegeInfo.getSortNo();
				double sortNo2=privious.getSortNo();
				if(sortNo2<sortNo1){
					authPrivilegeInfo.setSortNo(sortNo2);
					privious.setSortNo(sortNo1);
					
					this.save(authPrivilegeInfo);
					this.save(privious);
				}else if(sortNo2==sortNo1){
					authPrivilegeInfo.setSortNo(sortNo1-1);
					//privious.setSortNo(sortNo1);
					
					this.save(authPrivilegeInfo);
					this.save(privious);
				}
				
				
			}else{
				double sortNo1=authPrivilegeInfo.getSortNo();
				authPrivilegeInfo.setSortNo(sortNo1-1);
				this.save(authPrivilegeInfo);
			}
        }else if(moveType==1  && authPrivilegeInfo!=null){//down
        	//@Cre 2016-05-09
			AuthPrivilegeInfo privious=authPrivilegeInfoDao.getPreOrPostPrivilege(parentId,moveType,authPrivilegeInfo);
			if(privious!=null){
				double sortNo1=authPrivilegeInfo.getSortNo();
				double sortNo2=privious.getSortNo();
				if(sortNo2>sortNo1){
					authPrivilegeInfo.setSortNo(sortNo2);
					privious.setSortNo(sortNo1);
					
					this.save(authPrivilegeInfo);
					this.save(privious);
				}else if(sortNo2==sortNo1){
					authPrivilegeInfo.setSortNo(sortNo1+1);
					//privious.setSortNo(sortNo1);
					
					this.save(authPrivilegeInfo);
					this.save(privious);
				}
			}else{
				double sortNo1=authPrivilegeInfo.getSortNo();
				authPrivilegeInfo.setSortNo(sortNo1+1);
				this.save(authPrivilegeInfo);
			}
        }
	}
}