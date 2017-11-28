<%--
  Created by IntelliJ IDEA.
  User: zsc
  Date: 2017/11/28
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        function doLogin(){
            $.post("login",$("#loginForm").serialize(),function(data){
                if(data=="true"){
                    alert("登录成功!");
                    location="information";
                }else{
                    alert("登录失败!");
                }
            });
        }
    </script>
</head>
<body>
<form action="" method="post" id="loginForm">
    <table>
        <tbody>
        <tr>
            <th>用户名：</th><td><input name="username"/></td>
        </tr>
        <tr>
            <th>密码：</th><td><input name="password" type="password"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="button" value="登录" onclick="doLogin()"/><input type="reset" value="重置"/></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
