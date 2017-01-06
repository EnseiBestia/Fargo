<!DOCTYPE html>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>	
		
			<div id="search">
				<input type="text" placeholder="Search here..."/><button type="submit" class="tip-right" title="Search"><i class="fa fa-search"></i></button>
			</div>	
			
				<ul>
				
				<!-- <li class="active"><a href="#" ><i class="fa fa-home"></i> <span>主页</span></a></li> -->
				
				<c:forEach var="v_pl" items="${currentPrivilegeTreeCache}" >
					<c:if test="${v_pl.authPrivilegeInfo.privilegeType=='AWA'}">
						<li class="submenu">
							<a href="#"><i class="${v_pl.authPrivilegeInfo.iconCode}"></i> <span>${v_pl.authPrivilegeInfo.privilegeName}</span><i class="arrow fa fa-chevron-right"></i></a>
							<ul>
								<c:forEach var="v_pl_0" items="${v_pl.childen}" >
									<li><a href="#" onclick="loadMenu('${ctx}/lb/${libraryPath}${v_pl_0.authPrivilegeInfo.url}',this,2)"><span>${v_pl_0.authPrivilegeInfo.privilegeName}</span></a></li>
								</c:forEach>
							</ul>
						</li>	
					</c:if>
					<c:if test="${v_pl.authPrivilegeInfo.privilegeType=='AWB'}">
						<li ><a href="#" onclick="loadMenu('${ctx}/lb/${libraryPath}${v_pl.authPrivilegeInfo.url}',this,1)"><i class="${v_pl.authPrivilegeInfo.iconCode}"></i> <span>${v_pl.authPrivilegeInfo.privilegeName}</span></a></li>					
					</c:if>
					<c:if test="${v_pl.authPrivilegeInfo.privilegeType=='AWC'}">
						<li ><a href="#" onclick="loadMenu('${ctx}/lb/${libraryPath}${v_pl.authPrivilegeInfo.url}',this,1)"><i class="${v_pl.authPrivilegeInfo.iconCode}"></i> <span>${v_pl.authPrivilegeInfo.privilegeName}</span></a></li>					
					</c:if>
				</c:forEach>
				
						
				<%-- <li ><a href="${ctx}/logout"><i class="fa fa-th"></i> <span><fmt:message key="user.logout"/></span></a></li> --%>	
				</ul>			
<script type="text/javascript">
	var gl_now_li=null;
	function loadMenu(url,v,level){
		var screenType=getCookieOfBmap("ScreenShowType");

		//jQuery("#content").load(url);
		$("#breadcrumb").find("a.mbx").remove();
		var array=new Array();
		$(v).parents("li").each(function( index ) {
			//alert($(this).find("a:first").text().split('\n')[0]);
			//
			array.push($(this).find("a:first").text());
		});
		for(var text in array.reverse()){
			$("#breadcrumb").append("<a href='#' class='current mbx'>"+array[text]+"</a>");
		}
		//$("#breadcrumb").prepend("<a href='#' title='Go to Home' class='current mbx'><i class='icon-home'></i>${rootMenuName}</a>");

		gl_now_li=v;

		ajaxLoadHtmlInDiv($("#containerL1"),url);

		jQuery(v).parent().parent().parent().parent().find("li").removeClass("active");


		jQuery(v).parent().addClass("active");

		jQuery(v).parent().parent().parent().addClass("active");


		if(screenType==0 && level==2){
			jQuery(v).parent().parent().parent().removeClass("open");
			$(v).closest('ul').css("display","none");
		}
	}
</script>			
				
		