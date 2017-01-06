package com.fargo.basis.job.base;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Collection;

import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.proxy.dwr.Util;

import com.fargo.basis.Constants;


public class Log {
	private String logPath = null;
	private String logFileName = null;

	private Long taskId;
	public Log(String taskType,Long taskId1) {
		taskId=taskId1;
		
		String sysPath = Constants.BMAP_LOG_FILE_HOME+File.separator; 
		
		System.out.println("sysPath:"+sysPath);
		logPath=sysPath+taskType+ File.separator;
		File dirPath = new File(logPath);

        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
        logFileName=taskId+".log";
		File file=new File(logPath+ logFileName);
		if(!file.exists()){
			try {
				file.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
	
	public void info(String text){
		System.out.println(text);
		write(text);
	}
	public void warn(String text){
		write(text);
	}
	public void error(String text){
		write(text);
	}
	public void debug(String text){
		write(text);
	}
	private void write(String text) {
		//if (this.logPath == null || this.logFileName == null) {
		//	System.out.println(text);
		//} else {
			//System.out.println(text);
		// Collection<ScriptSession> sessions=LogFactory.getInstance().getScriptSession(taskId);
		Collection<ScriptSession> sessions = LogFactory.getInstance().getScriptSession(taskId);
		if(sessions!=null && sessions.size()>0){
			Util util = new Util(sessions);
			ScriptBuffer script = new ScriptBuffer();
			StringBuilder sb = new StringBuilder();
			
			sb.append("sendMsg('").append(text).append("')");
			
			script.appendScript(sb.toString());
			util.addScript(script);
		}
		
		
		//for(ScriptSession one:sessions){
			
		//}
		
		
		writeFile(text);
		//}

	}

	private void writeFile(String text) {
		try {
			//FileWriter writer = new FileWriter(logPath + logFileName, true);
			OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(logPath + logFileName,true),"utf-8");
			BufferedWriter writer=new BufferedWriter(write);   
			writer.write(text+"\r\n");
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	

}
