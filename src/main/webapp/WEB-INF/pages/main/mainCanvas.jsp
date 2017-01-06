<!DOCTYPE html>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>AppBase-MVC-Hibernate</title>
		
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/fullcalendar.css" />	
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/unicorn.main.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/unicorn.grey.css" class="skin-color" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn/css/jquery.gritter.css" />	
		<link rel="stylesheet" href="${ctx}/scripts/3.0/extends.css" />
		
		
		
		<script src="${ctx}/scripts/unicorn/js/excanvas.min.js"></script>
        <script src="${ctx}/scripts/unicorn/js/jquery.min.js"></script>
        <script src="${ctx}/scripts/unicorn/js/jquery.ui.custom.js"></script>
        <script src="${ctx}/scripts/unicorn/js/bootstrap.min.js"></script>
        
        <script src="${ctx}/scripts/unicorn/js/jquery.peity.min.js"></script>
        <script src="${ctx}/scripts/unicorn/js/fullcalendar.min.js"></script>
        <script src="${ctx}/scripts/unicorn/js/unicorn.js"></script>
        
		
		
        
        <script src="${ctx}/scripts/select2-3.5.2/select2.js"></script>
        
        
           
        <script src="${ctx}/scripts/unicorn2.2/js/jquery.validate.js"></script>
        
        <script type="text/javascript" src="<c:url value='/scripts/3.0/script.js'/>"></script>	    
        <script type="text/javascript" src="<c:url value='/scripts/3.0/spin.js'/>"></script>	    
		
	</head>
	<body>
		
		<div id="header">
			<h1><a href="#">bMap</a></h1>			
		</div>
			
		
			<div id="user-nav" class="navbar navbar-inverse" >
	            <ul class="nav btn-group">
	            	<li class="btn btn-inverse" ><a title="" href="#" id="bn_top_a_work_console"><i class="icon icon-user"></i> <span class="text"><fmt:message key="title.WorkConsole"/></span></a></li>
	                <li class="btn btn-inverse" ><a title="" href="#" id="bn_top_a_profile"><i class="icon icon-user"></i> <span class="text"><fmt:message key="title.Profile"/></span></a></li>	                
	                <li class="btn btn-inverse"><a title="" href="#"  id="bn_top_a_settings"><i class="icon icon-cog"></i> <span class="text"><fmt:message key="title.Settings"/></span></a></li>
	                <li class="btn btn-inverse"><a title="" href="#"  id="bn_top_a_super_settings"><i class="fa fa-cogs"></i> <span class="text"><fmt:message key="title.SuperSettings"/></span></a></li>
	                <li class="btn btn-inverse"><a title="" href="${ctx}/logout" id="top_a_logout"><i class="icon icon-share-alt"></i> <span class="text"><fmt:message key="title.Logout"/></span></a></li>
	            </ul>
	        </div>
		<div id="sidebar" class="div_iframe">
		<%@ include file="menu.jsp"%>
		</div>	
		<div id="content">
		    
			<div id="breadcrumb" style="margin-top:-38px;z-index:20;">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a>
					<a href="#" class="current">Dashboard</a>
			</div>
			<div class="container-fluid" >
				<div class="row-fluid">
					<div class="span12 center div_iframe"  id="containerL1">
					<h1>Welcome</h1>
					</div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2012 &copy; Unicorn Admin. Brought to you by <a href="https://wrapbootstrap.com/user/diablo9983">diablo9983</a>
					</div>
				</div>
				
			</div>	
		</div>
	
			
	</body>
	
<script type="text/javascript">
$(document).ready(function() {
	$('#bn_top_a_work_console').click(function(){		
		$(".top-console-menu-select").removeClass("top-console-menu-select");
		$('#bn_top_a_work_console').addClass("top-console-menu-select");
		$('#bn_top_a_work_console i').addClass("top-console-menu-select");
		ajaxLoadHtmlInDiv($("#sidebar"),"${ctx}/lb/default/menuList/work_console/php","get","","",true);
	});
	$('#bn_top_a_profile').click(function(){
		$(".top-console-menu-select").removeClass("top-console-menu-select");
		$('#bn_top_a_profile').addClass("top-console-menu-select");
		$('#bn_top_a_profile i').addClass("top-console-menu-select");
		ajaxLoadHtmlInDiv($("#sidebar"),"${ctx}/lb/default/menuList/profile/php","get","","",true);
	});
	$('#bn_top_a_settings').click(function(){
		$(".top-console-menu-select").removeClass("top-console-menu-select");
		$('#bn_top_a_settings').addClass("top-console-menu-select");
		$('#bn_top_a_settings i').addClass("top-console-menu-select");
		ajaxLoadHtmlInDiv($("#sidebar"),"${ctx}/lb/default/menuList/settings/php","get","","",true);
	});
	$('#bn_top_a_super_settings').click(function(){
		$(".top-console-menu-select").removeClass("top-console-menu-select");
		$('#bn_top_a_super_settings').addClass("top-console-menu-select");
		$('#bn_top_a_super_settings i').addClass("top-console-menu-select");
		ajaxLoadHtmlInDiv($("#sidebar"),"${ctx}/lb/default/menuList/super_settings/php","get","","",true);
	});
	
	
	
});
</script>
		    
  
</html>