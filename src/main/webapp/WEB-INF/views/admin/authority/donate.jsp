<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/31
  Time: 15:08
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
</head>
<body class="layui-layout-body">
<jsp:include page="./layout/index.jsp" flush="true"></jsp:include>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            今日捐赠人数
                            <span class="layui-badge layui-bg-cyan layuiadmin-badge">人</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">
                            <p class="layuiadmin-big-font">9,999,666</p>
                            <p>
                                今日捐赠人数
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            今日捐赠金额
                            <span class="layui-badge layui-bg-cyan layuiadmin-badge">总</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">
                            <p class="layuiadmin-big-font">33,555</p>
                            <p>
                                今日捐赠金额
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md3">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            今日最大捐赠
                            <span class="layui-badge layui-bg-orange layuiadmin-badge">位</span>
                        </div>
                        <div class="layui-card-body layuiadmin-card-list">

                            <p class="layuiadmin-big-font">66,666</p>
                            <p>
                                今日最大捐赠
                            </p>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm12">
                    <div class="layui-card">
                        <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">事件</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="application_name" placeholder="请输入" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">捐赠人</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="donor_name" placeholder="请输入" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">受赠人</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="donee_name" placeholder="请输入" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">捐赠时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" class="layui-input" name="date" id="date">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button class="layui-btn layuiadmin-btn-list" lay-submit="" lay-filter="LAY-app-contlist-search">
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
    </div>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index', //主入口模块
    }).use(['index','laydate', 'form', 'table'], function () {
        var table = layui.table
            , form = layui.form;


        //日期picker
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            trigger: 'click',
            elem: '#date', //指定元素,
            range: true
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

        //第一个实例
        table.render({
            elem: '#LAY-app-content-list'
            ,data : [{
                "id": "001"
                ,"title": "帮助贫困山区孩子吃一顿饭"
                ,"donor": {
                    "user":{
                        "name": "李佳琪"
                    }
                }
                ,"donee": {
                    "user":{
                        "name":"薇娅"
                    }
                }
                ,"money": 125.20
                ,"isAnoymous":1
                ,"message":"你要好好地"
                ,"prove": "这里放图片"
                ,"date": "2020-05-31"
                ,"status": 1
            }]
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'title', title: '事件'}
                ,{field: 'donor', title: '捐赠人', sort: true,templet:function (d) {
                    if (d.isAnoymous) {
                        return "匿名"
                    }else {
                        return d.donor.user.name
                    }}
                }
                ,{field: 'donee', title: '受赠人',templet:function (d) {
                        if (d.donee) {
                            return d.donee.user.name
                        }
                    }}
                ,{field: 'message', title: '留言'}
                ,{field: 'prove', title: '证明'}
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
                        return '<a href="${pageContext.request.contextPath}/add/'+d.id +'" class="layui-btn">添加</a>'

                        // <div class="layui-table-cell laytable-cell-1-0-7"> <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> </div>
                    }}
            ]]
        })
    });
</script>
</body>
</html>
