package com.fargo.basis.webapp.controller.auth;

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
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fargo.basis.cache.cfg.LibraryInfoCache;
import com.fargo.basis.common.model.PaginatedListHelper;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.common.model.ServerValidataResult;
import com.fargo.basis.dao.SearchException;
import com.fargo.basis.model.AuthAppRole;
import com.fargo.basis.service.auth.AuthAppRoleManager;
import com.fargo.basis.util.codec.UUIDUtil;
import com.fargo.basis.webapp.controller.BaseFormController;
import com.fargo.basis.webapp.util.displaytable.PageTools;
@Controller
public class AuthAppRoleController extends BaseFormController{
	private static final String DM_FORM_NAME="authAppRole";

    private AuthAppRoleManager authAppRoleManager;

    @Autowired
    public void setAuthAppRoleManager(AuthAppRoleManager authAppRoleManager) {
        this.authAppRoleManager = authAppRoleManager;
    }
    public AuthAppRoleController() {      
    }  
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/list/php*")
    public ModelAndView listFirst(@PathVariable String libraryPath,HttpServletRequest request,final SearchConditionValue searchValue)throws Exception {	
  		return list(libraryPath,request,searchValue,"mt");
  	} 
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/list/{listFlag}/php*")
    public ModelAndView list(@PathVariable String libraryPath,HttpServletRequest request,final SearchConditionValue searchValue,@PathVariable String listFlag)throws Exception {
        Model model = new ExtendedModelMap();
       
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        int currentPage=super.getDisplayTagCurrentPage(request,"authAppRoleList");
        
    	int pageSize=PageTools.getPageSizeOfUserForm(request,"authAppRole");
    	
    	model.addAttribute("searchValue",searchValue);
    	model.addAttribute("listFlag",listFlag);
    	
        try {       
        	PaginatedListHelper<AuthAppRole> paginaredList=authAppRoleManager.find(currentPage,pageSize,searchValue);
        	model.addAttribute(paginaredList);
        	model.addAttribute("authAppRoleList",paginaredList.getList());
        	model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", paginaredList.getFullListSize());
        } catch (SearchException se) {
            model.addAttribute("searchError", se.getMessage());
            model.addAttribute(new PaginatedListHelper<AuthAppRole>());
            model.addAttribute("authAppRoleList",new ArrayList<AuthAppRole>());
            model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", 0);
        }
        return new ModelAndView("st/AuthAppRoleList", model.asMap());
    }
 
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/view/{roleId}/php*",method = RequestMethod.GET)
    public ModelAndView view(@PathVariable String libraryPath,@PathVariable Long roleId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", false);
    	
        if (roleId!=null) {
            AuthAppRole authAppRole= authAppRoleManager.get(roleId);
            model.addAttribute("authAppRole", authAppRole);
        }
        return new ModelAndView("st/AuthAppRoleForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/add/php*",method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String libraryPath)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        AuthAppRole authAppRole= new  AuthAppRole();
        authAppRole.setLibrary(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath));
        authAppRole.setOvert(false);
  		
        model.addAttribute("authAppRole", authAppRole);
        model.addAttribute("formEditFlag", true);
        model.addAttribute("addFlagOfAuthAppRoleForm", "1");

        return new ModelAndView("st/AuthAppRoleForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/edit/{roleId}/php*",method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String libraryPath,@PathVariable Long roleId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    		
        if (roleId!=null) {
            AuthAppRole authAppRole= authAppRoleManager.get(roleId);
            model.addAttribute("authAppRole", authAppRole);
            
        }
        return new ModelAndView("st/AuthAppRoleForm", model.asMap());
    }
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/edit/privilege/{roleId}/php*",method = RequestMethod.GET)
    public ModelAndView editPrivilege(@PathVariable String libraryPath,@PathVariable Long roleId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    		
        if (roleId!=null) {
            AuthAppRole authAppRole= authAppRoleManager.get(roleId);
            model.addAttribute("authAppRole", authAppRole);
            
        }
        return new ModelAndView("st/AuthAppRoleAndPrivilegeForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/edit/privilege/{roleId}/submit/php*",method = RequestMethod.POST)
    public ModelAndView editPrivilegeSubmit(@PathVariable String libraryPath,@PathVariable Long roleId, HttpServletRequest request,
            HttpServletResponse response)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    		
        if (roleId!=null) {
            AuthAppRole authAppRole= authAppRoleManager.get(roleId);
            
            
            String[] selectPrivilegeList=request.getParameterValues("selectPrivilegeList");
            List<Long> idlist=new ArrayList<Long>();
            for(int i=0;selectPrivilegeList!=null && i<selectPrivilegeList.length;i++){
            	idlist.add(new Long(selectPrivilegeList[i]));
            }
            authAppRole.setPrivilegeList(idlist);
            authAppRoleManager.save(authAppRole);
            
            model.addAttribute("authAppRole", authAppRole);
            
            saveMessage(request, "为角色分配权限成功！");
            System.out.println(selectPrivilegeList);
        }
        return new ModelAndView("redirect:/lb/{libraryPath}/authAppRole/list/mt/php", model.asMap());
    }
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/formSubmit/php*",method = RequestMethod.POST)

    public ModelAndView onSubmit(@PathVariable String libraryPath,AuthAppRole authAppRole,  HttpServletRequest request,
                           HttpServletResponse response)throws Exception {  
        Model model = new ExtendedModelMap(); 
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        model.addAttribute("formEditFlag", true);
        model.addAttribute("addFlagOfAuthAppRoleForm", request.getParameter("addFlagOfAuthAppRoleForm"));
        
        
        if (validator != null) { // validator is null during testing     
        	ServerValidataResult svr=new ServerValidataResult();      	
        	validate(authAppRole, svr);      	
            
            if (svr.hasErrors()) { // don't validate when deleting
            	saveError(request,svr.getAllErrorMessage());
        		return new ModelAndView("st/AuthAppRoleForm", model.asMap());
            }
        }

        log.debug("entering 'onSubmit' method...");

        boolean isNew = ("1".equals(request.getParameter("addFlagOfAuthAppRoleForm")));
        
  		String success = "redirect:/lb/{libraryPath}/authAppRole/list/mt/php";
  		
        
        Locale locale = request.getLocale();

        if(isNew){
        	authAppRoleManager.save(authAppRole);
        }else{
        	authAppRoleManager.saveMainBody(authAppRole);
        }
        
        String key = (isNew) ? "authAppRole.added" : "authAppRole.updated";
        saveMessage(request, getText(key, locale));

        if (!isNew) {   	
        	        
	  		success = "redirect:/lb/{libraryPath}/authAppRole/view/"+authAppRole.getRoleId()+"/php" ;
            
        }
    

        return new ModelAndView(success, model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/delete/{roleIdList}/php*",method = RequestMethod.POST)
    public ModelAndView delete(@PathVariable String libraryPath,HttpServletRequest request,
            HttpServletResponse response,@PathVariable String roleIdList)throws Exception {
        Model model = new ExtendedModelMap(); 
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        
    	Locale locale = request.getLocale();
    	if(roleIdList!=null){
    		String[] a=roleIdList.split("-");
    		if(a!=null){
    			for(String one:a){
    				authAppRoleManager.remove(new Long(one));
    			}
    		}
    	}
        saveMessage(request, getText("authAppRole.deleted", locale));
        
        String success = "redirect:/lb/{libraryPath}/authAppRole/list/mt/php?pageGroupType=back";
        return new ModelAndView(success, model.asMap());
    }    
    
    @RequestMapping(value = "/lb/{libraryPath}/authAppRole/list/select/php*")
    public void getSelect2Json(@PathVariable String libraryPath,HttpServletResponse response)throws Exception {	
    	List<AuthAppRole> list=authAppRoleManager.getAll();
    	JSONArray array=new JSONArray();
    	for(int i=0;list!=null && i<list.size();i++){
    		    JSONObject obj=new JSONObject();
    			obj.put("id", list.get(i).getRoleId());
    			obj.put("text", list.get(i).getRoleName());
    			array.add(obj);
    	}
    	returnJSON(array,response);
  	} 

	
}
