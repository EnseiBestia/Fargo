<!DOCTYPE html>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>	
		
			<!-- <div id="search">
				<input type="text" placeholder="Search here..."/><button type="submit" class="tip-right" title="Search"><i class="fa fa-search"></i></button>
			</div>	 -->
			
				<ul>
				
				<!-- <li class="active"><a href="#" ><i class="fa fa-home"></i> <span>主页</span></a></li> -->
				
				<c:forEach var="v_pl" items="${currentPrivilegeTreeCache}" >
					<c:if test="${v_pl.authPrivilegeInfo.privilegeType=='AWA'}">
						<li class="submenu">
							<a href="#"><i class="icon icon-th-list"></i> <span>${v_pl.authPrivilegeInfo.privilegeName}</span><span class="label">3</span></a>
							<ul>
								<c:forEach var="v_pl_0" items="${v_pl.childen}" >
									<li><a href="#" onclick="loadMenu('${ctx}/lb/${libraryPath}${v_pl_0.authPrivilegeInfo.url}',this)"><span>${v_pl_0.authPrivilegeInfo.privilegeName}</span></a></li>
								</c:forEach>
							</ul>
						</li>	
					</c:if>
					<c:if test="${v_pl.authPrivilegeInfo.privilegeType=='AWB'}">
						<li ><a href="#" onclick="loadMenu('${ctx}/lb/${libraryPath}${v_pl.authPrivilegeInfo.url}',this)"><i class="fa fa-th-list"></i> <span>${v_pl.authPrivilegeInfo.privilegeName}</span></a></li>					
					</c:if>
				</c:forEach>
				
						
				<%-- <li ><a href="${ctx}/logout"><i class="fa fa-th"></i> <span><fmt:message key="user.logout"/></span></a></li> --%>	
				</ul>			
<script type="text/javascript">
var gl_now_li=null;
function loadMenu(url,v){
	
	//jQuery("#content").load(url);
	$("#breadcrumb").find("a").remove();
	
	$(v).parents("li").each(function( index ) {
			//alert($(this).find("a:first").text().split('\n')[0]);
			$("#breadcrumb").prepend("<a href='#' class='current'>"+$(this).find("a:first").text()+"</a>");
	});
	$("#breadcrumb").prepend("<a href='#' title='Go to Home' class='current'><i class='icon-home'></i>${rootMenuName}</a>");
	
	gl_now_li=v;
	
	ajaxLoadHtmlInDiv($("#containerL1"),url);
	
	jQuery(v).parent().parent().parent().parent().find("li").removeClass("active");
	jQuery(v).parent().addClass("active");
	
	
}
</script>			
				
		