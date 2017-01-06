    <%-- <c:forEach var="v_fixedProperty" items="${fixedPropertyList}">
    <div class="form-group">    
       <label class="col-sm-3 col-md-3 col-lg-2 control-label">${v_fixedProperty.propertyName}</label> 
        <div class="col-sm-9 col-md-9 col-lg-6">
        	
        	<c:if test="${v_fixedProperty.valueType=='1CA'}">
        		<form:select path="${v_fixedProperty.propertyCode}"  class="form-control">
                <c:if test="${!v_fixedProperty.required }">
            	<form:option value=""><fmt:message key="title.select.pleaseselect"/></form:option>
            	</c:if>
                <c:forEach var="v_list" items="${fixedPropertyEnumMap[v_fixedProperty.propertyCode]}">
                	<c:if test="${v_fixedProperty.defaultValue==v_list}">
                	<form:option value="${v_list}" selected="selected">${v_list}</form:option>
                	</c:if>
                	<c:if test="${v_fixedProperty.defaultValue!=v_list}">
                	<form:option value="${v_list}" >${v_list}</form:option>
                	</c:if>
            	</c:forEach>
            	</form:select>
        	</c:if>
        	<c:if test="${v_fixedProperty.valueType=='1CB'}">
        		<form:select path="${v_fixedProperty.propertyCode}.fullValue"  class="form-control">
                <c:if test="${!v_fixedProperty.required }">
            	<form:option value=""><fmt:message key="title.select.pleaseselect"/></form:option>
            	</c:if>
                <c:forEach var="v_list" items="${fixedPropertyEnumMap[v_fixedProperty.propertyCode]}">
                	<c:if test="${v_fixedProperty.defaultValue==v_list}">
                	<form:option value="${v_list}" selected="selected">${v_list}</form:option>
                	</c:if>
                	<c:if test="${v_fixedProperty.defaultValue!=v_list}">
                	<form:option value="${v_list}" >${v_list}</form:option>
                	</c:if>
            	</c:forEach>
            	</form:select>
        	</c:if>        	
        	<c:if test="${v_fixedProperty.valueType=='1CC'}">
        		<form:select path="${v_fixedProperty.propertyCode}.fullValue"  class="form-control">
                <c:if test="${!v_fixedProperty.required }">
            	<form:option value=""><fmt:message key="title.select.pleaseselect"/></form:option>
            	</c:if>
                <c:forEach var="v_list" items="${fixedPropertyEnumMap[v_fixedProperty.propertyCode]}">
                	<c:if test="${v_fixedProperty.defaultValue==v_list}">
                	<form:option value="${v_list}" selected="selected">${v_list}</form:option>
                	</c:if>
                	<c:if test="${v_fixedProperty.defaultValue!=v_list}">
                	<form:option value="${v_list}" >${v_list}</form:option>
                	</c:if>
            	</c:forEach>
            	</form:select>
        	</c:if>        	
        </div>
    </div>
	</c:forEach> --%>
	
    <c:forEach var="v_customProperty" items="${customPropertyList}">
    <div class="form-group">    
       <label class="col-sm-3 col-md-3 col-lg-2 control-label">${v_customProperty.propertyName}</label> 
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<c:if test="${v_customProperty.valueType=='AVB' || v_customProperty.valueType=='AVC'  || v_customProperty.valueType=='AVD' ||  v_customProperty.valueType=='AVH' }">
        		<c:if test="${empty customPropertyMap['${v_customProperty.propertyCode}']}">
        			<form:input path="customPropertyMap['${v_customProperty.propertyCode}']" maxlength="100" 
        			value="${v_customProperty.defaultValue}" class="form-control input-sm" id="customPropertyMap_${v_customProperty.propertyCode}"/>
        		</c:if>
        		<c:if test="${!empty customPropertyMap['${v_customProperty.propertyCode}']}">
        			<form:input path="customPropertyMap['${v_customProperty.propertyCode}']" maxlength="100" 
        			 class="form-control input-sm" id="customPropertyMap_${v_customProperty.propertyCode}"/>
        		</c:if>        		
        	</c:if>
        	<c:if test="${v_customProperty.valueType=='AVF'}">
            	
            	<c:if test="${v_customProperty.required || v_customProperty.multiple}">
            		<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="customPropertyMap_${v_customProperty.propertyCode}" 
        			name="customPropertyMap['${v_customProperty.propertyCode}']" value="${customPropertyMap['${v_customProperty.propertyCode}']}" propertyCode="${v_customProperty.propertyCode}" 
        			multiple="${v_customProperty.multiple}" type="100" pleaseSelect="false" />
            	</c:if>
            	<c:if test="${!v_customProperty.required && !v_customProperty.multiple}">
            		<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="customPropertyMap_${v_customProperty.propertyCode}" 
        			name="customPropertyMap['${v_customProperty.propertyCode}']" value="${customPropertyMap['${v_customProperty.propertyCode}']}" propertyCode="${v_customProperty.propertyCode}" 
        			multiple="${v_customProperty.multiple}" type="100" pleaseSelect="true" />
            	</c:if>
            	
        	</c:if>
        	<c:if test="${v_customProperty.valueType=='AVA'}">
        		<form:checkbox path="customPropertyMap['${v_customProperty.propertyCode}']" cssClass="checkbox" value="true"/>
        	</c:if>
        	<c:if test="${v_customProperty.valueType=='AVG'}">
        		<form:input path="customPropertyMap['${v_customProperty.propertyCode}']" size="11" title="date" datepicker="true" class="form-control input-sm"  id="customPropertyMap_${v_customProperty.propertyCode}"/>
        	</c:if>
        	<c:if test="${v_customProperty.valueType=='AVE'}">
        		<form:textarea path="customPropertyMap['${v_customProperty.propertyCode}']" rows="5" cols="30" class="form-control"  id="customPropertyMap_${v_customProperty.propertyCode}"/>
        	</c:if>        	      
        </div>
    </div>
	</c:forEach>