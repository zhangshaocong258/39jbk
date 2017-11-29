<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/29
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="user" value="${sessionScope.loginSession}"/>
<html>
<head>
    <title>case</title>
    <link href="<c:url value='/static/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <style>
        body {
            background-image: url(<c:url value='/static/img/病例背景.png'/>);
            background-size: 100%;
            background-position: center;
            background-repeat: no-repeat;
        }
    </style>

</head>
<body>
<div style="position:relative;left:0px;top:0px">

    <div style="position:absolute;left:495px;top:75px">
        <a href="information"><img src=<c:url value='/static/img/返回.png'/>/></a>
    </div>

    <div style="overflow:auto;position:absolute;left:535px;top:240px;width:900px;">
        <table class="table table-condensed">
            <c:forEach items="${discases}" var="discase">
                <form name="myForm" class="form-horizontal" action="handler" method="get">
                    <input type="hidden" name="id" value="${discase.id}">
                    <tr>
                        <td>姓名:</td>
                        <td><input style="width: 80px" type="text" name="name" value="${discase.userName}"></td>
                            <%--<td>性别:</td>--%>
                            <%--<td><input style="width: 80px" type="text" name="discase" value="${discase.userName}"></td>--%>
                            <%--<td>年龄:</td>--%>
                            <%--<td><input style="width: 80px" type="text" name="discase" value="${discase.userName}"></td>--%>
                        <td><button class="btn btn-primary" type="submit" name="act" value="edit">修改</button></td>
                        <td><button class="btn btn-danger" type="submit" name="act" value="del">删除</button></td>
                    </tr>
                </form>
            </c:forEach>
        </table>
    </div>

    <div class="dropdown" style="position:absolute;left:1380px;top:80px">
        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="true">${user.userName}<span class="caret"></span></button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <li><a href="message"><span class="glyphicon glyphicon-user"
                                        aria-hidden="true"/>&thinsp;个人资料</a></li>
            <li><a href="exit"><span class="glyphicon glyphicon-log-out"
                                     aria-hidden="true"/>&thinsp;退出</a></li>
        </ul>
    </div>
    </form>
</div>
</body>
</html>
