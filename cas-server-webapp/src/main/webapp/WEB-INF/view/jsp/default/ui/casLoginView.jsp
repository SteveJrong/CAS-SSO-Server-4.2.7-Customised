<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Steve Jrong CAS Service Portal</title>
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <link rel="icon" href="<c:url value="/favicon.ico" />" type="image/x-icon" />
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">

		<!-- 使用不安全协议时的提示 -->
		<c:if test="${not pageContext.request.secure}">
		    <div id="msg" class="list-group">
		        <h2><spring:message code="screen.nonsecure.title" /></h2>
		        <p><spring:message code="screen.nonsecure.message" /></p>
		    </div>
		</c:if>

		<!-- 登录表单 -->
		<div class="panel panel-primary">
			<div class="panel-heading">
				<!-- 页面欢迎标题 -->
	        	<h3 class="panel-title"><spring:message code="screen.welcome.instructions" /></h3>
	      	</div>
			<div class="panel-body">
				<div class="row">
				    <form:form class="col-md-5" method="post" id="fm1" commandName="${commandName}" htmlEscape="true">

						<!-- 用户名 -->
				        <div class="form-group">
				            <label for="username"><spring:message code="screen.welcome.label.netid" /></label>
				            <c:choose>
				                <c:when test="${not empty sessionScope.openIdLocalId}">
				                    <strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
				                    <input type="hidden" id="username" name="username" value="<c:out value=" ${sessionScope.openIdLocalId}" />" />
				                </c:when>
				                <c:otherwise>
				                    <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
				                    <form:input cssClass="required form-control" cssErrorClass="form-control" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true" />
				                </c:otherwise>
				            </c:choose>
				        </div>

						<!--密码 -->
						<div class="form-group">
					            <label for="password"><spring:message code="screen.welcome.label.password" /></label>

					            <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
					            <form:password cssClass="required form-control" cssErrorClass="form-control" class="form-control" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
					            <span id="capslock-on" style="display:none;"><p><img src="images/warning.png" valign="top"> <spring:message code="screen.capslock.on" /></p></span>
				        </div>

						<!--验证码 -->
				        <div class="form-group">
				        	<div class="form-group">
								<label for="password"><spring:message code="screen.welcome.label.authcode" /></label>
								<div class="clearfix"></div>
								<form:input id="authcode" cssClass="required form-control input-s" cssErrorClass="form-control" size="10" style="width: 66%; float: left;" path="authcode" accesskey="${authcodeAccessKey}" htmlEscape="true" autocomplete="off" />
								<img onclick="this.src='captcha.jpg?'+Math.random()" width="93" height="30" src="captcha.jpg" style="float: right; display: inline-block; border: 2px black solid;" title="点击更换验证码" />
				        	</div>
						</div>

						<div class="clearfix" style="margin: 20px auto;"></div>
						<!-- 表单错误提示信息 -->
						<form:errors path="*" element="div" htmlEscape="false" style="color: red; font-weight: bold;" />
						<div class="clearfix" style="margin: 10px auto;"></div>

						<!-- 表单按钮 -->
				        <div class="form-group">
				            <input type="hidden" name="execution" value="${flowExecutionKey}" />
				            <input type="hidden" name="_eventId" value="submit" />
				            <input class="btn btn-primary" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="6" type="submit" />
				            <input class="btn btn-default" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="7" type="reset" />
				        </div>

				    </form:form>
				</div>
			</div>
		</div>

		<!-- 页脚版权信息 -->
		<footer class="container-fluid foot-wrap">
			<p align="center">&copy; Steve Jrong 2018 Steve Jrong - <a href="https://www.stevejrong.top/">www.stevejrong.top</a></p>
		</footer>
	</div>

	<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>