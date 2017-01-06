

<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="${refreshResult==0 }">

</c:if>
<c:if test="${refreshResult==1 }">

</c:if>
<c:if test="${refreshResult==2 }">
<div class='btn-group'>
	<c:forEach var="item" items="${buttonList}">     
      <a class='btn btn-info  btn-sm' href='${ctx}/lb/${libraryPath}${buttonUrlMap[item.buttonId]}' >
		${item.buttonName} 
   	 </a>     
	</c:forEach>  
	
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#${stateFieldElement}").text("${stateText}");
	setTimeout('stateMachineRefreshOfObject${objectId}()',5000); 
});
function stateMachineRefreshOfObject${objectId}(){
		$.ajax({ type: 'get', 
			url: '${ctx}/lb/${libraryPath}/cfgStateMachineDefine/view/refreshButtonGroup/${stateMachineId}/${stateFieldElement}/${newState}/${objectId}/${taskId}/php',
			dataType: 'html',
			success: function(msg){		
				if(msg!=null && msg!="" && msg.trim()!=null && msg.trim()!=""){				
										
				}else{
					setTimeout('stateMachineRefreshOfObject${objectId}()',5000); 
				}
			}
		});
}
</script>
</c:if>
