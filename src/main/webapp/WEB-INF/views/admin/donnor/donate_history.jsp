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
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <label class="layui-form-label">捐赠事件</label>
                            <div class="layui-input-inline">
                                <input type="text" name="author" placeholder="请输入" autocomplete="off"
                                       class="layui-input">
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

        //监听搜索
        form.on('submit(LAY-app-contlist-search)', function (data) {
            var field = data.field;

            //执行重载
            table.reload('LAY-app-content-list', {
                where: field
            });
        });

        //第一个实例
        table.render({
            elem: '#LAY-app-content-list'
            ,data : [{
                "id": "001"
                ,"title": "孩子们吃上了肉"
                ,"description": "春雷行动在进行，我们争取让每个孩子都吃上饭"
                ,"thumb": "这里是缩略图"
                ,"content": "通过中华美食的多个侧面，来展现食物给中国人生活带来的仪式、伦理等方面的文化；见识中国特色食材以及与食物相关、构成中国美食特有气质的一系列元素；了解中华饮食文化的精致和源远流长"
                ,"time": 20121204
                ,"click": 858
            }]
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'title', title: '标题', sort: true}
                ,{field: 'description', title: '描述'}
                ,{field: 'thumb', title: '缩略图'}
                ,{field: 'content', title: '内容'}
                ,{field: 'uploadtime', title: '日期', sort: true}
                ,{field: 'status', title: '点击量',sort: true}
                ,{field: 'caozuo',title: '操作',templet :function (d) {
                        return '<a href="${pageContext.request.contextPath}/add/'+d.id +'" class="layui-btn">添加</a>'

                        // <div class="layui-table-cell laytable-cell-1-0-7"> <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> </div>
                    }}
            ]]
        })
    });
</script>
</body>
</html>
