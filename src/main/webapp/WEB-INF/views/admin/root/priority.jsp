<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/29
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>优先级审核</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<jsp:include page="./layout/index.jsp"></jsp:include>
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-card">
<%--                <div class="layui-form layui-card-header layuiadmin-card-header-auto">--%>
<%--                    <div class="layui-form-item">--%>
<%--                        <div class="layui-inline">--%>
<%--                            <label class="layui-form-label">机构名称</label>--%>
<%--                            <div class="layui-input-inline">--%>
<%--                                <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="layui-inline">--%>
<%--                            <button class="layui-btn layuiadmin-btn-list" lay-submit--%>
<%--                                    lay-filter="LAY-app-contlist-search">--%>
<%--                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="layui-card-body">
                    <div class="layui-tab layui-tab-brief layadmin-latestData">
                        <ul class="layui-tab-title">
                            <li class="layui-this">待审核</li>
                            <li>已审核</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <table id="LAY-index-wait"></table>
                            </div>
                            <div class="layui-tab-item">
                                <table id="LAY-index-finish"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index', //主入口模块
    }).use(['index', 'form', 'table'], function () {
        var table = layui.table
            , $ = layui.$
            , form = layui.form;

        //第一个实例
        table.render({
            elem: '#LAY-index-wait'
            ,data : ${waitList}
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'title', title: '名称'}
                ,{field: 'authority_name', title: '慈善机构'}
                ,{field: 'donee_name', title: '受赠人'}
                ,{field: 'target', title: '目标', sort: true}
                ,{field: 'time', title: '起止时间',templet:function (d) {
                        return d.start +' ~ '+ d.end
                    }}
                ,{field: 'receive', title: '已募集'}
                ,{field: 'urgent', title: '状态', templet : function (d) {
                        switch (d.status) {
                            case 0: return "待审核";
                            case 1: return "未开始";
                            case 2: return "进行中";
                            case 3: return "已完成";
                            case 4: return "未通过";
                        }
                    }}
                ,{field: 'caozuo',title: '操作',templet :function (d) {
                        return '<div class="layui-table-cell laytable-cell-1-0-7"><a class="layui-btn layui-btn-normal layui-btn-xs" href="${pageContext.request.contextPath}/root/setPriority?id='+d.id+'&&urgent=2"><i class="layui-icon layui-icon-pass"></i>通过</a><a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/root/setPriority?id='+ d.id +'">拒绝</a> </div>'
                    }}
            ]]
        })
        //第二个
        table.render({
            elem: '#LAY-index-finish'
            ,data : ${finishList}
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'title', title: '名称'}
                ,{field: 'authority_name', title: '慈善机构'}
                ,{field: 'donee_name', title: '受赠人'}
                ,{field: 'target', title: '目标', sort: true}
                ,{field: 'time', title: '起止时间',templet:function (d) {
                        return d.start +' ~ '+ d.end
                    }}
                ,{field: 'receive', title: '已募集'}
                ,{field: 'urgent', title: '状态', templet : function (d) {
                        switch (d.status) {
                            case 0: return "待审核";
                            case 1: return "未开始";
                            case 2: return "进行中";
                            case 3: return "已完成";
                            case 4: return "未通过";
                        }
                    }}
                ,{field: 'caozuo',title: '操作',templet :function (d) {
                        return '<div class="layui-table-cell laytable-cell-1-0-7"><a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/root/setPriority?id='+ d.id +'">取消紧急设置</a> </div>'
                    }}
            ]]
        })

    });
</script>
</body>
</html>
