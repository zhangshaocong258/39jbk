<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/29
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="user" value="${sessionScope.loginSession}"/>
<html>
<head>
    <title>case</title>
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
            background: url("<c:url value='/static/img/病例背景s.png'/>");
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
    <script type="text/javascript">
        function doTrain() {
            $.get("train", $("#train").serialize(), function (data) {
                if (data == "true") {
                    alert("训练成功!");
                    location = "information";
                } else {
                    alert("训练失败");
                }
            });
        }
    </script>

</head>
<body>
<div style="margin:0 auto; margin-top: 80px; width:970px">
    <div class="box">
    <div style="position:absolute;left:10px;top:5px">
        <a href="information"><img src=<c:url value='/static/img/返回.png'/>/></a>
    </div>

    <div style="overflow:auto;position:absolute;left:55px;top:166px;height:500px;width:900px;">
        <table class="table table-condensed">
            <c:forEach items="${discases}" var="discase">
                <form name="myForm" class="form-horizontal" action="handler" method="get">
                    <input type="hidden" name="id" value="${discase.id}">
                    <tr>
                        <td><input style="width: 200px" type="text" name="info" value="${discase.info}">
                            <br>
                            <input style="width: 500px" type="text" name="medicalHis" value="${discase.medicalHis}">
                            <br>
                            <input style="width: 500px" type="text" name="examine" value="${discase.examine}">
                            <br>
                            <input style="width: 200px" type="text" name="disease" value="${discase.disease}">
                            <br>
                            <button class="btn btn-primary" type="submit" name="act" value="edit">修改</button>
                            <button class="btn btn-danger" type="submit" name="act" value="del">删除</button>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
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
    <form action="" method="get" id="train">
        <input type="hidden" name="train" value="train">
        <div style="position:absolute;left:60px;top:706px">
            <input class="btn btn-primary" type="button" value="训练模型" onclick="doTrain()">
        </div>
    </form>
</div>
    </div>
</body>
</html>
