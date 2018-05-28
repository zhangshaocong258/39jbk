<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/28
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="user" value="${sessionScope.loginSession}"/>

<html>
<head>
    <title>message</title>
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <style>
        body {
            text-align: center
        }
    </style>
    <style>
        .box {
            background: url("<c:url value='/static/img/个人信息背景s.png'/>");
            width: 970px;
            height: 785px;
            /*display: table-cell;*/
            /*!* 水平居中 *!*/
            /*text-align:center;*/
            /*!* 垂直居中 *!*/
            /*vertical-align:middle;*/
            position: relative;
            /*border: 1px solid #f40;*/
        }
    </style>
</head>
<body>
<div style="margin:0 auto; margin-top: 80px; width:970px">

    <div class="box">
    <div style="position:absolute;left:10px;top:5px">
        <a href="information"><img src=<c:url value='/static/img/返回.png'/>/></a>
    </div>
    <div class="dropdown" style="position:absolute;right:0px;top: 6px">
        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="true">${user.userName}<span class="caret"></span></button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <li><a href="message"><span class="glyphicon glyphicon-user"
                                        aria-hidden="true"/>&thinsp;个人资料</a></li>
            <li><a href="exit"><span class="glyphicon glyphicon-log-out"
                                     aria-hidden="true"/>&thinsp;退出</a></li>
        </ul>
    </div>
    <div style="position:absolute;left:114px;top:151px">
        <h3 style="color:#666666">${user.userName}</h3>
    </div>
    <div style="position:absolute;left:114px;top:211px">
        <h3 style="color:#666666">${user.realName}</h3>
    </div>
    <div style="position:absolute;left:114px;top:273px">
        <h3 style="color:#666666">${user.userAge}</h3>
    </div>
    <div style="position:absolute;left:114px;top:333px">
        <h3 style="color:#666666">${user.userAddr}</h3>
    </div>
    <div style="position:absolute;left:114px;top:400px">
        <c:choose><c:when test="${privilege == 'admin'}"><h3 style="color:#666666">管理员</h3></c:when><c:otherwise><h3
                style="color:#666666">普通用户</h3></c:otherwise></c:choose>
    </div>
    <c:if test="${privilege == 'admin'}">
        <div style="position:absolute;left:50px;top:540px">
            <a class="btn btn-primary" href="discase">查看所有病例</a>
        </div>
    </c:if>
    <c:if test="${privilege == 'admin'}">
        <div style="position:absolute;left:160px;top:540px">
            <a class="btn btn-success" href="newcase">新增病例</a>
        </div>
    </c:if>

</div>
    </div>

</body>
</html>
