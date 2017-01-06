<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="upload.title"/></title>
    <meta name="menu" content="AdminMenu"/>
</head>

<div class="span3 uploadForm">
    <h2><fmt:message key="upload.heading"/></h2>
    <p><fmt:message key="upload.message"/></p>
</div>
<div class="span7 uploadForm" >
    <spring:bind path="fileUpload.*">
        <c:if test="${not empty status.errorMessages}">
        <div class="alert alert-error fade in">
            <a href="#" data-dismiss="alert" class="close">&times;</a>
            <c:forEach var="error" items="${status.errorMessages}">
                <c:out value="${error}" escapeXml="false"/><br />
            </c:forEach>
        </div>
        </c:if>
    </spring:bind>

    <form:form commandName="fileUpload" method="post" action="${ctx }/lb/files/web/fileupload/submit" enctype="multipart/form-data"
          id="uploadForm" cssClass="well form-horizontal" target="hidden_frame">
        <spring:bind path="fileUpload.name">
        <fieldset class="control-group${(not empty status.errorMessage) ? ' error' : ''}">
        </spring:bind>
            <appfuse:label key="uploadForm.name" styleClass="control-label"/>
            <div class="controls">
                <form:input path="name" id="name"/>
                <form:errors path="name" cssClass="help-inline"/>
            </div>
        </fieldset>
        <spring:bind path="fileUpload.file">
        <fieldset class="control-group${(not empty status.errorMessage) ? ' error' : ''}">
        </spring:bind>
            <appfuse:label key="uploadForm.file" styleClass="control-label"/>
            <div class="controls">
                <input type="file" name="file" id="file"/>
                <form:errors path="file" cssClass="help-inline"/>
            </div>
        </fieldset>
        <fieldset class="form-actions">
            <button type="button" name="upload" class="btn btn-primary" onclick="check();">
                <i class="icon-upload icon-white"></i> <fmt:message key="button.upload"/>
            </button>
<!--             <button type="submit" name="cancel" class="btn" onclick="bCancel=true"> -->
<%--                 <i class="icon-remove"></i> <fmt:message key="button.cancel"/> --%>
<!--             </button> -->
        </fieldset>
    </form:form>
    
    <!-- style="display:none" -->
    <iframe style="display:none" name='hidden_frame' id="hidden_frame"></iframe>  
    
</div>

<div class="span10 uploadDisplay" style="display:none">
    <h2><fmt:message key="display.heading"/></h2>
    <p>Below is a list of attributes that were gathered in FileUploadController.java.</p>

    <table class="table-striped" cellpadding="5">
    	<tr>
            <th>File Id:</th>
            <td id="uploadReturn_fileId"></td>
        </tr>
        <tr>
            <th>Filename:</th>
            <td id="uploadReturn_fileName"></td>
        </tr>
        <tr>
            <th>File content type:</th>
            <td id="uploadReturn_contentType"></td>
        </tr>
        <tr>
            <th>File size:</th>
            <td id="uploadReturn_size"></td>
        </tr>
        <tr>
            <th>File Location:</th>
            <td id="uploadReturn_location"></td>
        </tr>
        <tr>
            <th>File link:</th>
            <td id="uploadReturn_link"></td>
        </tr>
        <%-- <tr>
            <th class="tallCell">File Location:</th>
            <td>The file has been written to: <br />
                <a href="<c:out value="${link}"/>"><c:out value="${location}" escapeXml="false"/></a>
            </td>
        </tr> --%>
    </table>
<!--     <div id="actions" class="form-actions"> -->
<!--         <a class="btn btn-primary" href="mainMenu" > -->
<!--             <i class="icon-ok icon-white"></i> -->
<%--             <fmt:message key="button.done"/> --%>
<!--         </a> -->
<!--         <a class="btn" href="fileupload" > -->
<!--             <i class="icon-upload"></i> -->
<!--             Upload Another -->
<!--         </a> -->
<!--     </div> -->
</div>
<c:set var="scripts" scope="request">

</c:set>

<script type="text/javascript">
function check(){
	var file = $("#file").val();
	if(file==""){
		alert("<fmt:message key='qbQuestionInfo.select'/>");
	}else{
		$("#uploadForm").submit();
	}
}

function uploadCallBack(divhtml){
	$(".uploadForm").hide();
	$(".uploadDisplay").show();
	$("#uploadReturn_friendlyName").text(divhtml.friendlyName);
	$("#uploadReturn_fileName").text(divhtml.fileName);
	$("#uploadReturn_contentType").text(divhtml.contentType);
	$("#uploadReturn_size").text(divhtml.size);
	$("#uploadReturn_location").text(divhtml.location);
	$("#uploadReturn_fileId").text(divhtml.fileId);
	$("#uploadReturn_link").text(divhtml.link);
}
</script>