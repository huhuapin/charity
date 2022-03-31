<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/4
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/login.css" media="all">
</head>
<style>

    html, body {width: 100%;height: 100%;overflow: hidden}
    body {background: #009688;}
    body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
    .layui-container {width: 100%;height: 100%;overflow: hidden}
    .admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
    .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
    .logo-title h1 {color:#009688;font-size:25px;font-weight:bold;}
    .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
    .login-form .layui-form-item {position:relative;}
    .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
    .login-form .layui-form-item input {padding-left:36px;}
    .captcha {width:60%;display:inline-block;}
    .captcha-img {display:inline-block;width:34%;float:right;}
    .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
</style>
<body>
<div class="layui-container layui-anim layui-anim-upbit"><canvas class="pg-canvas" width="1889" height="403"></canvas>
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="layui-form-item logo-title">
                    <h1>慈善捐助系统后台登录</h1>
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username" for="username"></label>
                    <input id="username" type="text" name="username" lay-verify="required|account" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" id="password" name="password" lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-vercode" for="captcha"></label>
                    <%--                    <input type="text" name="captcha" id="captcha" lay-verify="required|captcha" placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" value="xszg">--%>
                    <input type="text" name="captcha" id="captcha"  placeholder="图形验证码" autocomplete="off" class="layui-input verification captcha" value="">
                    <div class="captcha-img">
                        <img id="captchaPic" src="${pageContext.request.contextPath}/user/checkCode">
                    </div>
                </div>
                <div class="layui-form-item">
                    <%--                    <input type="checkbox" name="rememberMe" value="true" lay-skin="primary" title="记住密码"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>记住密码</span><i class="layui-icon layui-icon-ok"></i></div>--%>
                    <a href="${pageContext.request.contextPath}/user/register" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.particleground.min.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;


        // 粒子线条背景
        $(document).ready(function(){
            $('.layui-container').particleground({
                dotColor:'#5cbdaa',
                lineColor:'#5cbdaa'
            });
        });

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            if (data.username == '') {
                layer.msg('用户名不能为空');
                return false;
            }
            if (data.password == '') {
                layer.msg('密码不能为空');
                return false;
            }
            if (data.captcha == '') {
                layer.msg('验证码不能为空');
                return false;
            }
        });

        $("#captchaPic").click(function () {
            var t = new Date();
            var time = t.getTime();
            $(this).attr("src","${pageContext.request.contextPath}/user/checkCode?t="+time);
        })
    });
</script>

</body>
</html>