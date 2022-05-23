<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="phy" uri="/WEB-INF/tlds/common.tld" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://taewonyoon.github.io/developerLib/script.js"></script>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<!--  
<script>
	$(document).ready(function() {
		var admin = '${admin}';
		if(admin != '') {
			var name = '${admin.name}';
			var department = '${admin.department}';
			var position = statusVal(department,'1,2,3,9','인턴,선임,책임,대표');
			var user = name + '('+ position + ')';
		}
		$("#user").text(user);
	})
</script>
 -->
<body>
    <header class="header">
        <div>
            <div class="logo" ><img src="${resources}/img/phylogo.png" style="width:150px;height:55px;"></div>
            <div class="user">
            	<b id="user">
            		${admin.name}(${phy:keyVal(admin.department,"1,2,3,9","인턴,선임,책임,대표")})
            	</b>님
            	
           		환영합니다.
         	</div>
        </div>
    </header>
    