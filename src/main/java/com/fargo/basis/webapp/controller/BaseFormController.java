package com.fargo.basis.webapp.controller;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.displaytag.tags.TableTagParameters;
import org.displaytag.util.ParamEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.ui.Model;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.tuckey.web.filters.urlrewrite.utils.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fargo.basis.Constants;
import com.fargo.basis.cache.cfg.CfgCustomPropertyCache;
import com.fargo.basis.cache.cfg.CfgEnumInfoCache;
import com.fargo.basis.cache.cfg.CfgFixedPropertyDefineCache;
import com.fargo.basis.cache.cfg.LibraryInfoCache;
import com.fargo.basis.common.model.ServerValidataResult;

/**
 * Implementation of <strong>SimpleFormController</strong> that contains
 * convenience methods for subclasses.  For example, getting the current
 * user and saving messages/errors. This class is intended to
 * be a base class for all Form controllers.
 *
 * <p><a href="BaseFormController.java.html"><i>View Source</i></a></p>
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
public class BaseFormController implements ServletContextAware {
    protected final transient Log log = LogFactory.getLog(getClass());
    public static final String MESSAGES_KEY = "successMessages";
/*    private UserManager userManager = null;
    protected MailEngine mailEngine = null;*/
    protected SimpleMailMessage message = null;
    protected String templateName = "accountCreated.vm";
    protected String cancelView;
    protected String successView;

    private MessageSourceAccessor messages;
    private ServletContext servletContext;

    @Autowired(required = false)
	protected
    Validator validator;

    @Autowired
    public void setMessages(MessageSource messageSource) {
        messages = new MessageSourceAccessor(messageSource);
    }

/*    @Autowired
    public void setUserManager(UserManager userManager) {
        this.userManager = userManager;
    }

    public UserManager getUserManager() {
        return this.userManager;
    }*/

    @SuppressWarnings("unchecked")
    public void saveError(HttpServletRequest request, String error) {
        List errors = (List) request.getSession().getAttribute("errors");
        if (errors == null) {
            errors = new ArrayList();
        }
        errors.add(error);
        request.getSession().setAttribute("errors", errors);
    }
    
    @SuppressWarnings("unchecked")
    public void saveMessage(HttpServletRequest request, String msg) {
        List messages = (List) request.getSession().getAttribute(MESSAGES_KEY);

        if (messages == null) {
            messages = new ArrayList();
        }

        messages.add(msg);
        request.getSession().setAttribute(MESSAGES_KEY, messages);
    }

    /**
     * Convenience method for getting a i18n key's value.  Calling
     * getMessageSourceAccessor() is used because the RequestContext variable
     * is not set in unit tests b/c there's no DispatchServlet Request.
     *
     * @param msgKey
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, Locale locale) {
        return messages.getMessage(msgKey, locale);
    }

    /**
     * Convenient method for getting a i18n key's value with a single
     * string argument.
     *
     * @param msgKey
     * @param arg
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, String arg, Locale locale) {
        return getText(msgKey, new Object[] { arg }, locale);
    }

    /**
     * Convenience method for getting a i18n key's value with arguments.
     *
     * @param msgKey
     * @param args
     * @param locale the current locale
     * @return
     */
    public String getText(String msgKey, Object[] args, Locale locale) {
        return messages.getMessage(msgKey, args, locale);
    }

    /**
     * Convenience method to get the Configuration HashMap
     * from the servlet context.
     *
     * @return the user's populated form from the session
     */
    public Map getConfiguration() {
        Map config = (HashMap) servletContext.getAttribute(Constants.CONFIG);

        // so unit tests don't puke when nothing's been set
        if (config == null) {
            return new HashMap();
        }

        return config;
    }

    /**
     * Set up a custom property editor for converting form inputs to real objects
     * @param request the current request
     * @param binder the data binder
     */
    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) {
        binder.registerCustomEditor(Integer.class, null,
                                    new CustomNumberEditor(Integer.class, null, true));
        binder.registerCustomEditor(Long.class, null,
                                    new CustomNumberEditor(Long.class, null, true));
        binder.registerCustomEditor(byte[].class,
                                    new ByteArrayMultipartFileEditor());
        binder.registerCustomEditor(Date.class, null, 
        		new MultipleDateEditor(getText("date.format", request.getLocale()),getText("dateTime.format", request.getLocale())));
    }

    /**
     * Convenience message to send messages to users, includes app URL as footer.
     * @param user the user to send a message to.
     * @param msg the message to send.
     * @param url the URL of the application.
     */
 /*   protected void sendUserMessage(User user, String msg, String url) {
        if (log.isDebugEnabled()) {
            log.debug("sending e-mail to user [" + user.getEmail() + "]...");
        }

        message.setTo(user.getFullName() + "<" + user.getEmail() + ">");

        Map<String, Serializable> model = new HashMap<String, Serializable>();
        model.put("user", user);

        // TODO: once you figure out how to get the global resource bundle in
        // WebWork, then figure it out here too.  In the meantime, the Username
        // and Password labels are hard-coded into the template. 
        // model.put("bundle", getTexts());
        model.put("message", msg);
        model.put("applicationURL", url);
        mailEngine.sendMessage(message, templateName, model);
    }
*/
/*    @Autowired
    public void setMailEngine(MailEngine mailEngine) {
        this.mailEngine = mailEngine;
    }*/

    @Autowired
    public void setMessage(SimpleMailMessage message) {
        this.message = message;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }
   
    public final BaseFormController setCancelView(String cancelView) {
        this.cancelView = cancelView;
        return this;
    }

    public final String getCancelView() {
        // Default to successView if cancelView is invalid
        if (this.cancelView == null || this.cancelView.length()==0) {
            return getSuccessView();
        }
        return this.cancelView;   
    }

    public final String getSuccessView() {
        return this.successView;
    }
    
    public final BaseFormController setSuccessView(String successView) {
        this.successView = successView;
        return this;
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    protected ServletContext getServletContext() {
        return servletContext;
    }
    
    public int getDisplayTagCurrentPage(HttpServletRequest request,String displayTableId){
    	String strP=request.getParameter((new ParamEncoder(displayTableId).encodeParameterName(TableTagParameters.PARAMETER_PAGE)));
    	
    	int currentPage=0;
    	if(strP==null){
    		currentPage=1;
    	}else{
    		currentPage=Integer.parseInt(strP);
    	}
    	//当前页
    	//System.out.println("currentPage:"+currentPage);
    	return currentPage;
    }
    
    public void libraryAndPropertyPass(HttpServletRequest request,String formName,String libraryPath){
    	request.setAttribute("libraryPath", libraryPath);
    	request.setAttribute("customPropertyList",CfgCustomPropertyCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgCustomPropertyList(formName));
    	request.setAttribute("fixedPropertyList",CfgFixedPropertyDefineCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgFixedPropertyListByFormCode(formName));
    }
    
    public void libraryAndPropertyPass(Model model,String formName){
    	
    	//model.addAttribute("fixedPropertyList",CfgFixedPropertyDefineCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgFixedPropertyListByFormCode(formName));
    	
    	
    	
    	model.addAttribute("allEnumInfoMap",CfgEnumInfoCache.getInstance().getCfgEnumInfoMap());
    	model.addAttribute("allEnumValueInfoMap",CfgEnumInfoCache.getInstance().getCfgAllEnumValueMap());

    }
    public void libraryAndPropertyPass(Model model,String formName,String libraryPath){
    	model.addAttribute("libraryPath", libraryPath);
    	model.addAttribute("libraryId", LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath));
  //  	model.addAttribute("customPropertyList",CfgCustomPropertyCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgCustomPropertyList(formName));
    	
  //  	model.addAttribute("fixedPropertyList",CfgFixedPropertyDefineCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgFixedPropertyListByFormCode(formName));
    	
 //   	model.addAttribute("fixedPropertyEnumMap",CfgFixedPropertyDefineCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getCfgFixedPropertyEnumMap(formName));
//    	model.addAttribute("allFixedPropertyEnumValueInfoMap",CfgFixedPropertyDefineCache.getInstance(LibraryInfoCache.getInstance().getLibraryIdByPath(libraryPath)).getAllFixedPropertyEnumValueInfoMap(formName));
    	
    	model.addAttribute("allEnumInfoMap",CfgEnumInfoCache.getInstance().getCfgEnumInfoMap());
    	model.addAttribute("allEnumValueInfoMap",CfgEnumInfoCache.getInstance().getCfgAllEnumValueMap());

    }
    public void returnJson(JSONObject json,HttpServletResponse response){
    	 try {
			response.getWriter().write(json==null?"{}":json.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void returnJson(String key,String message,HttpServletResponse response){
   	 try {
   		 	JSONObject json=new JSONObject();
   		 	json.put(key, message);
			response.getWriter().write(json==null?"{}":json.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   }
    
    public void returnJson(String message,HttpServletResponse response){
      	 try {
   			response.getWriter().write(StringUtils.isBlank(message)?"":message);
   		} catch (IOException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}
      }
    
   public void validate(Object form,ServerValidataResult svr){
	   
   }
   
   public void returnJSON(JSONObject obj,HttpServletResponse response){
	   response.setContentType("text/html;charset=utf-8");  
	   try {
			response.getWriter().write(obj==null?"{}":obj.toJSONString());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
   }
   public void returnJSON(JSONArray array, HttpServletResponse response) {
		// TODO Auto-generated method stub
	   response.setContentType("text/html;charset=utf-8");  
	   try {
			response.getWriter().write(array==null?"[]":array.toJSONString());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
   class MultipleDateEditor extends PropertyEditorSupport{
		SimpleDateFormat dateFormat ;
		SimpleDateFormat dateTimeFormat ;
		public MultipleDateEditor(String dateFormats,String dateTimeFormats){
			dateFormat = new SimpleDateFormat(dateFormats);
			dateTimeFormat = new SimpleDateFormat(dateTimeFormats);
		}
		public void setAsText(String value) {
			if(value==null||StringUtils.isBlank(value)){
				setValue(null);
				return;
			}
	        try {
	            setValue(dateTimeFormat.parseObject(value));
	        } catch(ParseException e) {
	        	 try {
					setValue(dateFormat.parseObject(value));
				} catch (ParseException e1) {
					setValue(null);
				}
	        }
	    }

	    public String getAsText() {
	    	String rtns= "";
	    	try{
	    		Date td = (Date)getValue();
	    		Calendar calc = new GregorianCalendar();
	    		calc.setTime(td);
	    		if(calc.get(Calendar.HOUR)==0&&calc.get(Calendar.MINUTE)==0&&calc.get(Calendar.SECOND)==0){
	    			rtns = dateFormat.format(td);
	    		}else{
	    			rtns = dateTimeFormat.format(td);
	    		}
	    	}catch(Exception e){
	    		
	    	}
	        return rtns;
	    }       
	}
}
