package com.fargo.basis.job.base;


import java.util.Collection;
import java.util.Hashtable;
import java.util.Map;

import org.directwebremoting.Container;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.WebContext;
import org.directwebremoting.extend.ScriptSessionManager;



public class LogFactory {
	
	static LogFactory instance=null;
	
	public static LogFactory getInstance(){
		if(instance==null){
			instance=new LogFactory();
		}
		return instance;
	}
	
	//private Collection<ScriptSession> scriptSessionsForGloble=null;
	
	
	private Map<Long,String> taskScriptPageMap=new Hashtable<Long,String>();
	
	
	synchronized public void appendScriptSession(WebContext context,Long taskId){
		
		taskScriptPageMap.put(taskId, context.getScriptSession().getPage());
		
		Collection<ScriptSession>  scriptSessionsForGloble = context.getScriptSessionsByPage(context.getCurrentPage());
		System.out.println("=================scriptSessionsForGloble=======================");
		for(ScriptSession one:scriptSessionsForGloble){
			
			System.out.println("	id:"+one.getId());
		}
		
	}
	
	synchronized public Collection<ScriptSession> getScriptSession(Long taskId){
		//List<ScriptSession> actionList=new ArrayList<ScriptSession>();
		
		if(ServerContextFactory.get()!=null){
			Container container=ServerContextFactory.get().getContainer();
			ScriptSessionManager manager=container.getBean(ScriptSessionManager.class);
			if(taskScriptPageMap.containsKey(taskId)){
				Collection<ScriptSession> allSessions= manager.getScriptSessionsByPage(taskScriptPageMap.get(taskId));
				return allSessions;
			}
			
			
			
		}
		return null;
		/*List<ScriptSession> actionList=new ArrayList<ScriptSession>();
		if(taskScriptSessionIdMap.containsKey(taskId) && scriptSessionsForGloble!=null){
			List<String> sessionList=taskScriptSessionIdMap.get(taskId);
			if(sessionList!=null && sessionList.size()>0){
				for(ScriptSession session:scriptSessionsForGloble){
					for(String sid:sessionList){
						
						if(session.getId()!=null && session.getId().equals(sid)){
							actionList.add(session);
						}
					}
				}
			}
			
				
			
		}
		return actionList;*/
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
