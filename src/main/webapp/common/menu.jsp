<%@ include file="/common/taglibs.jsp"%>

<menu:useMenuDisplayer name="Velocity" config="navbarMenu.vm" permissions="rolesAdapter">
<div class="nav-collapse collapse">
<ul class="nav">
    <c:if test="${empty pageContext.request.remoteUser}">
        <li class="active">
            <a href="<c:url value="/login"/>"><fmt:message key="login.title"/></a>
        </li>
    </c:if>
    <menu:displayMenu name="MainMenu"/>
    <menu:displayMenu name="UserMenu"/>
    <menu:displayMenu name="AdminMenu"/>
    <menu:displayMenu name="Logout"/>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!--CfgFormInfo-START-->
    <menu:displayMenu name="CfgFormInfoMenu"/>
    <!--CfgFormInfo-END-->
    
    
    <!--CfgEnumInfo-START-->
    <menu:displayMenu name="CfgEnumInfoMenu"/>
    <!--CfgEnumInfo-END-->
    <!--CfgEnumValueInfo-START-->
    <menu:displayMenu name="CfgEnumValueInfoMenu"/>
    <!--CfgEnumValueInfo-END-->
    
    
    
    
    <!--PaperInfo-START-->
    <menu:displayMenu name="PaperInfoMenu"/>
    <!--PaperInfo-END-->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!--CfgFixedProperty-START-->
    <menu:displayMenu name="CfgFixedPropertyMenu"/>
    <!--CfgFixedProperty-END-->
</ul>
</div>
</menu:useMenuDisplayer>
