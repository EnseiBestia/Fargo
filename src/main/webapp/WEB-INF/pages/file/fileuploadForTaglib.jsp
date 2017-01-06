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

    <form:form commandName="fileUpload" method="post" action="${ctx}/lb/files/web/taglib/${filePath}/${ifNeedDownload}/${ifPublic}/fileupload/submit" enctype="multipart/form-data"
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
            <th>File absolutePath:</th>
            <td id="uploadReturn_absolutePath"></td>
        </tr>
        <tr>
            <th>File relativePath:</th>
            <td id="uploadReturn_relativePath"></td>
        </tr>
        <tr>
            <th>File filekey:</th>
            <td id="uploadReturn_filekey"></td>
        </tr>
        <tr>
            <th>File fileURL:</th>
            <td id="uploadReturn_fileURL"></td>
        </tr>
    </table>
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

function uploadForTaglibCallBack(divhtml){
	if(divhtml.result=="-1" || divhtml.result==-1){
		alert(divhtml.description);
	}else{
		$(".uploadForm").hide();
		$(".uploadDisplay").show();
		
		/* $("#uploadReturn_friendlyName").text(divhtml.friendlyName); */
		$("#uploadReturn_fileName").text(divhtml.fileName);
		$("#uploadReturn_contentType").text(divhtml.contentType);
		$("#uploadReturn_size").text(divhtml.size);
		$("#uploadReturn_absolutePath").text(divhtml.absolutePath);
		$("#uploadReturn_fileId").text(divhtml.fileId);
		$("#uploadReturn_filekey").text(divhtml.filekey);
		$("#uploadReturn_fileURL").text(divhtml.fileURL);
	}
	
}
</script>