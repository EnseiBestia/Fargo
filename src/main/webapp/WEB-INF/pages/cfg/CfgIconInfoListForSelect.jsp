
	


<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>


<div class="row" >
	
		<%-- <div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgIconInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgIconInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	 --%>
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgIconInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="cfgIconInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
		

		<c:forEach var="v_folder" items="${cfgIconFolderList}">
			<section>
			  <h2 class="page-header">${v_folder }</h2>
			
			  <div class="row fontawesome-icon-list">
			    
				<c:forEach var="v_icon" items="${cfgIconInfoListSplitByFolder[v_folder]}">
					<div class="fa-hover col-md-3 col-sm-4"><a href="#" class="btn_a_click" onclick="selectIcon(${v_icon.iconId },'${v_icon.iconCode }')" 
					id="${v_icon.iconId }"><i class="${v_icon.iconCode }"></i> ${v_icon.iconName }</a></div>
				
				</c:forEach>
			    
			  </div>
			
			</section>
		
		</c:forEach>
		
<input type="hidden" id="icon_selected" value=""/>		
		
</div>
</div>

<script type="text/javascript">
	
	function selectIcon(id,code){
		$(".fontawesome-icon-list-a-hover").removeClass("fontawesome-icon-list-a-hover");
		$("#icon_selected").val(code);
		
		$("#"+id).addClass("fontawesome-icon-list-a-hover");
	}
	
</script>

