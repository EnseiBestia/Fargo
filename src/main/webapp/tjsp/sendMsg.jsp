<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  

  <script type='text/javascript' src='/AppBase-MVC-Hibernate/dwr/interface/SendMsg.js'></script>
  <script type='text/javascript' src='/AppBase-MVC-Hibernate/dwr/engine.js'></script>
    <script type='text/javascript' src='/AppBase-MVC-Hibernate/dwr/util.js'></script> 

 
<script src="${ctx}/scripts/unicorn/js/jquery.min.js"></script>
<script src="${ctx}/scripts/unicorn/js/jquery.ui.custom.js"></script>

<script type="text/javascript">  
    $(function(){  
        dwr.engine.setActiveReverseAjax(true);  
        $("#but").click(function(){  
            SendMsg.sendMsg($("#msg").val());  
        });  
    });  
</script>  
<title>Insert title here</title>  
</head>    
<body>  
    <input type="text" id="msg"  />  
    <input type="button" value="发送" id="but" />  
</body>  
</html> 