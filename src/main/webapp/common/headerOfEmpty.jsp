<!DOCTYPE html>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=9" />
		<meta name="renderer" content="webkit">
		
		
		<title><fmt:message key="webapp.name"/></title>
		<link rel="icon" href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" mce_href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/bootstrap.min.css" />
		<%-- <link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/font-awesome.min.css" /> --%>
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/font-awesome.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/fullcalendar.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/jquery.jscrollpane.css" />	
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/jquery-ui.css" />		
		<link rel="stylesheet" href="${ctx}/scripts/select2-3.5.2/select2.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/unicorn.css" />
		<link rel="stylesheet" href="${ctx}/scripts/3.0/extends.css" />
		<!--[if lt IE 8]>
		    <link href="${ctx}/scripts/unicorn2.2/css/bootstrap-ie7.css" rel="stylesheet">
		<![endif]-->
		
		<%-- <link rel="stylesheet" href="${ctx}/scripts/3.0/style.css" /> --%>
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
		<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		


        <script src="${ctx}/scripts/unicorn2.2/js/jquery.min.js"></script>
        <script src="${ctx}/scripts/unicorn2.2/js/jquery-ui.custom.js"></script>
        <script src="${ctx}/scripts/unicorn2.2/js/bootstrap.min.js"></script>
        <script src="${ctx}/scripts/unicorn2.2/js/bootbox.min.js"></script>
        
        <script src="${ctx}/scripts/unicorn2.2/js/unicorn.js"></script>
        
        <script src="${ctx}/scripts/select2-3.5.2/select2.js"></script>
            
        <script src="${ctx}/scripts/unicorn2.2/js/jquery.validate.js"></script>
    	<script src="${ctx}/scripts/unicorn2.2/js/jquery.hotkeys.js"  type="text/javascript"> </script>
    	
    	
    	<script src="${ctx}/scripts/unicorn2.2/js/jquery.dataTables.min.js"></script>
    	 
    	
    	
<%--     	<script src="${ctx}/scripts/unicorn2.2/js/google-code-prettify/prettify.js"  type="text/javascript"> </script> --%>
<%--     	<script src="${ctx}/scripts/unicorn2.2/js/bootstrap-wysiwyg.js"  type="text/javascript"> </script> --%>
    	
    	<script src="${ctx}/scripts/nicEdit.js"  type="text/javascript"> </script>
    	
        <script type="text/javascript" src="<c:url value='/scripts/3.0/script.js'/>"></script>	    
        <script type="text/javascript" src="<c:url value='/scripts/3.0/spin.js'/>"></script>	    
		
	</head>
	<body data-color="grey" class="flat">
	
	<div id="fullContent"  style="background: none repeat scroll 0px 0px #F2F2F2;">
	<div class="row" style="margin: 10px;">
	
					
					