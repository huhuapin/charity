<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/30
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <title>慈善捐助系统后台管理</title>
    <style>
        img{
            max-width: 100%;
        }
    </style>
</head>
<body class="layui-layout-body">
<jsp:include page="./layout/index.jsp" flush="true"></jsp:include>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">

        <div class="layui-fluid">
            <div class="layui-col-md6 layui-col-md-offset3">
                <div class="layui-card">
                    <div class="layui-card-header">修改机构信息</div>
                    <div class="layui-card-body" style="padding: 15px;">
                        <form class="layui-form" action="${pageContext.request.contextPath}/root/updateAuthority" lay-filter="component-form-group" method="post">
                            <input type="hidden" name="id" value="${authority.get("id")}">
                            <input type="hidden" name="user_id" value="${authority.get("user_id")}">
                            <div class="layui-form-item">
                                <label class="layui-form-label">机构名</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" lay-verify="required" placeholder="请输入机构名" autocomplete="off" class="layui-input" value="${authority.get("name")}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-form-inline">
                                    <label class="layui-form-label">注册资金</label>
                                    <div class="layui-input-inline">
                                        <input type="number" name="found" lay-verify="required" autocomplete="off" class="layui-input" value="${authority.get("found")}">
                                    </div>
                                </div>
                                <div class="layui-form-inline">
                                    <label class="layui-form-label">注册规模</label>
                                    <div class="layui-input-inline">
                                        <input type="number" name="people" lay-verify="required" autocomplete="off" class="layui-input" value="${authority.get("people")}">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">机构logo</label>
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                                    <div class="layui-upload-list">
                                                <input type="hidden" name="img" class="layui-upload-file" value="${authority.get("img")}">
                                                <img class="layui-upload-img" id="demo1" src="${pageContext.request.contextPath}${authority.get("img")}">
                                        <p id="demoText"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-form-inline">
                                    <label class="layui-form-label">联系方式</label>
                                    <div class="layui-input-inline">
                                        <input type="tel" name="tel" lay-verify="required|phone"  autocomplete="off" class="layui-input" value="${authority.get("tel")}">
                                    </div>
                                </div>
                                <div class="layui-form-inline">
                                    <label class="layui-form-label">地址</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="address" autocomplete="off" class="layui-input" value="${authority.get("address")}">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">法人</label>
                                <div class="layui-input-block">
                                    <input type="text" name="represent" placeholder="" autocomplete="off" class="layui-input" value="${authority.get("represent")}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">成立时间</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="LAY-component-form-group-date" lay-verify="date" name="createdTime" placeholder="成立时间" autocomplete="off" class="layui-input" value="${fn:substring(authority.get("created_time"), 0, 10)}">
                                </div>
<%--                                <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>--%>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">机构介绍</label>
                                <div class="layui-input-block">
                                    <textarea name="description" id="description">${authority.get("description")}</textarea>
                                </div>
                                <%--                                <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>--%>
                            </div>
                            <div class="layui-form-item layui-layout-admin">
                                <div class="layui-input-block">
                                    <div class="layui-footer" style="left: 0;">
                                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即修改</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'laydate','layedit','upload'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
            ,form = layui.form;
        var layedit = layui.layedit;
        layedit.build('description') //建立编辑器

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date'
        });

        //图片上传
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '${pageContext.request.contextPath}/upload/img' //上传接口
            ,done: function(data){
                //上传完毕回调
                console.log(data);
                if (data.code == 0) {
                    $('#demo1').attr("src","${pageContext.request.contextPath}"+data.data.src);
                    console.log(this.item);
                    $("input[name='img']").val(data.data.src);
                    layer.msg(data.message,{icon:1});
                } else{
                    layer.msg(data.message,{icon:1});
                }
            }
            ,error: function(){
                //请求异常回调
            }
        });








        /* 自定义验证规则 */
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

    });
</script>
</body>
</html>
