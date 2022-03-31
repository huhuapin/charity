<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/1
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <title>慈善捐助系统个人中心</title>
</head>
<body class="layui-layout-body">
<jsp:include page="./layout/index.jsp" flush="true"></jsp:include>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">设置我的资料</div>
                        <div class="layui-card-body" pad15>
                            <form action="${pageContext.request.contextPath}/donor/setInfo" method="post" class="layui-form" lay-filter="">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="name" class="layui-input" value="${user.name}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">职业</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="career" value="${object.career}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="email" value="${object.email}" lay-verify="email" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="0" title="男" <c:if test="${object.sex == 0}"> checked </c:if> >
                                        <input type="radio" name="sex" value="1" title="女" <c:if test="${object.sex == 1}"> checked </c:if> >
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">出生日期</label>
                                    <div class="layui-input-inline">
                                        <input name="birthday" lay-verify="required" id="birthday" value="${object.getStringDate()}" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">地址</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="address" value="${object.address}" autocomplete="off" class="layui-input" >
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="tel" value="${object.tel}" lay-verify="phone" autocomplete="off" class="layui-input">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp" flush="true"></jsp:include>

<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form','laydate'],function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#birthday'
        });
        var n = layui.form;
        n.verify({
            nickname: function (t, i) {
                return new RegExp("^[a-zA-Z0-9_一-龥\\s·]+$").test(t) ? /(^\_)|(\__)|(\_+$)/.test(t) ? "用户名首尾不能出现下划线'_'" : /^\d+\d+\d$/.test(t) ? "用户名不能全为数字" : void 0 : "用户名不能有特殊字符"
            }, pass: [/^[\S]{6,12}$/, "密码必须6到12位，且不能出现空格"], repass: function (t) {
                if (t !== i("#LAY_password").val()) return "两次密码输入不一致"
            }
        })
    });
</script>
</body>
</html>
