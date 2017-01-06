<%@ include file="/common/taglibs.jsp" %>

<head>
        <title><fmt:message key="signup.title"/></title>
    <meta name="menu" content="Login"/>
    
    <link rel="icon" href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" mce_href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" type="image/x-icon">
    <title><fmt:message key="webapp.name"/></title>

 <link rel="stylesheet" href="${ctx}/scripts/sin/main.css">
 <link rel="stylesheet" href="${ctx}/scripts/sin/reg.css">
 
 <link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/bootstrap.min.css" />
 
 		
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/font-awesome.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/fullcalendar.css" />
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/jquery.jscrollpane.css" />	
		<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/jquery-ui.css" />		
		
		
  		<script src="${ctx}/scripts/unicorn2.2/js/jquery.min.js"></script>
        <script src="${ctx}/scripts/unicorn2.2/js/jquery-ui.custom.js"></script>
        
            
        <script src="${ctx}/scripts/unicorn2.2/js/jquery.validate.js"></script>  
        <script type="text/javascript" src="<c:url value='/scripts/3.0/script.js'/>"></script>	
        <script type="text/javascript" src="<c:url value='/scripts/3.0/spin.js'/>"></script>	  		
</head>
<body>

<div class="reg-top">
    <div class="reg-top-main">
        <div class="pull-left">
            <img src="${ctx}/scripts/unicorn2.2/img/BMAP-LOGO.png" class="mt-15">
            <span class="v-separator"></span>
            <span class="reg-header-text"><fmt:message key="signup.title"/></span>
        </div>
        <div class="pull-right">
            <a href="${ctx }/login"><fmt:message key="title.home"/></a>
            <a href="${ctx }/login"><fmt:message key="login.title"/></a>  
        </div>
    </div>
</div>

