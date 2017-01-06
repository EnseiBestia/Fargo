package com.fargo.basis.webapp.controller.cfg;

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
import com.fargo.basis.cache.cfg.CfgEnumInfoCache;
import com.fargo.basis.common.model.PaginatedListHelper;
import com.fargo.basis.common.model.SearchConditionValue;
import com.fargo.basis.common.model.ServerValidataResult;
import com.fargo.basis.dao.SearchException;
import com.fargo.basis.model.CfgEnumInfo;
import com.fargo.basis.model.CfgStateMachineDefine;
import com.fargo.basis.model.CfgStateMachineValue;
import com.fargo.basis.service.cfg.CfgStateMachineDefineManager;
import com.fargo.basis.service.cfg.CfgStateMachineValueManager;
import com.fargo.basis.webapp.controller.BaseFormController;
import com.fargo.basis.webapp.util.displaytable.PageTools;

@Controller
//@RequestMapping("/cfgStateMachineValues*")
public class CfgStateMachineValueController extends BaseFormController{
	private static final String DM_FORM_NAME="cfgStateMachineValue";

    private CfgStateMachineValueManager cfgStateMachineValueManager;

    @Autowired
    public void setCfgStateMachineValueManager(CfgStateMachineValueManager cfgStateMachineValueManager) {
        this.cfgStateMachineValueManager = cfgStateMachineValueManager;
    }
    
    private CfgStateMachineDefineManager cfgStateMachineDefineManager;

    @Autowired
    public void setCfgStateMachineDefineManager(CfgStateMachineDefineManager cfgStateMachineDefineManager) {
        this.cfgStateMachineDefineManager = cfgStateMachineDefineManager;
    }
    
    
    public CfgStateMachineValueController() {      
    }  
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/{machineId}/php*")
    public ModelAndView listFirst(@PathVariable String libraryPath,@PathVariable final Long machineId,HttpServletRequest request,final SearchConditionValue searchValue)throws Exception {	
  		return list(libraryPath,machineId,request,searchValue,"mt");
  	} 
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/{machineId}/{listFlag}/php*")
    public ModelAndView list(@PathVariable String libraryPath,@PathVariable final Long machineId,HttpServletRequest request,final SearchConditionValue searchValue,@PathVariable String listFlag)throws Exception {
        Model model = new ExtendedModelMap();
       
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        int currentPage=super.getDisplayTagCurrentPage(request,"cfgStateMachineValueList");
        
    	int pageSize=PageTools.getPageSizeOfUserForm(request,"cfgStateMachineValue");
    	
    	model.addAttribute("searchValue",searchValue);
    	model.addAttribute("listFlag",listFlag);
    	model.addAttribute("machineId", machineId);
        try {       
        	searchValue.getCustomPropertyValue().put("machineId_c", machineId);
        	PaginatedListHelper<CfgStateMachineValue> paginaredList=cfgStateMachineValueManager.find(currentPage,pageSize,searchValue);
        	//model.addAttribute(paginaredList);
        	model.addAttribute("cfgStateMachineValueList",paginaredList.getList());
        	model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", paginaredList.getFullListSize());
        } catch (SearchException se) {
            model.addAttribute("searchError", se.getMessage());
            model.addAttribute(new PaginatedListHelper<CfgStateMachineValue>());
            model.addAttribute("cfgStateMachineValueList",new ArrayList<CfgStateMachineValue>());
            model.addAttribute("pageSize", pageSize);
        	model.addAttribute("totalSize", 0);
        }
        return new ModelAndView("cfg/CfgStateMachineValueList", model.asMap());
    }
 
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/view/{statId}/cfgStateMachineDefine/{machineId}/php*",method = RequestMethod.GET)
    public ModelAndView view(@PathVariable String libraryPath,@PathVariable final Long machineId,@PathVariable Long statId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", false);
    	model.addAttribute("machineId", machineId);
    	if(machineId!=null){
    		CfgStateMachineDefine define=cfgStateMachineDefineManager.get(machineId);
    		CfgEnumInfo cfgEnumInfo=CfgEnumInfoCache.getInstance().getCfgEnumInfoById(define.getEnumId());
    		model.addAttribute("cfgEnumInfo", cfgEnumInfo);
    	}
        if (statId!=null) {
            CfgStateMachineValue cfgStateMachineValue= cfgStateMachineValueManager.get(statId);
            model.addAttribute("cfgStateMachineValue", cfgStateMachineValue);
        }
        return new ModelAndView("cfg/CfgStateMachineValueForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/add/cfgStateMachineDefine/{machineId}/php*",method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String libraryPath,@PathVariable final Long machineId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        CfgStateMachineValue cfgStateMachineValue= new  CfgStateMachineValue();
        model.addAttribute("machineId", machineId);   
  		cfgStateMachineValue.setMachineId(machineId);
  		
  		if(machineId!=null){
    		CfgStateMachineDefine define=cfgStateMachineDefineManager.get(machineId);
    		CfgEnumInfo cfgEnumInfo=CfgEnumInfoCache.getInstance().getCfgEnumInfoById(define.getEnumId());
    		model.addAttribute("cfgEnumInfo", cfgEnumInfo);
    	}
  		
  		
        model.addAttribute("cfgStateMachineValue", cfgStateMachineValue);
        model.addAttribute("formEditFlag", true);
        model.addAttribute("addFlagOfCfgStateMachineValueForm", "1");

        return new ModelAndView("cfg/CfgStateMachineValueForm", model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/edit/{statId}/cfgStateMachineDefine/{machineId}/php*",method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String libraryPath,@PathVariable final Long machineId,@PathVariable Long statId)throws Exception {
    	Model model = new ExtendedModelMap();
    	super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
    	model.addAttribute("formEditFlag", true);   
    	model.addAttribute("machineId", machineId);	
    	
    	if(machineId!=null){
    		CfgStateMachineDefine define=cfgStateMachineDefineManager.get(machineId);
    		CfgEnumInfo cfgEnumInfo=CfgEnumInfoCache.getInstance().getCfgEnumInfoById(define.getEnumId());
    		model.addAttribute("cfgEnumInfo", cfgEnumInfo);
    	}
    	
    	
        if (statId!=null) {
            CfgStateMachineValue cfgStateMachineValue= cfgStateMachineValueManager.get(statId);
            model.addAttribute("cfgStateMachineValue", cfgStateMachineValue);
            
        }
        return new ModelAndView("cfg/CfgStateMachineValueForm", model.asMap());
    }
    
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/formSubmit/cfgStateMachineDefine/{machineId}/php*",method = RequestMethod.POST)

    public ModelAndView onSubmit(@PathVariable String libraryPath,@PathVariable final Long machineId,CfgStateMachineValue cfgStateMachineValue,  HttpServletRequest request,
                           HttpServletResponse response)throws Exception {  
        Model model = new ExtendedModelMap(); 
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        model.addAttribute("formEditFlag", true);
        model.addAttribute("addFlagOfCfgStateMachineValueForm", request.getParameter("addFlagOfCfgStateMachineValueForm"));
        model.addAttribute("machineId", machineId);
        
        if (validator != null) { // validator is null during testing     
        	ServerValidataResult svr=new ServerValidataResult();      	
        	validate(cfgStateMachineValue, svr);      	
            
            if (svr.hasErrors()) { // don't validate when deleting
            	saveError(request,svr.getAllErrorMessage());
        		return new ModelAndView("cfg/CfgStateMachineValueForm", model.asMap());
            }
        }

        log.debug("entering 'onSubmit' method...");

        boolean isNew = ("1".equals(request.getParameter("addFlagOfCfgStateMachineValueForm")));
        
  		String success = "redirect:/lb/{libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/"+machineId+"/mt/php";
  		
        
        Locale locale = request.getLocale();

        if(isNew){
        	cfgStateMachineValueManager.save(cfgStateMachineValue);
        }else{
        	cfgStateMachineValueManager.saveMainBody(cfgStateMachineValue);
        }
        
        
        
        String key = (isNew) ? "cfgStateMachineValue.added" : "cfgStateMachineValue.updated";
        saveMessage(request, getText(key, locale));

        if (!isNew) {   	
        	        
	  		success = "redirect:/lb/{libraryPath}/cfgStateMachineValue/view/"+cfgStateMachineValue.getStatId()+"/cfgStateMachineDefine/"+machineId+"/php";
            
        }
    

        return new ModelAndView(success, model.asMap());
    }
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/delete/{statIdList}/cfgStateMachineDefine/{machineId}/php*",method = RequestMethod.POST)
    public ModelAndView delete(@PathVariable String libraryPath,@PathVariable final Long machineId,HttpServletRequest request,
            HttpServletResponse response,@PathVariable String statIdList)throws Exception {
        Model model = new ExtendedModelMap(); 
        super.libraryAndPropertyPass(model, DM_FORM_NAME, libraryPath);
        model.addAttribute("machineId", machineId);
    	Locale locale = request.getLocale();
    	if(statIdList!=null){
    		String[] a=statIdList.split("-");
    		if(a!=null){
    			for(String one:a){
    				cfgStateMachineValueManager.remove(new Long(one));
    			}
    		}
    	}
        saveMessage(request, getText("cfgStateMachineValue.deleted", locale));
        
  		String success = "redirect:/lb/{libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/"+machineId+"/mt/php?pageGroupType=back";
        return new ModelAndView(success, model.asMap());
    }    
    
    @RequestMapping(value = "/lb/{libraryPath}/cfgStateMachineValue/list/select/cfgStateMachineDefine/{machineId}/php*")
    public void getSelect2Json(@PathVariable String libraryPath,@PathVariable final Long machineId,HttpServletResponse response)throws Exception {	
    	List<CfgStateMachineValue> list=cfgStateMachineValueManager.getAll();
    	JSONArray array=new JSONArray();
    	for(int i=0;list!=null && i<list.size();i++){
    		    JSONObject obj=new JSONObject();
    			obj.put("id", list.get(i).getStatId());
    			obj.put("text", list.get(i).getStatName());
    			array.add(obj);
    	}
    	returnJSON(array,response);
  	} 
	
}
