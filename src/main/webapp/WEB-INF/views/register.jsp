<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/4
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入 - layuiAdmin</title>
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
    .admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:20%;margin-left:-180px;margin-top:-100px;}
    .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
    .logo-title h1 {color:#009688;font-size:25px;font-weight:bold;}
    .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
    /*.login-form .layui-form-item {position:relative;}*/
    /*.login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}*/
    /*.login-form .layui-form-item input {padding-left:36px;}*/
    /*.captcha {width:60%;display:inline-block;}*/
    /*.captcha-img {display:inline-block;width:34%;float:right;}*/
    /*.captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}*/
    .layui-tab-title li {width: auto}
    .layui-tab-title {text-align: center}
</style>
<body>
<div class="layui-container layui-anim layui-anim-upbit"><canvas class="pg-canvas" width="1889" height="403"></canvas>
    <div class="admin-login-background">
        <div class="layui-form login-form">
                <div class="layui-form-item logo-title">
                    <h1>用户注册</h1>
                </div>
                <div class="layui-tab layui-tab-brief layadmin-latestData">
                    <ul class="layui-tab-title">
                        <li class="layui-this">注册成为捐赠者</li>form
                        <li>注册成为受赠者</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <form class="layui-form" action="${pageContext.request.contextPath}/user/register" method="post">
                                <div class="layui-form-item">
                                    <input type="hidden" name="role" value="2">
                                    <label class="layui-form-label" for="username">用户名</label>
                                    <div class="layui-input-block">
                                        <input id="username" type="text" name="username" lay-verify="required|account" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">密码</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="password" lay-verify="required|account" placeholder="请输入密码" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">确认密码</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="password_confirm" lay-verify="required|account" placeholder="请再次输入密码" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">姓名</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="name" lay-verify="required|account" placeholder="请输入真实姓名" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="0" title="男" checked><div class="layui-select layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                                        <input type="radio" name="sex" value="1" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">联系方式</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="tel" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input" value="17855300022">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login_donor">注 册</button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-tab-item">
                            <form class="layui-form" action="${pageContext.request.contextPath}/user/register" method="post">
                                <div class="layui-form-item">
                                    <input type="hidden" name="role" value="2">
                                    <label class="layui-form-label">用户名</label>
                                    <div class="layui-input-block">
                                        <input id="" type="text" name="username" lay-verify="required|account" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">密码</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="password" lay-verify="required|account" placeholder="请输入密码" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">确认密码</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="password_confirm" lay-verify="required|account" placeholder="请再次输入密码" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="name" lay-verify="required|account" placeholder="请输入真实姓名" autocomplete="off" class="layui-input" value="admin">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="0" title="男" checked><div class="layui-select layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                                        <input type="radio" name="sex" value="1" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">联系方式</label>
                                    <div class="layui-input-block">
                                        <input  type="text" name="tel" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input" value="17855300022">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" for="username">慈善机构</label>
                                    <div class="layui-input-block">
                                        <select name="authorityId" lay-search>
                                            <option value="0" disabled>请选择</option>
                                            <c:forEach items="${authorities}" var="authority">
                                                <option value="${authority.get("id")}">${authority.get("name")}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="login_donor">注 册</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.particleground.min.js" charset="utf-8"></script>
<script>

    layui.use(['form','element'], function () {
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
        // form.on('submit(login_donor)', function (data) {
        //     console.log(this)
        //     console.log(data)
        //     data = data.field;
        //     console.log(data);
        //     if (data.username == '') {
        //         layer.msg('用户名不能为空');
        //         return false;
        //     }
        //     if (data.password == '') {
        //         layer.msg('密码不能为空');
        //         return false;
        //     }
        //     if (data.captcha == '') {
        //         layer.msg('验证码不能为空');
        //         return false;
        //     }
        //     return  false;
        // });
    });
</script>

</body>
</html>