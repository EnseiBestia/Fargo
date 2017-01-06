<!DOCTYPE html>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
   
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>

    <decorator:head/>

</head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

    <div class="container-fluid">
        <%@ include file="/common/messages.jsp" %>
        <div class="row-fluid">
        
        
            <decorator:body/>

        </div>
    </div>

</body>
</html>
