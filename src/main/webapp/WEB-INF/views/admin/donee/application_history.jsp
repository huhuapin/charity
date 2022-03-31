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
                    我的申请
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

        //第一个实例
        table.render({
            elem: '#LAY-app-content-list'
            ,data : ${applications}
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID',width:80, sort: true, fixed: 'left'}
                ,{field: 'title', title: '名称'}
                ,{field: 'authorityName', title: '慈善机构',width:180,templet:function (d) {
                        return'${authorityName}'
                    }}
                ,{field: 'target', title: '目标', sort: true}
                ,{field: 'time', title: '起止时间',templet:function (d) {
                        var startDate = new Date(d.start);
                        var start = startDate.getFullYear()+'-'+(startDate.getMonth()+1)+'-'+ startDate.getDate();
                        var endDate = new Date(d.end);
                        var end = endDate.getFullYear()+'-'+(endDate.getMonth()+1)+'-'+ endDate.getDate();
                        return start +' ~ '+ end
                    }}
                ,{field: 'donoor_num',title:'捐赠人数',width:110,sort:true}
                ,{field: 'receive', title: '已募集',width:120}
                ,{field: 'status', title: '状态', width:120, sort:true,templet : function (d) {
                        switch (d.status) {
                            case 0: return "待审核";
                            case 1: return "未开始";
                            case 2: return "进行中";
                            case 3: return "已完成";
                            case 4: return "未通过";
                        }
                    }}
                ,{field: 'caozuo',title: '操作',width:160,templet :function (d) {
                        return   (d.status==0||d.status==4)?'<a class="layui-btn layui-btn-primary layui-btn-xs" href="${pageContext.request.contextPath}/donee/editApplication?id='+d.id +'"><i class="layui-icon layui-icon-edit"></i>编辑</a>  <a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/donee/deleteApplication?id='+d.id +'"><i class="layui-icon layui-icon-delete"></i>删除</a>':'';
                    }}
            ]]
        })
    });
</script>

</body>
</html>
