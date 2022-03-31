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
                    捐赠历史
<%--                    <div class="layui-form-item">--%>

<%--                        <div class="layui-inline">--%>
<%--                            <label class="layui-form-label">捐赠事件</label>--%>
<%--                            <div class="layui-input-inline">--%>
<%--                                <input type="text" name="author" placeholder="请输入" autocomplete="off"--%>
<%--                                       class="layui-input">--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="layui-inline">--%>
<%--                            <button class="layui-btn layuiadmin-btn-list" lay-submit--%>
<%--                                    lay-filter="LAY-app-contlist-search">--%>
<%--                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
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

        // 监听搜索
        form.on('submit(LAY-app-contlist-search)', function (data) {
            var field = data.field;
            console.log(data)
            //执行重载
            table.reload('LAY-app-content-list', {
                where: field
            });
        });
        var data = ${donates};
        //第一个实例
        table.render({
            elem: '#LAY-app-content-list'
            ,data : data
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID',width:80, sort: true, fixed: 'left'}
                ,{field: 'application_name', title: '事件'}
                ,{field: 'authority_name', width:180,title: '慈善机构', sort: true}
                ,{field: 'donee_name', title: '受赠人'}
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
                ,{field: 'caozuo',title: '操作',templet :function (d) {

                        return (!d.status)?'<a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/donor/deleteDonate?id='+ d.id +'"><i class="layui-icon layui-icon-delete"></i>删除</a> </div>':'';
                    }}
            ]]
        })

    });
</script>
</body>
</html>
