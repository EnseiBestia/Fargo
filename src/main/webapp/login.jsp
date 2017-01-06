<%@ include file="/common/taglibs.jsp" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<head>
    
    <link rel="icon" href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" mce_href="${ctx}/scripts/unicorn2.2/img/bmp_favicon.ico" type="image/x-icon">
    <title><fmt:message key="webapp.name"/></title>

    <%-- <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/lib/bootstrap-2.2.1.min.css'/>" />
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/lib/bootstrap-responsive-2.2.1.min.css'/>" />
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/style.css'/>" /> --%>

<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/jquery-ui.css" />		
<link rel="stylesheet" href="${ctx}/scripts/unicorn2.2/css/unicorn.css" />
		

    

	<%-- <link rel="stylesheet" href="${ctx}/scripts/login/css/bootstrap.min.css" /> --%>
	<link rel="stylesheet" href="${ctx}/scripts/login/css/font-awesome.css" />
	<link rel="stylesheet" href="${ctx}/scripts/login/css/unicorn.login.css"/>


	<script src="${ctx}/scripts/login/js/jquery.js"></script>
	<script src="${ctx}/scripts/login/js/jquery-ui.custom.min.js"></script>
	<script src="${ctx}/scripts/login/js/unicorn.login.js"></script>  
	
	<script type="text/javascript" src="<c:url value='/scripts/lib/bootstrap-2.2.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/lib/plugins/jquery.cookie.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/scripts/script.js'/>"></script>
    <%-- <script type="text/javascript" src="<c:url value='/scripts/lib/jquery-1.8.2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/lib/bootstrap-2.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/lib/plugins/jquery.cookie.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/script.js'/>"></script> --%>
</head>
<body id="login">

<div class="content">
  <div class="row">
    
    <!--/.sildbar end-->
    <div class="login">
      <!-- <div class="login-title">&nbsp;</div> -->
      <div class="login-main">
      
         <form method="post" id="loginForm" action="<c:url value='/j_security_check'/>"
    onsubmit="saveUsername(this);return validateForm(this)" class="form-signin " autocomplete="off">
    <h3 class="form-signin-heading">
        <fmt:message key="login.heading"/>
    </h3>
<c:if test="${param.error != null}">

		
          
          
    <div class="input-group input-error"> 
           <span class="user-error"><img src="${ctx}/scripts/login/images/error.png"></span>
        <fmt:message key="errors.password.mismatch"/>
    </div>
</c:if>
 <div class="input-group ">
 <span class="input-group-addon"><i class="fa fa-user"></i></span>
    <input type="text" name="j_username" id="j_username" class="input-block-level form-control "
           placeholder="<fmt:message key="label.login.username"/>" required tabindex="1">
</div>
<div class="input-group ">
<span class="input-group-addon"><i class="fa fa-lock"></i></span>
    <input type="password" class="input-block-level form-control " name="j_password" id="j_password" tabindex="2"
           placeholder="<fmt:message key="label.password"/>" required>
</div>
<c:if test="${appConfig['rememberMeEnabled']}">
    <label class="checkbox" for="rememberMe">
        <input type="checkbox" class="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"/>
        <fmt:message key="login.rememberMe"/></label>
</c:if>

    
    <div class="form-actions input-sm formm clearfix">
            
            <input type="submit" class="btn-block btn-color btn-default" value="登录" />
            
            <%-- <div class="pull-left text"> <a href="#">忘记登录密码？</a></div>
            <div class="pull-right btn-social"><a href="${ctx }/signup/add">免费注册</a></div> --%>
          </div>
          
</form>
        
      </div>
    </div>
    <!--/.login end--> 
  </div>
  <!--/.row end--> 
  <div class="row">
  <div class="footer"><p><fmt:message key="webapp.systemNameAndVersion"/>&nbsp;&nbsp;&nbsp; Copyright &copy; 2015 <fmt:message key="webapp.company"/> </p></div>
  </div>
   <!--/.row end--> 
</div>
<c:set var="scripts" scope="request">
<%@ include file="/scripts/login.js"%>
</c:set> 

<%-- <form method="post" id="loginForm" action="<c:url value='/j_security_check'/>"
    onsubmit="saveUsername(this);return validateForm(this)" class="form-signin" autocomplete="off">
    <h2 class="form-signin-heading">
        <fmt:message key="login.heading"/>
    </h2>
<c:if test="${param.error != null}">
    <div class="alert alert-error fade in">
        <fmt:message key="errors.password.mismatch"/>
    </div>
</c:if>
    <input type="text" name="j_username" id="j_username" class="input-block-level"
           placeholder="<fmt:message key="label.username"/>" required tabindex="1">
    <input type="password" class="input-block-level" name="j_password" id="j_password" tabindex="2"
           placeholder="<fmt:message key="label.password"/>" required>

<c:if test="${appConfig['rememberMeEnabled']}">
    <label class="checkbox" for="rememberMe">
        <input type="checkbox" class="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"/>
        <fmt:message key="login.rememberMe"/></label>
</c:if>

    <button type="submit" class="btn btn-large btn-primary" name="login" tabindex="4">
        <fmt:message key='button.login'/>
    </button>
</form>

 <p>
    <fmt:message key="login.signup">
        <fmt:param><c:url value="/signup/add"/></fmt:param>
    </fmt:message>
</p> 

<c:set var="scripts" scope="request">
<%@ include file="/scripts/login.js"%>
</c:set> --%>

<%-- <p><fmt:message key="login.passwordHint"/></p> --%>
</body>
<script type="text/javascript">
$(document).ready(function() {
	if($("#wrapper").length > 0 && $("#header").length > 0){
		self.location.href="${ctx}/login";
	}
});
</script>