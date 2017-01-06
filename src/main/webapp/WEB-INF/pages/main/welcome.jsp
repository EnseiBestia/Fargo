<!DOCTYPE html>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<div class="row" style="height:10px">
</div>
<div class="row nopadding">
	<div class="row nopadding">
		<div class="col-xs-12 nopadding" >
			<div class="alert alert-success">
				您好，${currentUser.fullName }，欢迎登陆 <strong><fmt:message key="webapp.name"/></strong>系统。您可以点击 <a title="" href="#"
					id="bn_top_a_profile"><i class="fa fa-user"></i> <span
					class="text"><fmt:message key="title.Profile" /></span></a>查看或修改自己的用户信息，或者使用下面的快捷操作方式管理和维护${currentLibrary.libraryName }数据!

			</div>
		</div>
	</div>
	<div class="col-xs-12 center nopadding" style="text-align: center;">
		<ul class="quick-actions">
			<c:forEach var="v_pl" items="${AuthShortCutPrivilegeList}">
				<li><a href="#"
					onclick="loadShortCutMenu('${ctx}/lb/default${v_pl.authPrivilegeInfo.url}','${v_pl.shortCutName }')">
						<i class="${v_pl.icon }"></i> ${v_pl.shortCutName }
				</a></li>
			</c:forEach>

			<!-- <li>
									<a href="#">
										<i class="icon-user"></i>
										个人信息
									</a>
								</li>
								<li>
									<a href="#">
										<i class="icon-lock"></i>
										权限设置
									</a>
								</li>
								<li>
									<a href="#">
										<i class="icon-cal"></i>
										系统日志
									</a>
								</li> -->
		</ul>
	</div>
</div>

<div class="row nopadding">
	<div class="col-xs-12 col-sm-12 nopadding">
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon"><i class="fa fa-clock-o"></i></span>
				<h5>待处理的任务</h5>
				<span title="54 total posts" class="label label-info tip-left">${fn:length(UserUnfinishedTaskList) }</span>
			</div>
			<div class="widget-content nopadding">
				<%-- <ul class="recent-posts">
					<c:forEach var="v_pl" items="${UserUnfinishedTaskList}">
						<li>
							
							
							<div class="article-post">
								<span class="user-info"><appfuse:lookupView
										libraryPath="default" type="1" value="${ v_pl.ckbType}"
										multiple="false" />
									<appfuse:lookupView libraryPath="default" type="2"
										propertyCode="followType" value="${ v_pl.followType}"
										multiple="false" /> By: ${ v_pl.creator} on ${ v_pl.createTime}
								</span>
								<p style="padding-top:10px">
									<a href="#">${v_pl.theme }</a>
								</p>
							</div>
						</li>

					</c:forEach>

					<li class="viewall"><a title="View all posts" class="tip-top"
						href="#"> + View all + </a></li>
				</ul> --%>
				<c:forEach var="v_pl" items="${UserUnfinishedTaskList}">
				<div class="new-update clearfix ">
					<i class="fa fa-info-circle"></i>
					<div class="update-done">										
						<span class="user-info">${ v_pl.creator} 创建于 <fmt:formatDate value="${v_pl.createTime}" pattern="G yyyy年MM月dd日 E a HH:mm:ss"/></span>
						<span>${v_pl.theme }</span>
					</div>
					<div class="update-date"><appfuse:lookupView
										libraryPath="default" type="1" value="${ v_pl.ckbType}"
										multiple="false" />
									<appfuse:lookupView libraryPath="default" type="2"
										propertyCode="followType" value="${ v_pl.followType}"
										multiple="false" /></div>
					
				</div>
				</c:forEach>
				<ul class="recent-posts">
				<li class="viewall mainMenu_task_table_line" ><a title="" class="tip-top"
						href="#"> + 查看全部 + </a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 nopadding">
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon"><i class="fa fa-bullhorn"></i></span>
				<h5>最新公告</h5>
				<span title="88 total comments" class="label label-info tip-left">${fn:length(SystemNoticeList) }</span>
			</div>
			<div class="widget-content nopadding">
			
			
			<c:forEach var="v_pl" items="${SystemNoticeList}">
				<div class="new-update clearfix ">
					<i class="fa fa-check-circle"></i>
					<div class="update-done">										
						<span class="user-info"><appfuse:lookupView libraryPath="default" type="1"
										value="${ v_pl.noticeLevel}"
										multiple="false" />！ <appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppUser" 
			value="${v_pl.createUserId}" multiple="false"/>  创建于<fmt:formatDate value="${v_pl.createTime}" pattern="G yyyy年MM月dd日 E a HH:mm:ss"/></span>
						<span>${v_pl.noticeText }</span>
					</div>
					<div class="update-date"><appfuse:lookupView
										libraryPath="default" type="1" value="${ v_pl.noticeType}"
										multiple="false" /></div>
					
				</div>
				</c:forEach>
				<ul class="recent-posts">
				<li class="viewall mainMenu_task_table_line" ><a title="" class="tip-top"
						href="#"> + 查看全部 + </a></li>
				</ul>
				
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function loadShortCutMenu(url, text) {
		//jQuery("#content").load(url);
		$("#breadcrumb").append("<a href='#' class='current'>" + text + "</a>");

		ajaxLoadHtmlInDiv($("#containerL1"), url);

	}
</script>
