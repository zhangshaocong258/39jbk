<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/28
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-alone">
<head>
    <title>注册</title>
    <link rel="shortcut icon" type="image/x-icon" href="static/res/homepage/favicon.ico"/>
    <link href="static/res/ui/css/screen.css" media="screen, projection" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="static/res/ui/css/base.css">
    <link rel="stylesheet" type="text/css" href="static/res/passport/css/login.css">
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function doLogin() {
            $.post("registerTest", $("#registerForm").serialize(), function (data) {
                if (data == "ok") {
                    alert("注册成功!");
                    location = "login";
                } else if (data == "error1"){
                    alert("用户名已存在");
                } else {
                    alert("前后密码不一致");
                }
            });
        }
    </script>
</head>
<body>

<div class="logina-logo" style="height: 55px">
    <img src="static/res/passport/images/toplogo.png" alt="标题">
</div>
<form action="" method="post" id="registerForm">
    <div class="logina-main main clearfix">
        <div class="tab-con">
            <form id="form-login" method="post" action="passport/ajax-login">
                <div id='login-error' class="error-tip"></div>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <th>账户</th>
                        <td width="245">
                            <input id="email" type="text" name="username" placeholder="用户名" autocomplete="off" value="">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th>密码</th>
                        <td width="245">
                            <input id="password" type="password" name="password" placeholder="请输入密码" autocomplete="off">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th>确认密码</th>
                        <td width="245">
                            <input id="confirmPassword" type="password" name="confirmPassword" placeholder="请输入密码" autocomplete="off">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td width="245"><input class="confirm" type="button" value="立 即 注 册" onclick="doLogin()"></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="reg">
            <p>已有账号？<br>赶快登录吧！</p>
            <a class="reg-btn" href="login">立即登录</a>
        </div>
    </div>
</form>

<div id="footer">
    <div class="copyright">Copyright © 2017 xxx.cn. All Rights Reserved. xxx 版权所有</div>
</div>
<script src="static/res/skin/js/ui.common.js"></script>
<script src="static/res/passport/js/login.js"></script>
</body>
</html>
