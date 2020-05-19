<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<jsp:directive.include file="includes/top.jsp" />


<div class="box" id="login">
    <div class="row">
        <div class="col-lg-4 offset-lg-4">
            <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
                
             
                <div class="card bg-blue-lighter border-0 shadow-lg">
                    <div class="card-body">
                        <fieldset>
                            <legend class="text-center">
                                <span class="text-uppercase font-weight-bold"><spring:message code="login.legend" /></span>
                            </legend>

                            <div class="text-center mb-2">
                                <img src="<c:url value="/img/profil.png" />">
                            </div>

                            <div class="my-3">
                                <div class="profile-decorator"></div>
                            </div>

                               <form:errors path="*" id="msg" cssClass="invalid-feedback d-block my-3 text-center" element="div" htmlEscape="false" />


                            <div class="px-5">
                                <%--Username--%>
                                <div class="form-group">
                                    <form:label path="username" cssClass="sr-only"><spring:message code="screen.welcome.label.netid" /></form:label>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.openIdLocalId}">
                                            <strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
                                            <input type="hidden" id="username" name="username" value="<c:out value="${sessionScope.openIdLocalId}" />" />
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message code="login.username.placeholder" var="userNamePlaceholder" />
                                            <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                                            <form:input path="username" cssClass="form-control" cssErrorClass="form-control is-invalid" placeholder="${userNamePlaceholder}" tabindex="1" accesskey="${userNameAccessKey}" autocomplete="off" htmlEscape="true" />

                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <%--Password--%>
                                <div class="form-group">
                                    <form:label path="password" cssClass="sr-only"><spring:message code="screen.welcome.label.password" /></form:label>
                                    <spring:message code="login.password.placeholder" var="passwordPlaceholder" />
                                    <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                                    <form:password path="password" cssClass="form-control" cssErrorClass="form-control is-invalid" placeholder="${passwordPlaceholder}" tabindex="2"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                                    <span id="capslock-on" class="form-text" style="display:none;"><spring:message code="screen.capslock.on" /></span>

                                </div>
                            </div>

                            <div class="text-center">
                                <a href="#" target="popup" onclick="window.open('/portal/portal/default/change-password','popup','width=800,height=600'); return false;" class="text-dark">
                                    <span><spring:message code="password.forgotten" /></span>
                                </a>
                            </div>
                            
 
                            <spring:eval expression="@casProperties['pronote.cas.newAccountUrl']" var="newAccountUrl"/>
                            
                            <c:if test="${not empty newAccountUrl}">

	                            <div class="px-5">
	                                <hr class="my-2">
	                            </div>
	
	
	                            <div class="text-center">
	                               <a href="<c:out value="${newAccountUrl}" />" class="text-dark">
	                                    <span><spring:message code="create.account" /></span>
	                               </a>
                                </div>
                            </c:if>                            
                        </fieldset>
                    </div>

                    <div>
                        <button type="submit" name="submit" class="btn btn-secondary btn-lg btn-block rounded-0" accesskey="l" tabindex="6">
                            <span class="text-uppercase font-weight-bold"><spring:message code="screen.welcome.button.login" /></span>
                        </button>
                    </div>
                </div>

                <input type="hidden" name="lt" value="${loginTicket}" />
                <input type="hidden" name="execution" value="${flowExecutionKey}" />
                <input type="hidden" name="_eventId" value="submit" />
            </form:form>
        </div>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp" />
