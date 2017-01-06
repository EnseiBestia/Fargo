<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springmodules.org/tags/commons-validator" prefix="v" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://struts-menu.sf.net/tag-el" prefix="menu" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://www.appfuse.org/tags/spring" prefix="appfuse" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="datePattern"><fmt:message key="date.format"/></c:set>
<c:set var="libraryPath" value="${libraryPath}"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Reverse Alert</title>
<script type='text/javascript' src='${ctx}/dwr/interface/ReverseAlert.js'></script>
<script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
<script type="text/javascript" src="${ctx}/dwr/util.js"></script>

<script src="${ctx}/scripts/unicorn/js/jquery.min.js"></script>
<script src="${ctx}/scripts/unicorn/js/jquery.ui.custom.js"></script>
        
        
<script type="text/javascript">
	
	$(document).ready(function(){
    	dwr.engine.setActiveReverseAjax(true);// 开启逆向Ajax，也可写在body标签的onload方法中
    	dwr.engine.setNotifyServerOnPageUnload(true,true);
    	onPageLoadDwr();
    }); 
	function onPageLoadDwr(){
		//var msg = document.getElementById("msgId").value;
		//var username = document.getElementById("username").value;
		
		//alert(111);
		var taskLogId=${stTaskInfo.taskId};
		
		//alert("taskLogId:"+taskLogId);
		
		ReverseAlert.getLogForTask(taskLogId,function(data){
			//alert(data);
			//sendMsg(data);
		});
		//document.getElementById("msgId").value = "";
	}

	function sendMsg(msg){
		var msgList = document.getElementById("msgList");
		var div = document.createElement("div");
		div.innerHTML = msg;
		msgList.appendChild(div);
		
		window.scrollTo(0,document.body.scrollHeight);
		
	}
	function getUrlParam(name){
	
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		
		if (r!=null) return unescape(r[2]); return null; //返回参数值
		
	} 
</script>
</head>
<body>
	<div id="msgList">
		
	</div>
	<br/><br/>
	

</body>
</html>