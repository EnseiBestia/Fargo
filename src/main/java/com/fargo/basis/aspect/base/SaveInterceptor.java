package com.fargo.basis.aspect.base;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.fargo.basis.cache.cfg.CfgFormInfoCache;
import com.fargo.basis.cache.model.ExtendFormInfo;


@Aspect
@Component 
public class SaveInterceptor {
	private static Map<String,ModelInterceptorInterface> doInterceptorMap=new HashMap<String,ModelInterceptorInterface>();
	
	@Pointcut("execution(* com.fargo.basis.service.GenericManagerImpl.save(..)) ||"
			+ "execution(* com.fargo.basis.service.GenericManagerImpl.saveMainBody(..)) ")  
    private void save(){}//定义一个切入点   
	
    @Around("save()")  
    public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable{  
   //     System.out.println("进入环绕通知");  
        Object object = pjp.proceed();//执行该方法  
        try{
	        String serviceFullName=pjp.getTarget().getClass().getName();
	        if(!doInterceptorMap.containsKey(serviceFullName)){
	        	//doInterceptorMap.put(serviceFullName, null);
	        	if(serviceFullName!=null ){
	            	String[] a=serviceFullName.split("\\.");
	            	if(a!=null && a.length>0){
	            		String serviceName=a[a.length-1];
	            		if(serviceName!=null){
	            			serviceName=serviceName.substring(0,serviceName.length()-11);
	            			if(serviceName!=null && serviceName.length()>1){
	            				String formPowerName=serviceName.substring(0,1).toLowerCase()+serviceName.substring(1);
	            				ExtendFormInfo cfi=CfgFormInfoCache.getInstance().getCfgFormInfoByFormCode(formPowerName);
	            				
	            				
	            				if("BBB".equals(cfi.getFormInfo().getValueChangeDoType())){
	            					
	            					ModelInterceptorImpl mii=new ModelInterceptorImpl();
	            					doInterceptorMap.put(serviceFullName, mii);
	            				}else if("BBC".equals(cfi.getFormInfo().getValueChangeDoType())){
	            					//Object iiObj=SpringContext.getApplicationContext().getBean(serviceName+"InterceptorImpl");
	            					String iiiname=serviceFullName.replaceFirst("com.fargo.basis.service", "com.fargo.basis.aspect");
	            					iiiname=iiiname.substring(0,iiiname.length()-11)+"InterceptorImpl";
	            					ModelInterceptorInterface mii = null;
	            					try{
	            						mii = (ModelInterceptorInterface)Class.forName(iiiname).newInstance();;
	            					}catch(Exception e){
	            					}
	            					doInterceptorMap.put(serviceFullName, mii);
	            				}
	            			}
	            			
	            		}
	            	}
	            }
	        }
	        	
        	if(doInterceptorMap.get(serviceFullName)!=null && pjp.getArgs()!=null && pjp.getArgs().length>0){
        		if("save".equals(pjp.getSignature().getName())){
        			if(pjp.getArgs().length>1){
        				if(pjp.getArgs()[1]!=null){
        					Boolean b=Boolean.parseBoolean(pjp.getArgs()[1].toString());
        					if(b){
        						doInterceptorMap.get(serviceFullName).onChange(pjp.getArgs()[0], ModelInterceptorImpl.CHANGE_TYPE_INSERT);
        					}else{
        						doInterceptorMap.get(serviceFullName).onChange(pjp.getArgs()[0], ModelInterceptorImpl.CHANGE_TYPE_UPDATE);
        					}
        				}
        				
        			}else{
        				doInterceptorMap.get(serviceFullName).onChange(pjp.getArgs()[0], ModelInterceptorImpl.CHANGE_TYPE_SAVE);
        			}
        		}else if("saveMainBody".equals(pjp.getSignature().getName())){
        			doInterceptorMap.get(serviceFullName).onChange(pjp.getArgs()[0], ModelInterceptorImpl.CHANGE_TYPE_UPDATE);
        		}
        		
        	}
        
        }catch(Exception e){
        	e.printStackTrace();
        }
  //      System.out.println("退出方法");  
        return object;  
    }  
}
