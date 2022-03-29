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
<jsp:directive.include file="includes/top.jsp"/>


<div class="box" id="login">
    <div class="d-flex justify-content-center mb-5">
        <img alt="Cloud PRONOTE" src="<c:url value="/img/logo-cloud-pronote.svg" />">
    </div>

    <div class="row justify-content-center mb-5">
        <div class="col-sm-9 col-md-7 col-lg-5 col-xl-4">
            <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
                <div class="card bg-light border-0 shadow-lg">
                    <div class="card-body">
                        <h1 class="card-title h5 text-center">
                            <span class="text-lowercase font-weight-bold"><spring:message code="login.legend"/></span>
                        </h1>

                        <div class="text-center mb-3">
                            <img alt="" src="<c:url value="/img/enseignant.png" />" height="100">
                        </div>

                        <form:errors path="*" id="msg" cssClass="invalid-feedback d-block my-3 text-center"
                                     element="div" htmlEscape="false"/>

                        <div class="px-3">
                                <%--Username--%>
                            <div class="form-group">
                                <form:label path="username" cssClass="sr-only"><spring:message
                                        code="screen.welcome.label.netid"/></form:label>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.openIdLocalId}">
                                        <strong><c:out value="${sessionScope.openIdLocalId}"/></strong>
                                        <input type="hidden" id="username" name="username"
                                               value="<c:out value="${sessionScope.openIdLocalId}" />"/>
                                    </c:when>
                                    <c:otherwise>
                                        <spring:message code="login.username.placeholder" var="userNamePlaceholder"/>
                                        <spring:message code="screen.welcome.label.netid.accesskey"
                                                        var="userNameAccessKey"/>
                                        <form:input path="username" cssClass="form-control"
                                                    cssErrorClass="form-control is-invalid"
                                                    placeholder="${userNamePlaceholder}" tabindex="1"
                                                    accesskey="${userNameAccessKey}" autocomplete="off"
                                                    htmlEscape="true"/>

                                    </c:otherwise>
                                </c:choose>
                            </div>

                                <%--Password--%>
                            <div class="form-group">
                                <form:label path="password" cssClass="sr-only"><spring:message
                                        code="screen.welcome.label.password"/></form:label>
                                <spring:message code="login.password.placeholder" var="passwordPlaceholder"/>
                                <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey"/>
                                <form:password path="password" cssClass="form-control"
                                               cssErrorClass="form-control is-invalid"
                                               placeholder="${passwordPlaceholder}" tabindex="2"
                                               accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off"/>
                                <span id="capslock-on" class="form-text" style="display:none;"><spring:message
                                        code="screen.capslock.on"/></span>

                            </div>

                            <div class="d-flex justify-content-between flex-wrap mb-3">
                                <div class="mr-3">
                                    <a href="#" target="popup"
                                       onclick="window.open('/portal/content/idx/DEFAULT_CHANGE-PASSWORD','popup','width=800,height=600'); return false;"
                                       class="text-secondary">
                                        <small><spring:message code="password.forgotten"/></small>
                                    </a>
                                </div>

                                <div class="ml-auto">
                                    <spring:eval expression="@casProperties['pronote.cas.newAccountUrl']"
                                                 var="newAccountUrl"/>

                                    <c:if test="${not empty newAccountUrl}">
                                        <a href="<c:out value="${newAccountUrl}" />" class="text-secondary">
                                            <small><spring:message code="create.account"/></small>
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" name="submit" class="btn btn-primary btn-lg rounded-pill"
                                    accesskey="l" tabindex="6">
                                <span class="font-weight-bold"><spring:message
                                        code="screen.welcome.button.login"/></span>
                            </button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="lt" value="${loginTicket}"/>
                <input type="hidden" name="execution" value="${flowExecutionKey}"/>
                <input type="hidden" name="_eventId" value="submit"/>
            </form:form>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5">
            <div class="row align-items-center">
                <div class="col-auto">
                    <img alt="RGPD" src="<c:url value="/img/rgpd.png" />">
                </div>

                <div class="col">
                    <p class="text-black small mb-1">
                        <strong>Utiliser le Cloud PRONOTE c'est&nbsp;:</strong>
                    </p>
                    <ul class="list-marker-green text-green-dark small mb-0">
                        <li>
                            <strong>avoir la garantie de rester propri&eacute;taire de vos documents</strong>
                        </li>
                        <li>
                            <strong>pouvoir cl&ocirc;turer votre compte &agrave; tout moment</strong>
                        </li>
                        <li>
                            <strong>&ecirc;tre assur&eacute; que vos donn&eacute;es personnelles ne seront pas exploit&eacute;es</strong>
                        </li>
                        <li>
                            <strong>pouvoir r&eacute;cup&eacute;rer tout ou partie de vos documents quand vous le souhaitez</strong>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp"/>
