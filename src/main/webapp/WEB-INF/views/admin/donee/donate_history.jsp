<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/1
  Time: 15:40
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
            <div class="layui-card">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    受赠历史
                </div>

                <div class="layui-card-body">
                    <table id="LAY-app-content-list" lay-filter="LAY-app-content-list"></table>
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
        index: 'lib/index', //主入口模块
    }).use(['index', 'form', 'table'], function () {
        var table = layui.table
            , form = layui.form;

        var data = ${donates};
        //第一个实例
        table.render({
            elem: '#LAY-app-content-list'
            ,data : data
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID',width:80, sort: true, fixed: 'left'}
                ,{field: 'application_name', title: '事件'}
                ,{field: 'authority_name', width:180,title: '慈善机构', templet:function () {
                        return '${authorityName}'
                    }}
                ,{field: 'money',title:"金额"}
                ,{field: 'message', title: '留言'}
                ,{field: 'prove', title: '证明',templet:function (d) {
                        return'<img src="${pageContext.request.contextPath}'+d.prove+'">'
                    }}
                ,{field: 'date', title: '时间'}
                ,{field: 'status', title: '状态', templet : function (d) {
                        // <button class="layui-btn layui-btn-xs">已发布</button>
                        // <button class="layui-btn layui-btn-primary layui-btn-xs">待修改</button>
                        if (d.status == 1)
                            return "已审核"
                        else
                            return "未审核"
                    }}
            ]]
        })

    });
</script>
</body>
</html>
