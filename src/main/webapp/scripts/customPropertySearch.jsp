   <c:forEach var="v_customProperty" items="${customPropertyList}">
    <div class="form-group row-list-form-group">
 		<div class="input-group nopadding">
   			<div class="input-group-addon row-form-search-label">${v_customProperty.propertyName}</div>
   			
   				
        		
    			<c:if test="${v_customProperty.valueType=='AVB' || v_customProperty.valueType=='AVC'  || v_customProperty.valueType=='AVD' ||  v_customProperty.valueType=='AVH' }">
        			<c:if test="${empty customPropertyValue[v_customProperty.propertyCode]}">
	        			<form:input path="customPropertyValue['${v_customProperty.propertyCode}']" maxlength="100" 
	        			  class="form-control form-input-init-null row-form-search-input" id="customPropertyMap_${v_customProperty.propertyCode}"/>
	        		</c:if>
	        		<c:if test="${!empty customPropertyValue[v_customProperty.propertyCode]}">
	        			<form:input path="customPropertyValue['${v_customProperty.propertyCode}']" maxlength="100" 
	        			 class="form-control row-form-search-input" id="customPropertyMap_${v_customProperty.propertyCode}"/>
	        		</c:if>     
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVF'}">
	        			            	
	            	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="customPropertyValue_${v_customProperty.propertyCode}" 
        			name="customPropertyValue['${v_customProperty.propertyCode}']" value="${customPropertyValue[v_customProperty.propertyCode]}" propertyCode="${v_customProperty.propertyCode}" 
        			multiple="true" type="100"  cssStyle="width:200px"/>
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVA'}">
	        		<form:checkbox path="customPropertyValue['${v_customProperty.propertyCode}']" cssClass="checkbox" value="true"/>
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVG'}">
	        		<form:input path="customPropertyValue['${v_customProperty.propertyCode}']" size="11" title="date" datepicker="true" class="form-control row-form-search-input"  id="customPropertyValue_${v_customProperty.propertyCode}"/>
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVE'}">
	        		<form:textarea path="customPropertyValue['${v_customProperty.propertyCode}']" rows="5" cols="30" class="form-control row-form-search-input"  id="customPropertyValue_${v_customProperty.propertyCode}"/>
	        	</c:if>
			</div>
		</div>
    
    
	</c:forEach>
	