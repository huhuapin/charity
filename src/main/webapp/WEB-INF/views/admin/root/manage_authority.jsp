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
    <title>慈善机构管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<jsp:include page="./layout/index.jsp"></jsp:include>
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">机构名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <button class="layui-btn layuiadmin-btn-list" lay-submit
                                    lay-filter="LAY-app-contlist-search">
                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="layui-card-body">
                    <div style="padding-bottom: 10px;">
                        <button class="layui-btn layuiadmin-btn-list" data-type="add">添加</button>
                    </div>

                    <table id="LAY-app-content-list" lay-filter="LAY-app-content-list"></table>
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

        //监听搜索
        form.on('submit(LAY-app-contlist-search)', function (data) {
            var field = data.field;
            //执行重载
            table.reload('LAY-app-content-list', {
                where: field,
                url:"${pageContext.request.contextPath}/root/searchAuthority",
                method:"post",
                page: {
                    curr: 1
                },
            });
        });


    //第一个实例
    table.render({
        elem: '#LAY-app-content-list'
        ,data : ${data}
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'id', title: 'ID', sort: true, fixed: 'left'}
            ,{field: 'name', title: '名称'}
            ,{field: 'found', title: '资金规模', sort: true}
            ,{field: 'people', title: '机构人数'}
            ,{field: 'tel', title: '联系方式'}
            ,{field: 'address', title: '地址'}
            // ,{field: '', title: '评分', templet : function (d) {
            //     // <button class="layui-btn layui-btn-xs">已发布</button>
            //     // <button class="layui-btn layui-btn-primary layui-btn-xs">待修改</button>
            //         if (d.status == true)
            //             return "正常"
            //         else
            //             return "异常"
            //     }}
            ,{field: 'caozuo',title: '操作',templet :function (d) {
                return '<div class="layui-table-cell laytable-cell-1-0-7"><a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="detail"><i class="layui-icon layui-icon-search"></i>查看</a><a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/root/deleteAuthority?id='+ d.id +'"><i class="layui-icon layui-icon-delete"></i>删除</a> </div>'
            }}
        ]]
    })
    });
</script>
</body>
</html>
