package com.fargo.basis.webapp.controller.auth;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fargo.basis.cache.cfg.LibraryInfoCache;
import com.fargo.basis.common.model.PaginatedListHelper;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.common.model.ServerValidataResult;
import com.fargo.basis.dao.SearchException;
import com.fargo.basis.model.AuthAppUser;
import com.fargo.basis.service.auth.AuthAppUserManager;
import com.fargo.basis.webapp.controller.BaseFormController;
import com.fargo.basis.webapp.util.displaytable.PageTools;
@Controller
//@RequestMapping("/authAppUsers*")
public class AuthAppUserController extends BaseFormController{
	private static final String DM_FORM_NAME="authAppUser";

    private AuthAppUserManager authAppUserManager;

    @Autowired
    public void setAuthAppUserManager(AuthAppUserManager authAppUserManager) {
        this.authAppUserManager = authAppUserManager;
    }
    public AuthAppUserController() {      
    }  
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/list/php*")
    public ModelAndView listFirst(@PathVariable String libraryPath,HttpServletRequest request,final SearchConditionValue searchValue)throws Exception {	
  		return list(libraryPath,request,searchValue,"mt");
  	} 
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/list/{listFlag}/php*")
    public ModelAndView list(@PathVariable String libraryPath,HttpServletRequest request,final SearchConditionValue searchValue,@PathVariable String listFlag)throws Exception {
        Model model = new ExtendedModelMap();
       
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        int currentPage=super.getDisplayTagCurrentPage(request,"authAppUserList");
        
    	int pageSize=PageTools.getPageSizeOfUserForm(request,"authAppUser");
    	
    	model.addAttribute("searchValue",searchValue);
    	model.addAttribute("listFlag",listFlag);
    	
        try {       
        	PaginatedListHelper<AuthAppUser> paginaredList=authAppUserManager.find(currentPage,pageSize,searchValue);

        	model.addAttribute(paginaredList);
        	model.addAttribute("authAppUserList",paginaredList.getList());
        	model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", paginaredList.getFullListSize());
        } catch (SearchException se) {
            model.addAttribute("searchError", se.getMessage());
            model.addAttribute(new PaginatedListHelper<AuthAppUser>());
            model.addAttribute("authAppUserList",new ArrayList<AuthAppUser>());
            model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", 0);
        }
        return new ModelAndView("st/AuthAppUserList", model.asMap());
    }
 
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/view/{userId}/php*",method = RequestMethod.GET)
    public ModelAndView view(@PathVariable String libraryPath,@PathVariable Long userId,HttpServletRequest request)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", false);
    	
        if (userId!=null) {
            AuthAppUser authAppUser= authAppUserManager.get(userId);
            model.addAttribute("authAppUser", authAppUser);
        }
        return new ModelAndView("st/AuthAppUserForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/add/php*",method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String libraryPath)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        AuthAppUser authAppUser= new  AuthAppUser();
        authAppUser.setLibrary(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath));
        authAppUser.setOvert(false);   
  		
        model.addAttribute("authAppUser", authAppUser);
        model.addAttribute("formEditFlag", true);
        model.addAttribute("addFlagOfAuthAppUserForm", "1");

        return new ModelAndView("st/AuthAppUserForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/edit/{userId}/php*",method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String libraryPath,@PathVariable Long userId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    		
        if (userId!=null) {
            AuthAppUser authAppUser= authAppUserManager.get(userId);
            model.addAttribute("authAppUser", authAppUser);
            
        }
        return new ModelAndView("st/AuthAppUserForm", model.asMap());
    }
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/formSubmit/php*",method = RequestMethod.POST)

    public ModelAndView onSubmit(@PathVariable String libraryPath,AuthAppUser authAppUser,  HttpServletRequest request,
                           HttpServletResponse response)throws Exception {  
    	Model model = new ExtendedModelMap(); 
    	String success = "redirect:/lb/{libraryPath}/authAppUser/list/mt/php";
    	try{
	        
	        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
	        model.addAttribute("formEditFlag", true);
	        model.addAttribute("addFlagOfAuthAppUserForm", request.getParameter("addFlagOfAuthAppUserForm"));
	        
	        
	        if (validator != null) { // validator is null during testing     
	        	ServerValidataResult svr=new ServerValidataResult();      	
	        	validate(authAppUser, svr);      	
	            
	            if (svr.hasErrors()) { // don't validate when deleting
	            	saveError(request,svr.getAllErrorMessage());
	        		return new ModelAndView("st/AuthAppUserForm", model.asMap());
	            }
	        }
	
	        log.debug("entering 'onSubmit' method...");
	
	        boolean isNew = ("1".equals(request.getParameter("addFlagOfAuthAppUserForm")));
	        
	  		
	  		
	        
	        Locale locale = request.getLocale();
	
	        if(authAppUser.getUserName()==null || authAppUser.getUserName().equals("")){
	        	authAppUser.setUserName(null);
	        }
	        if(isNew){
	        	authAppUserManager.save(authAppUser,isNew);
	        }else{
	        	authAppUserManager.save(authAppUser);
	        }
	        
	        
	        
	        String key = (isNew) ? "authAppUser.added" : "authAppUser.updated";
	        saveMessage(request, getText(key, locale));
	
	        if (!isNew) {   	
	        	        
		  		success = "redirect:/lb/{libraryPath}/authAppUser/view/"+authAppUser.getUserId()+"/php" ;
	            
	        }
	        
    	}catch(Exception e){
    		e.printStackTrace();
    		
    		saveMessage(request, "添加用户失败，"+e.getMessage());
    		
    	}
    	return new ModelAndView(success, model.asMap());
        
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/delete/{userIdList}/php*",method = RequestMethod.POST)
    public ModelAndView delete(@PathVariable String libraryPath,HttpServletRequest request,
            HttpServletResponse response,@PathVariable String userIdList)throws Exception {
        Model model = new ExtendedModelMap(); 
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        
    	Locale locale = request.getLocale();
    	if(userIdList!=null){
    		String[] a=userIdList.split("-");
    		if(a!=null){
    			for(String one:a){
    				authAppUserManager.remove(new Long(one));
    			}
    		}
    	}
        saveMessage(request, getText("authAppUser.deleted", locale));
        
        String success = "redirect:/lb/{libraryPath}/authAppUser/list/mt/php?pageGroupType=back";
        return new ModelAndView(success, model.asMap());
    }    
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/list/select/php*")
    public void getSelect2Json(@PathVariable String libraryPath,HttpServletResponse response)throws Exception {	
    	List<AuthAppUser> list=authAppUserManager.getAll();
    	JSONArray array=new JSONArray();
    	for(int i=0;list!=null && i<list.size();i++){
    		    JSONObject obj=new JSONObject();
    			obj.put("id", list.get(i).getUserId());
    			obj.put("text", list.get(i).getFullName());
    			array.add(obj);
    	}
    	returnJSON(array,response);
  	} 
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/view/idx_user_username/validate/php*",method = RequestMethod.POST)
    public void validateIndex1(@PathVariable String libraryPath,@RequestParam("userName") String userName,@RequestParam("userId") Long userId,HttpServletResponse response)throws Exception {
    	Boolean resultb=authAppUserManager.checkUniqueIndexForUserName(userId,userName);   
    	response.setContentType("text/json;charset=utf-8");  
 	   	try {
 			response.getWriter().write(resultb.toString());
 		} catch (IOException e1) {
 			// TODO Auto-generated catch block
 			e1.printStackTrace();
 		}
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/view/idx_user_email/validate/php*",method = RequestMethod.POST)
    public void validateIndex2(@PathVariable String libraryPath,@RequestParam("email") String email,@RequestParam("userId") Long userId,HttpServletResponse response)throws Exception {
    	Boolean resultb=authAppUserManager.checkUniqueIndexForEmail(userId,email);   
    	response.setContentType("text/json;charset=utf-8");  
 	   	try {
 			response.getWriter().write(resultb.toString());
 		} catch (IOException e1) {
 			// TODO Auto-generated catch block
 			e1.printStackTrace();
 		}
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/view/idx_user_phonenumber/validate/php*",method = RequestMethod.POST)
    public void validateIndex3(@PathVariable String libraryPath,@RequestParam("phoneNumber") String phoneNumber,@RequestParam("userId") Long userId,HttpServletResponse response)throws Exception {
    	Boolean resultb=authAppUserManager.checkUniqueIndexForPhoneNumber(userId,phoneNumber);   
    	response.setContentType("text/json;charset=utf-8");  
 	   	try {
 			response.getWriter().write(resultb.toString());
 		} catch (IOException e1) {
 			// TODO Auto-generated catch block
 			e1.printStackTrace();
 		}
    }
    
    ///////////////////////////////////////////////////////////////////////
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/edit/resetPassword/{userId}/php*",method = RequestMethod.GET)
    public ModelAndView changePassword(@PathVariable String libraryPath,@PathVariable Long userId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    	
    	AuthAppUser user =authAppUserManager.get(userId);
    	
    	user.setPassword("");
    	
        model.addAttribute("authAppUser", user);
            
        
        return new ModelAndView("st/AuthAppUserFormChangePasswordForAdmin", model.asMap());
    }
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppUser/edit/resetPassword/formSubmit/php*",method = RequestMethod.POST)
    public ModelAndView onSubmitChangePassword(@PathVariable String libraryPath,AuthAppUser authAppUser,  HttpServletRequest request,
                           HttpServletResponse response)throws Exception {  
    	Model model = new ExtendedModelMap(); 
    	String success = "redirect:/lb/{libraryPath}/authAppUser/list/mt/php?pageGroupType=back";
    	try{
	        
	        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
	        
	        AuthAppUser olduser=authAppUserManager.get(authAppUser.getUserId());
	        
	        olduser.setPassword(authAppUser.getPassword());
	        olduser.setPasswordHint(authAppUser.getPassword());
	            
		    authAppUserManager.saveForChangePassword(olduser);

		    saveMessage(request,"修改密码成功！");
	        
	        
	        
    	}catch(Exception e){
    		e.printStackTrace();
    		
    		saveMessage(request, "修改用户密码失败，"+e.getMessage());
    		
    	}
    	return new ModelAndView(success, model.asMap());
        
    }
}
