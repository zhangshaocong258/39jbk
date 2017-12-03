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
    <title>登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="static/res/homepage/favicon.ico"/>
    <link href="static/res/ui/css/screen.css" media="screen, projection" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="static/res/ui/css/base.css">
    <link rel="stylesheet" type="text/css" href="static/res/passport/css/login.css">
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.cookie.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            alert("ready")
            if ($.cookie("rmbUser") == "true") {
                $("#chk11").prop("checked", true);
                $("#username").val($.cookie("username"));
                $("#password").val($.cookie("password"));
            }
        });
        function doLogin() {

            if ($("#chk11").prop("checked")) {
                var str_username = $("#username").val();
                var str_password = $("#password").val();
                $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
            }
            else {
                $.cookie("rmbUser", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
            }
            $.post("loginTest", $("#loginForm").serialize(), function (data) {
                if (data == "true") {
//                    alert("登录成功!");
                    location = "information";
                } else {
                    alert("账号或密码错误");
                }
            });
        }
    </script>
    <script type="text/javascript">
        document.onkeydown = function(e){
            if(!e) e = window.event;
            if((e.keyCode || e.which) == 13){
                document.getElementById("input1").click();
            }
        }

    </script>
</head>
<body>

<div class="logina-logo" style="height: 55px">
    <img src="static/res/passport/images/toplogo.png" alt="标题">
</div>
<form action="" method="post" id="loginForm">
    <div class="logina-main main clearfix">
        <div class="tab-con">
                <div id='login-error' class="error-tip"></div>
                <table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <th>账户</th>
                        <td width="245">
                            <input id="username" type="text" name="username" placeholder="用户名" value="">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th>密码</th>
                        <td width="245">
                            <input id="password" type="password" name="password" placeholder="请输入密码" >
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr class="find">
                        <th></th>
                        <td>
                            <div>
                                <label class="checkbox" for="chk11"><input style="height: auto;" id="chk11" type="checkbox" name="remember_me">记住我</label>
                                <%--<a href="passport/forget-pwd">忘记密码？</a>--%>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td width="245"><input id="input1" class="confirm" type="button" value="登  录" onclick="doLogin()"></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
        </div>
        <div class="reg">
            <p>还没有账号？<br>赶快免费注册一个吧！</p>
            <a class="reg-btn" href="register">立即免费注册</a>
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
