
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

var gl_now_li=null;
function loadMenu(url,v){
	//jQuery("#content").load(url);
	$("#breadcrumb").find("a").remove();
	
	$(v).parents("li").each(function( index ) {
			//alert($(this).find("a:first").text().split('\n')[0]);
			$("#breadcrumb").prepend("<a href='#' class='current'>"+$(this).find("a:first").text()+"</a>");
	});
	$("#breadcrumb").prepend("<a href='#' title='Go to Home' class='current'><i class='icon-home'></i> 首页</a>");
	
	gl_now_li=v;
	
	containerLoadUrlUseAjaxInDivWidDivId("containerL1",url);
	
	jQuery(v).parent().parent().parent().parent().find("li").removeClass("active");
	jQuery(v).parent().addClass("active");
	
	
}
//replace validate
function replaceBeginOfValidateJs(str){
//	str=str.replace("<!-- Begin ","<!-- ");
	//str=str.replace("//End --> "," -->");
	
	return str;
}
function containerLoadUrlUseAjaxInDiv(formId,url){
	
	//alert($("#"+formId).closest('div .container').attr("id"));
	containerLoadUrlUseAjaxInDivWidDivId($("#"+formId).closest('div .div_iframe').attr("id"),url);
}
function containerLoadUrlUseAjaxInDivWidDivId(divId,url){
	$.get(url,function(data){ 
		$("#"+divId).html();
		try{
			$("#"+divId).html(replaceBeginOfValidateJs(data));
		}catch(exception){
			alert(exception);
		}
		 $("#"+divId).find("a").click(function($e) {
			 	//loadMenu($(this).attr("href"),v);
			 if (!$(this).hasClass('paginate_button')) {
				 $e.preventDefault();
				 containerLoadUrlUseAjaxInDivWidDivId(divId,$(this).attr("href"));
			 }
			 	
			});	
		 
		 
		});
}

function containerFormSubmitUseAjaxIndiv(formId,formAction){
	
	//alert($("#"+formId).closest('div .container').attr("id"));
	containerFormSubmitUseAjaxIndivByDivId($("#"+formId).closest('div .div_iframe').attr("id"),formId,formAction);
}
function containerFormSubmitUseAjaxIndivByDivId(divId,formId,formAction,paras){
	
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
				if (!$(this).hasClass('paginate_button')) {
					$e.preventDefault();
				 	
				 	containerLoadUrlUseAjaxInDiv(divId,$(this).attr("href"));
				}
			 	
			 	//loadMenu($(this).attr("href"),gl_now_li);
			});
		}
		}); 
}

/*function formSubmitUseAjaxIndiv(divId,formId,formAction,paras){
	$.ajax({ 
		type: "post", 
		url: formAction, 
		data: $("#"+formId).serialize()+"&"+paras,
		success: function(msg){
			//alert(msg);
			$("#"+divId).html(msg);
			$("#"+divId).find("a").click(function($e) {
			 	
			 	$e.preventDefault();
			 	buttonClickOpenUrlIndiv(divId,$(this).attr("href"));
			});
		}
	});
}	
function buttonClickOpenUrlIndiv(divId,url){
	$.get(url,function(data){ 
		//alert("Hello world!");
		$("#"+divId).html(data);
	
		$("#"+divId).find("a").click(function($e) {
			 	
			 	$e.preventDefault();
			 	buttonClickOpenUrlIndiv(divId,$(this).attr("href"));
		});	
		 
	});
	
}*/
