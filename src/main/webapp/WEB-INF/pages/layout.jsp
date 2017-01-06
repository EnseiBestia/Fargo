<%@ include file="/common/taglibs.jsp"%>
<div id="formEditDiv">
	
</div>
<script type="text/javascript">
    $(document).ready(function() {
    	
    	//alert("${ctx}${initUrl}");
    	$.get("${ctx}${initUrl}",function(data){ 
    		//alert("Hello world!");
    		$("#formEditDiv").html(data);
    	
    		$("#formEditDiv").find("a").click(function($e) {
    			 	
    			 	$e.preventDefault();
    			 	//buttonClickOpenUrlIndiv("formEditDiv",$(this).attr("href"));
    		});	
    		 
    	});
    });
</script>