<%@ include file="/common/header.jsp" %>

<div id="view-container"><div><div class="reg-main">
    <div id="reg-timeline-container"></div>
    
    <div class="reg-main-body reg-main-success-body mt30">
        <p class="text-center"><img src="${ctx}/scripts/sin/images/register_success.png"></p>
        <h3 class="text-center mt25"><fmt:message key="signup.sensitize.t0"/></h3>
        <p class="text-center mt15"><fmt:message key="signup.sensitize.t1"/></p>
        <p class="text-center activ-tips"><fmt:message key="signup.sensitize.t2"/>33072674@qq.com<fmt:message key="signup.sensitize.t3"/><br>
        <fmt:message key="signup.sensitize.t4"/></p>
        <div class="text-center mb25">
            <a href="${ctx }/login">
                <button href="${ctx }/login" class="u-btn u-btn-primary"><fmt:message key="signup.sensitize.t5"/></button>
            </a>
        </div>
    </div>
    
</div>

       

<%@ include file="/common/footer.jsp" %>