<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/1
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <div class="layui-form" lay-filter="">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">我的角色</label>
                                    <div class="layui-input-inline">
                                        <select name="role" lay-verify="">
                                            <option value="1" selected>超级管理员</option>
                                            <option value="2" disabled>普通管理员</option>
                                            <option value="3" disabled>审核员</option>
                                            <option value="4" disabled>编辑人员</option>
                                        </select>
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">用户名</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="username" value="xianxin" readonly class="layui-input">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">昵称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="nickname" value="贤心" lay-verify="nickname" autocomplete="off" placeholder="请输入昵称" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="男" title="男">
                                        <input type="radio" name="sex" value="女" title="女" checked>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">头像</label>
                                    <div class="layui-input-inline">
                                        <input name="avatar" lay-verify="required" id="LAY_avatarSrc" placeholder="图片地址" value="http://cdn.layui.com/avatar/168.jpg" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline layui-btn-container" style="width: auto;">
                                        <button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
                                            <i class="layui-icon">&#xe67c;</i>上传图片
                                        </button>
                                        <button class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="cellphone" value="" lay-verify="phone" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="email" value="" lay-verify="email" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">备注</label>
                                    <div class="layui-input-block">
                                        <textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                                    </div>
                                </div>
                            </div>

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
    }).use(['index', 'set']);
</script>
</body>
</html>