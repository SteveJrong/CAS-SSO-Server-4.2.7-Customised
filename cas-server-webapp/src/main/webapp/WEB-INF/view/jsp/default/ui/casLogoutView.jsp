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
  	<div class="panel panel-primary">
  		<div class="panel-heading">
	        	<h3 class="panel-title"><spring:message code="screen.logout.header" /></h3>
	    </div>
		<div class="panel-body">
			<div class="jumbotron">
				<h2><span class="glyphicon glyphicon-ok"></span></h2>
		        <p><spring:message code="screen.logout.success"/></p>
		        <p><spring:message code="screen.logout.security" /></p>
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
