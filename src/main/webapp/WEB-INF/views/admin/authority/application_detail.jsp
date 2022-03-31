<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/31
  Time: 18:00
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
    <title>慈善捐助系统后台管理</title>
    <style>
        .article-label {
            font-weight: bold;
            font-size: 20px;
            display: block;
            padding: 9px 15px;
            line-height: 20px;
            text-align: left;
        }
        .article-value {
            font-size: 18px;
            display: block;
            padding: 9px 15px;
            text-align: left;
        }
    </style>
</head>
<body class="layui-layout-body">
<jsp:include page="./layout/index.jsp" flush="true"></jsp:include>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">

        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md-12">
<%--                    <div class="layui-card">--%>
<%--                        <div class="layui-card-header">项目详情</div>--%>
<%--                        <div class="layui-card-body" style="padding: 15px;">--%>
<%--                            <div class="layui-form-item layui-row">--%>
<%--                                <div class="layui-col-md3">--%>
<%--                                    <div class="article-label">今天周几？</div>--%>
<%--                                </div>--%>
<%--                                <div class="layui-col-md9">--%>
<%--                                    <div class="article-value">今天周一</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="layui-form-item layui-row">--%>
<%--                                <div class="layui-col-md3">--%>
<%--                                    <div class="article-label">今天周几？</div>--%>
<%--                                </div>--%>
<%--                                <div class="layui-col-md9">--%>
<%--                                    <div class="article-value">今天周一</div>--%>
<%--                                </div>--%>
<%--                            </div>                            <div class="layui-form-item layui-row">--%>
<%--                            <div class="layui-col-md3">--%>
<%--                                <div class="article-label">今天周几？</div>--%>
<%--                            </div>--%>
<%--                            <div class="layui-col-md9">--%>
<%--                                <div class="article-value">今天周一</div>--%>
<%--                            </div>--%>
<%--                        </div>                            <div class="layui-form-item layui-row">--%>
<%--                            <div class="layui-col-md3">--%>
<%--                                <div class="article-label">今天周几？</div>--%>
<%--                            </div>--%>
<%--                            <div class="layui-col-md9">--%>
<%--                                <div class="article-value">今天周一</div>--%>
<%--                            </div>--%>
<%--                        </div>                            <div class="layui-form-item layui-row">--%>
<%--                            <div class="layui-col-md3">--%>
<%--                                <div class="article-label">今天周几？</div>--%>
<%--                            </div>--%>
<%--                            <div class="layui-col-md9">--%>
<%--                                <div class="article-value">今天周一</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>
                <div class="layui-col-md-12">
            <div class="layui-card">
                <div class="layui-card-header">善款去向</div>
                <div class="layui-card-body">
                    <div style="padding-bottom: 10px;">
                        <button class="layui-btn layuiadmin-btn-list" data-type="add" id="add">添加</button>
                    </div>
                    <ul class="layui-timeline">
                        <c:forEach items="${traces}" var="trace" varStatus="status">
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis"></i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">${trace.timeString}   <span class="trace-title">${trace.title}</span>&nbsp;&nbsp;&nbsp;<a href="javascript:;"><i class="layui-icon layui-icon-edit" data-id="${trace.id}" data-index="${status.index}"></i></a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/authority/deleteTrace?id=${trace.id}"><i class="layui-icon layui-icon-delete" data-id="1"></i></a></h3>
                                <div class="trace-content">${trace.content}</div>
                            </div>
                        </li>
                        </c:forEach>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis"></i>
                            <div class="layui-timeline-content layui-text">
                                <div class="layui-timeline-title">过去</div>
                            </div>
                        </li>
                    </ul>

                </div>
            </div>
                </div>
        </div>
        </div>
    </div>
</div>

    <jsp:include page="./layout/footer.jsp"></jsp:include>
    <div id="layui-container" style="display: none">
        <div class="layui-card">
            <div class="layui-card-body" style="padding: 15px;">
                <form class="layui-form" action="" lay-filter="component-form-group">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="标题" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">内容</label>
                            <div class="layui-input-block">
                                <textarea name="content" id="content"></textarea>
                            </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <script>
        layui.config({
            base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
        }).extend({
            index: 'lib/index', //主入口模块
        }).use(['index', 'form','layedit', 'table'], function () {
            var $ = layui.$
                ,table = layui.table
                ,layer = layui.layer
                , form = layui.form;
            var layedit = layui.layedit;

            $('.layui-icon-edit').on('click', function(d){
                var traceId = $(this).data('id');
                var index = $(this).data('index');
                layer.config({
                    skin: 'layui-layer-molv'
                })
                var old_title = $($('.trace-title')[index]).text();
                var old_content = $($('.trace-content')[index]).html();
                $('#content').val(old_content);
                var title = $('input[name="title"]');
                title.val(old_title);
                layer.open({
                    type: 1
                    ,title: '编辑去向'
                    ,content: $('#layui-container')
                    ,area:['960px','540px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){
                        var title = $('input[name="title"]');
                        var content = layedit.getContent(editor);
                        $.ajax({
                            method:"post",
                            url:"${pageContext.request.contextPath}/authority/editTrace",
                            data:{
                                id:traceId,
                                title:title.val(),
                                content:content,
                                applicationId:${application.id}
                            },
                            success:function (data) {
                                if (data.code == 0) {
                                    layer.msg("修改成功",{icon:1},function () {
                                        window.location.reload();
                                    });
                                }else {
                                    layer.msg("服务器错误",{icon:2});
                                }
                            },
                            error:function (data) {
                                layer.msg("请求失败",{icon:2});

                            },
                        })
                    }
                });
                editor = layedit.build('content',{
                    uploadImage : {
                        url:"${pageContext.request.contextPath}/upload/img",
                        type: "POST",
                        base_url:"${pageContext.request.contextPath}"
                    }
                }) //建立编辑器

            })


            $('#add').on('click', function(d){
                layer.config({
                    skin: 'layui-layer-molv'
                })
                //模态框清空
                $('#content').val('');
                $('input[name="title"]').val('');

                layer.open({
                    type: 1
                    ,title: '新增去向'
                    ,content: $('#layui-container')
                    ,area:['960px','540px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){
                        var title = $('input[name="title"]');
                        var content = layedit.getContent(editor);
                        $.ajax({
                            method:"post",
                            url:"${pageContext.request.contextPath}/authority/addTrace",
                            data:{
                                title:title.val(),
                                content:content,
                                applymentId:${application.id}
                            },
                            success:function (data) {
                                if (data.code == 0) {
                                    layer.msg("添加成功",{icon:1},function () {
                                        window.location.reload();
                                    });
                                }else {
                                    layer.msg("服务器错误",{icon:2});
                                }
                            },
                            error:function (data) {
                                layer.msg("请求失败",{icon:2});

                            }
                        })
                    }
                });
                editor = layedit.build('content',{
                    uploadImage : {
                        url:"${pageContext.request.contextPath}/upload/img",
                        type: "POST",
                        base_url:"${pageContext.request.contextPath}"
                    }
                }) //建立编辑器
            })

        })

    </script>
</body>
</html>
