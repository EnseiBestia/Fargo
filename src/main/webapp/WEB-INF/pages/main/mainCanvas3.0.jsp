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
		<link href="${ctx}/scripts/umeditor1.2.2/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
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
    	<script type="text/javascript" charset="utf-8" src="${ctx}/scripts/umeditor1.2.2/umeditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${ctx}/scripts/umeditor1.2.2/umeditor.min.js"></script>
	    <script type="text/javascript" src="${ctx}/scripts/umeditor1.2.2/lang/zh-cn/zh-cn.js"></script>
	    
        <script type="text/javascript" src="<c:url value='/scripts/3.0/script.js'/>"></script>	    
        <script type="text/javascript" src="<c:url value='/scripts/3.0/spin.js'/>"></script>
		<style>
			.left-style{
				height: 25px !important;
				margin: 0;
				min-height: auto !important;
				position: absolute;
				left: 225px;
				top: 10PX;
				z-index: 20;
				font-size:12px;
/*
				font-weight:bold;
*/
				color: rgba(255, 255, 255, 0.6);
			}

		</style>
	</head>
	<body data-color="grey" class="flat">
		<div id="wrapper">
		<div id="header">
			<h1 id="header_h1" class="split_screen_header_h1"><a href="#">bMap</a></h1>	
			<a id="menu-trigger" href="#"><i class="fa fa-bars"></i></a>	
		</div>
			
			<div id="userp" class="left-style">当前用户：${currentUser.fullName }</div>
			<div id="user-nav" ><!-- style="z-index:0;" -->
	            <ul class="btn-group user_nav_top_menu_a">
	            	<c:forEach var="v_pl" items="${userAuthPrivilegeViewTree}" >
	            		<li class="btn user_nav_top_menu_a" ><a  title="" href="#" id="bn_top_a_menu_${v_pl.authPrivilegeInfo.privilegeId}"><i class="${v_pl.authPrivilegeInfo.iconCode}"></i> <span class="text">${v_pl.authPrivilegeInfo.privilegeName}</span></a></li>
	            	</c:forEach>
	                <c:if test="${fn:length(otherLibraryList)>0 }">
	                	<li class="btn dropdown user_nav_top_menu_a" id="menu-messages"><a href="${ctx}/lb/${v_pl.path}/mainMenu" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="fa fa-cloud"></i> <span class="text">${currentLibrary.libraryName }</span> <span class="label label-danger">${fn:length(otherLibraryList)+1 }</span> <b class="caret"></b></a>
		                    <ul class="dropdown-menu messages-menu">
		                        
		                        <c:forEach var="v_pl" items="${otherLibraryList}" >
		                        	<li class="message-item">
		                        	<a href="${ctx}/lb/${v_pl.path}/mainMenu">
			                            <div class="message-content">
			                            	
			                                <span class="message-sender">
			                                    ${v_pl.libraryName }
			                                </span>
			                                
			                            </div>
		                        	</a>
		                        	</li>
		                        </c:forEach>
		                        
		                    </ul>
	                	</li>
	                </c:if>
	                <c:if test="${fn:length(otherLibraryList)<=0 }">
	                	<li class="btn user_nav_top_menu_a"><a title="" href="#" id="top_a_logout"><i class="fa fa-cloud"></i> <span class="text">${currentLibrary.libraryName }</span></a></li>
	                </c:if>
	                
	                <li class="btn user_nav_top_menu_a"><a title="" href="${ctx}/logout" id="top_a_logout"><i class="fa fa-share"></i> <span class="text"><fmt:message key="title.Logout"/></span></a></li>
	            </ul>
	        </div>
		<div id="sidebar" class="div_iframe">
		<%@ include file="menu3.0.jsp"%>
		
		
		</div>	
		
		<div id="content" class="screen_show_split_content">
		    		
			<div id="breadcrumb">
				<a href="${ctx }/lb/${libraryPath}/mainMenu" ><i class="fa fa-home"></i> 首页</a>
					<!--  <a href="#" class="current">Dashboard</a>  -->
					
				<div style="position:absolute;right:-5px;top:0px">
				<a id="screen_show_full_a" href="#" title="隐藏左侧菜单栏" onclick="changeScreenShow(0)" ><i class="fa fa-align-justify"></i></a>
				<a id="screen_show_split_a" href="#" title="显示左侧菜单栏" onclick="changeScreenShow(1)" style="display:none"><i class="fa fa-th-list"></i></a>
				</div>
			</div>
			<div class="container-fluid" >
				<div class="row" >
					<div class="col-xs-12 div_iframe top_div_iframe " id="containerL1">
					<%@ include file="welcome.jsp"%>
					</div>
				</div>
				
				
			</div>	
		</div>
		<div class="row">
			<div id="footer" class="col-xs-12">
				Copyright &copy; 2012-2016 <fmt:message key="webapp.company"/> <!-- ｜ -->
			</div>
		</div>
	</div>
			
	</body>
	
<script type="text/javascript">

$(document).ready(function() {
	var screenType=getCookieOfBmap("ScreenShowType");
	//alert(screenType);
	if(screenType!=null){
		changeScreenShow(screenType);
	}
	
	var h1=$(window).height()
	var h2=$("#containerL1").height();
	//alert(h1+","+h2);
	if(h1-115>h2){
		$("#containerL1").css('min-height',h1-115);
			
	}
	
	<c:forEach var="v_pl" items="${userAuthPrivilegeViewTree}" >
		$('#bn_top_a_menu_${v_pl.authPrivilegeInfo.privilegeId}').click(function(){
			//changeScreenShow(1);
			$(".top-console-menu-select").removeClass("top-console-menu-select");
			$('#bn_top_a_menu_${v_pl.authPrivilegeInfo.privilegeId}').addClass("top-console-menu-select");
			$('#bn_top_a_menu_${v_pl.authPrivilegeInfo.privilegeId} i').addClass("top-console-menu-select");
			ajaxLoadHtmlInDiv($("#sidebar"),"${ctx}/lb/${libraryPath}/menuList/root/"+${v_pl.authPrivilegeInfo.privilegeId}+"/php","get","","",true);
		});
	</c:forEach>

	$('#bn_top_a_menu_${userAuthPrivilegeViewTree[0].authPrivilegeInfo.privilegeId}').click();
	
	
});


function changeScreenShow(type){
	if(type==0){
		//全屏
		$("#screen_show_full_a").hide();
		$("#screen_show_split_a").show();
		//$("#sidebar").hide();
		
		$("#wrapper").removeClass("screen_show_split_content");
		$("#wrapper").addClass("screen_show_full_content");
		
		
	}else{
		$("#screen_show_full_a").show();
		$("#screen_show_split_a").hide();
		//$("#sidebar").show();
		
		
		$("#wrapper").removeClass("screen_show_full_content");
		$("#wrapper").addClass("screen_show_split_content");
		
		
	}
	setCookieOfBmap("ScreenShowType",type,730);
}
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});

</script>
		    
  
</html>