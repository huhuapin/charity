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
                            <label class="layui-form-label">申请名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="keywords" placeholder="请输入" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">申请状态</label>
                            <div class="layui-input-inline">
                                <select name="status" class="layui-form-select" lay-search>
                                    <option value="">全部</option>
                                    <option value="0">待审核</option>
                                    <option value="1">未开始</option>
                                    <option value="2">正在进行</option>
                                    <option value="3">已完成</option>
                                    <option value="4">未通过</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <button class="layui-btn layuiadmin-btn-list" lay-submit lay-filter="LAY-app-contlist-search">
                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="layui-card-body">
                    <div style="padding-bottom: 10px;">
                        <a href="${pageContext.request.contextPath}/authority/addApplication"><button class="layui-btn layuiadmin-btn-list" >发起申请</button></a>
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
            , form = layui.form;

        //监听搜索
        form.on('submit(LAY-app-contlist-search)', function (data) {
            var field = data.field;
            //执行重载
            table.reload('LAY-app-content-list', {
                where: field,
                url:"${pageContext.request.contextPath}/authority/searchApplication",
                method:"post",
                page: {
                    curr: 1
                },
            });
        });

    //第一个实例
    table.render({
        elem: '#LAY-app-content-list'
        ,data : ${applications}
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'id', title: 'ID',width:80, sort: true, fixed: 'left'}
            ,{field: 'title', title: '名称'}
            ,{field: 'donee_name', title: '受赠人',width:120}
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
                    // <button class="layui-btn layui-btn-xs">已发布</button>
                    // <button class="layui-btn layui-btn-primary layui-btn-xs">待修改</button>
                    switch (d.status) {
                        case 0: return "待审核";
                        case 1: return "未开始";
                        case 2: return "进行中";
                        case 3: return "已完成";
                        case 4: return "未通过";
                    }
                }}
            ,{field: 'caozuo',title: '操作',width:380,templet :function (d) {
                        var t = '';
                        if (d.status == 0) {
                            t = '<a class="layui-btn layui-btn-normal layui-btn-xs" href="${pageContext.request.contextPath}/authority/approveApplication?id='+d.id+'">同意</a><a class="layui-btn layui-btn-warm layui-btn-xs" href="${pageContext.request.contextPath}/authority/disapprove?id='+d.id+'">驳回</a>'
                        }else if (d.status == 1 || d.status == 2 || d.status == 3) {
                            t = '<a class="layui-btn  layui-btn-xs" href="${pageContext.request.contextPath}/authority/applicationDetail?id='+d.id+'">物资流向</a>';
                        }
                     return   '<a class="layui-btn layui-btn-primary layui-btn-xs" href="${pageContext.request.contextPath}/authority/editApplication?id='+d.id +'"><i class="layui-icon layui-icon-edit"></i>编辑</a>  <a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/authority/deleteApplication?id='+d.id +'"><i class="layui-icon layui-icon-delete"></i>删除</a>' +t;
                }}
        ]]
    })
    });
</script>
</body>
</html>
