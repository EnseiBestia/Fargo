
// This function is used by the login screen to validate user/pass
// are entered.
function validateRequired(form) {
    var bValid = true;
    var focusField = null;
    var i = 0;
    var fields = new Array();
    oRequired = new required();

    for (x in oRequired) {
        if ((form[oRequired[x][0]].type == 'text' || form[oRequired[x][0]].type == 'textarea' || form[oRequired[x][0]].type == 'select-one' || form[oRequired[x][0]].type == 'radio' || form[oRequired[x][0]].type == 'password') && form[oRequired[x][0]].value == '') {
           if (i == 0)
              focusField = form[oRequired[x][0]];

           fields[i++] = oRequired[x][1];

           bValid = false;
        }
    }

    if (fields.length > 0) {
       focusField.focus();
       alert(fields.join('\n'));
    }

    return bValid;
}

// This function is a generic function to create form elements
function createFormElement(element, type, name, id, value, parent) {
    var e = document.createElement(element);
    e.setAttribute("name", name);
    e.setAttribute("type", type);
    e.setAttribute("id", id);
    e.setAttribute("value", value);
    parent.appendChild(e);
}

function confirmDelete(obj) {
    var msg = "你确定要删除 " + obj + "?";
    ans = confirm(msg);
    return ans;
}

// 18n version of confirmDelete. Message must be already built.
function confirmMessage(obj) {
    var msg = "" + obj;
    ans = confirm(msg);
    return ans;
}
function confirmEditMessage() {
    var msg = "Are you sure you want to edit this?";
    ans = confirm(msg);
    return ans;
}
function confirmSaveMessage() {
    var msg = "Are you sure you want to save this?";
    ans = confirm(msg);
    return ans;
}
function confirmDeleteMessage() {
    var msg = "你确定要删除吗?";
    ans = confirm(msg);
    return ans;
}

function alertMessageOfUnicorn(msg) {
	//bootbox.alert(msg);
	alert(msg);
}



//replace validate
function replaceBeginOfValidateJs(str){
//	str=str.replace("<!-- Begin ","<!-- ");
	//str=str.replace("//End --> "," -->");
	
	return str;
}
/*new get or post function start*/



function ajaxLoadHtmlInDiv($btnOrDivObj,url,getType,formId,paras,ifMenuListLoad){
	
	
	var $divObj=$btnOrDivObj;
	if(!$btnOrDivObj.hasClass('div_iframe')){
		$divObj=$btnOrDivObj.closest('div .div_iframe');
	}
	
	if(ifMenuListLoad!=true){
		var spinner = new Spinner().spin($divObj[0]);
	}
	var t_getType="get";
	if(getType=="post"){
		t_getType="post";
	}
	
	var rebuildUrl=GetUrlRequestParameters(url,formId,paras);
	//alert(rebuildUrl["url"]);
	//alert(rebuildUrl["urlFormSerialize"]);
	
	$.ajax({ 
		type: t_getType, 
		url: rebuildUrl["url"], 
		data: rebuildUrl["urlFormSerialize"],
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		success: function(msg){
			try{
				$divObj.html(replaceBeginOfValidateJs(msg));
			}catch(exception){
				alert(exception);
			}
			//alert(121);
			var h1=$(window).height()
			var h2=$divObj.height();
			//alert(h1+","+h2);
			if(h1-115>h2){
				if($divObj.hasClass('top_div_iframe') ){
					$divObj.css('min-height',h1-115);
				}		
			}
			if(ifMenuListLoad){
				
			}else{
				$divObj.find("a").click(function($e) {
					if (!$(this).hasClass('close') && !$(this).hasClass('fg-button') && !$(this).hasClass('btn_a_click') && !$(this).hasClass('select2-search-choice-close') && ifMenuListLoad!=true) {
						
						$e.preventDefault();
					 	
						ajaxLoadHtmlInDiv($divObj,$(this).attr("href"));
						
					}
					
					
				 	
				});
			}   
			
		}
		});
}

function ajaxProcessBtnGroupOperator($elementObj,url,getType,refreshCallBack,callBack){
	var t_getType="get";
	if(getType=="post"){
		t_getType="post";
	}
	$.ajax({ 
		type: t_getType, 
		url: url, 
		data: "",
		contentType: "json", 
		success: function(msg){
			var jsonobj=eval('('+msg+')');  
			alert(jsonobj.rtnDescription);
			if(jQuery.type(callBack) === "function"){
				callBack(msg);
			}else{
				if(jsonobj.rtnValue==1 && jQuery.type(refreshCallBack) === "function"){
					refreshCallBack(jsonobj);
				}else{
				}
			}		
		}
	});
}
function ajaxProcessBtnStateChangeOperator($elementObj,url,getType,callBackUrl){
	var t_getType="get";
	if(getType=="post"){
		t_getType="post";
	}
	$.ajax({ 
		type: t_getType, 
		url: url, 
		data: "",
		contentType: "json", 
		success: function(msg){
			var jsonobj=eval('('+msg+')');  
			alert(jsonobj.rtnDescription);
			if(callBackUrl!=null){
				if(jsonobj.rtnValue==1){
					ajaxLoadHtmlInDiv($elementObj,callBackUrl,"get");
				}
			}	
		}
	});
}
/*new get or post function end*/

/*select start*/

function select2ForFormElement($elementObj,url,required,selValue,callBack){
	try{
		$.ajax({ 
			type: "get", 
			url: url, 
			dataType: "json",
			success: function(msg){		
				if(required!=true){
					$elementObj.append("<option value=0>请选择</option>");
				}
				
				$.each(msg, function (key, data) {
					if(data.id==selValue){
						$elementObj.append("<option value=" + data.id + " selected =\"true\">" + data.text + "</option>");
					}else{
						$elementObj.append("<option value=" + data.id + ">" + data.text + "</option>");
					}
					
	            });
				if(callBack != undefined){
					callBack();
				}
				/*if(selValue!=null && selValue!=""){
					$elementObj.select2("val", selValue)				
				}else{
					$elementObj.select2();
				}*/
				
			}
		});
	}catch(exception){
		alert(exception);
	}
}
function select2MulitiForFormElement($elementObj,url,selValue){
	//alert(selValue)
	try{
		$.ajax({ 
			type: "get", 
			url: url, 
			dataType: "json",
			success: function(msg){		
				
				$.each(msg, function (key, data) {
					//alert(data.id+"|"+selValue+"|"+$.inArray(data.id, selValue))
					if($.inArray(data.id, selValue)!=-1){
						$elementObj.append("<option value=" + data.id + " selected =\"true\">" + data.text + "</option>");
					}else{
						$elementObj.append("<option value=" + data.id + ">" + data.text + "</option>");
					}
					
	            });
				$elementObj.select2({});
				/*if(selValue!=null && selValue!=""){
					$elementObj.select2("val", selValue)				
				}else{
					$elementObj.select2();
				}*/
				
			}
		});
	}catch(exception){
		alert(exception);
	}
} 
/*select end*/
/*dialog start*/
function bootboxOpenDialog(url,title,successCallBack,cancelCallBack){
	bootbox.dialog({
		  // dialog的内容
		  ajaxURL0:url,
		  //message: "<div id='bootbox_dialog_0' class='div_iframe'></div>",
		   
		  // dialog的标题
		  title: title+"选择",
		   
		  // 退出dialog时的回调函数，包括用户使用ESC键及点击关闭
		  onEscape: function() {},
		  
		  // 是否显示此dialog，默认true
		  show: true,
		   
		  // 是否显示body的遮罩，默认true
		  backdrop: true,
		   
		  // 是否显示关闭按钮，默认true
		  closeButton: true,
		   
		  // 是否动画弹出dialog，IE10以下版本不支持
		  //animate: true,
		   
		  // dialog的类名
		  className: "my-modal-dialog-search",
		   
		  // dialog底端按钮配置
		  buttons: {
		     
		    // 其中一个按钮配置
		    success: {   
		      // 按钮显示的名称
		      label: "<i class='fa fa-check'></i>确定",
		       
		      // 按钮的类名
		      className: "btn-success",
		       
		      // 点击按钮时的回调函数
		      callback: function() {if(successCallBack)successCallBack();}
		    },
		     
		    // 另一个按钮配置
		    "cancel": {
		      label: "<i class='fa fa-times'></i>取消",
		      className: "btn-danger",
		      callback: function() {if(cancelCallBack)cancelCallBack();}
		    }
		  }
		});
}

/*dialog end*/

function reInitTitleDivHeight(div1,div2){
	if($("#"+div1).height()<$("#"+div2).height()){
		$("#"+div1).css("height",$("#"+div2).height());
	}
}

//设置cookie
function setPageSizeToCookieOfForm(formName,size){
	//alert(formName);
	setCookieOfBmap(formName+"-pageSize", size+"",730); 
	//alert(size);
}
function setCookieOfBmap(c_name,value,expiredays) {  
	var exdate=new Date();  
	exdate.setDate(exdate.getDate()+expiredays);  
	//alert(exdate.getDate()+expiredays);  
	document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+";path=/";  
}  
function getCookieOfBmap(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 
/**//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var visitUrlMap = {}; 
var visitUrlFormElementMap = {};
function GetUrlRequestParameters(url,formId,paras){
	//console.info("visitUrlMap:"+visitUrlMap);
	//console.info("visitUrlFormElementMap:"+visitUrlFormElementMap);
	var rebuildUrl={};
	var urlMap={}; 
	var urlBody=url;
	if(url!=null){
		if (url.indexOf("?") != -1 && (url.indexOf("?")+1)<url.length) { 
			var str = url.substr(url.indexOf("?")+1,url.length); 
			urlBody=url.substr(0,url.indexOf("?"));
			if(str!=null && str!=""){
				var strs = str.split("&"); 
				for(var i = 0; i < strs.length; i ++) { 
					//alert(escape(decodeURIComponent(strs[i].split("=")[1])));
					//urlMap[strs[i].split("=")[0]]=((strs[i].split("=")[1])); 
					urlMap[strs[i].split("=")[0]]=(((strs[i].split("=")[1]))); 
				} 
			}			
		} 		
	}
	if(paras!=null  && paras!=""){
		var strs=paras.split("&");
		for(var i = 0; i < strs.length; i ++) { 
			urlMap[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]); 
		} 
	}
	if(urlMap["pageGroupType"]!=null && visitUrlMap[urlBody]!=null){
		console.info("visitUrlMap[urlBody]:"+visitUrlMap[urlBody]);
		console.info("visitUrlFormElementMap[urlBody]:"+visitUrlFormElementMap[urlBody]);
		rebuildUrl["url"]=visitUrlMap[urlBody];
		rebuildUrl["urlFormSerialize"]=visitUrlFormElementMap[urlBody];
	}else{
		var str=urlBody+"?";
		$.each(urlMap,function(key,value){     
			str=str+key+"="+value+"&";     
		});
		var t_form_str="";
		if(formId!=null && formId!=""){
			var postParametars = $("#"+formId).serialize().split("&");
			
		    for (var i = 0; i < postParametars.length; i++) {
		        if(postParametars[i]!=null && postParametars[i].indexOf(".") >0){
		        	var aaaaaa=postParametars[i].split("=");
		        	if(aaaaaa!=null && aaaaaa.length>=2 && aaaaaa[1]!="" && aaaaaa[1]!=null){
		        		t_form_str=t_form_str+postParametars[i]+"&";
		        	}
		        }else{
		        	t_form_str=t_form_str+postParametars[i]+"&";
		        }
		    };
			//t_form_str=$("#"+formId).serialize();
		}
		if(urlMap["pageGroupType"]==null){
			visitUrlMap[urlBody]=str;
			visitUrlFormElementMap[urlBody]=t_form_str;
		}
		
		
		rebuildUrl["url"]=str;
		rebuildUrl["urlFormSerialize"]=t_form_str;
	}	  
	return rebuildUrl;
	//alert(str);
}
/**/


/*jquery validate msg start*/
jQuery.extend(jQuery.validator.messages, {
    required: "此字段必填",
	remote: "请修正该字段",
	email: "请输入正确格式的电子邮件",
	url: "请输入合法的网址",
	date: "请输入合法的日期",
	dateISO: "请输入合法的日期 (ISO).",
	number: "请输入合法的数字",
	digits: "只能输入整数",
	creditcard: "请输入合法的信用卡号",
	equalTo: "请再次输入相同的值",
	accept: "请输入拥有合法后缀名的字符串",
	maxlength: jQuery.validator.format("请输入一个 长度最多是 {0} 的字符串"),
	minlength: jQuery.validator.format("请输入一个 长度最少是 {0} 的字符串"),
	rangelength: jQuery.validator.format("请输入 一个长度介于 {0} 和 {1} 之间的字符串"),
	range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
	max: jQuery.validator.format("请输入一个最大为{0} 的值"),
	min: jQuery.validator.format("请输入一个最小为{0} 的值")
});

/*jquery validate msg end*/
function containerLoadUrlUseAjaxInDiv(formId,url){
	
	//alert($("#"+formId).closest('div .container').attr("id"));
	containerLoadUrlUseAjaxInDivWidDivId($("#"+formId).closest('div .div_iframe').attr("id"),url);
}
function containerLoadUrlUseAjaxInDivWidDivId(divId,url){
	//$("#"+divId).html();
	var spinner = new Spinner().spin(document.getElementById(divId));
	$.get(url,function(data){ 
		
		try{
			$("#"+divId).html(replaceBeginOfValidateJs(data));
			
		}catch(exception){
			alert(exception);
		}
		//alert(1);
		 $("#"+divId).find("a").click(function($e) {
			 	//loadMenu($(this).attr("href"),v);
			 if (!$(this).hasClass('close')) {
				 //alert(divId+"|"+url);
				 $e.preventDefault ();
				 containerLoadUrlUseAjaxInDivWidDivId(divId,$(this).attr("href"));
			 }
			 	
			});	
		 
		 
		});
}

function containerFormSubmitUseAjaxIndiv(formId,formAction){
	
	//alert($("#"+formId).closest('div .div_iframe').attr("id"));
	containerFormSubmitUseAjaxIndivByDivId($("#"+formId).closest('div .div_iframe').attr("id"),formId,formAction);
}
function containerFormSubmitUseAjaxIndivByDivId(divId,formId,formAction,paras){
	var spinner = new Spinner().spin(document.getElementById(divId));
	$.ajax({ 
		type: "post", 
		url: formAction, 
		data: $("#"+formId).serialize(),
		success: function(msg){
			//alert(msg);
			try{
				$("#"+divId).html(replaceBeginOfValidateJs(msg));
			}catch(exception){
				alert(exception);
			}
			$("#"+divId).find("a").click(function($e) {
				if (!$(this).hasClass('close')) {
					$e.preventDefault();
				 	
				 	containerLoadUrlUseAjaxInDiv(divId,$(this).attr("href"));
				}
			 	
			 	//loadMenu($(this).attr("href"),gl_now_li);
			});
		}
		}); 
}

function containerLoadUrlUseAjaxPostInDiv(formId,url){
	
	//alert($("#"+formId).closest('div .container').attr("id"));
	containerLoadUrlUseAjaxPostInDivWidDivId($("#"+formId).closest('div .div_iframe').attr("id"),url);
}
function containerLoadUrlUseAjaxPostInDivWidDivId(divId,url){
	//alert(111111+url);
	var spinner = new Spinner().spin(document.getElementById(divId));
	$.ajax({ 
		type: "post", 
		url: url, 
		data: "a=a",
		success: function(msg){
			//alert(msg);
			try{
				$("#"+divId).html(replaceBeginOfValidateJs(msg));
			}catch(exception){
				alert(exception);
			}
			$("#"+divId).find("a").click(function($e) {
				if (!$(this).hasClass('close')) {
					$e.preventDefault();
				 	
				 	containerLoadUrlUseAjaxInDiv(divId,$(this).attr("href"));
				}
			 	
			 	//loadMenu($(this).attr("href"),gl_now_li);
			});
		}
		});
	
}