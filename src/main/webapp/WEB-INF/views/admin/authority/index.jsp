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
                                访问量
                                <span class="layui-badge layui-bg-cyan layuiadmin-badge">总</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">
                                <p class="layuiadmin-big-font">9,999,666</p>
                                <p>
                                    总计访问量
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                今日捐赠
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
                                受赠者
                                <span class="layui-badge layui-bg-orange layuiadmin-badge">位</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">

                                <p class="layuiadmin-big-font">66,666</p>
                                <p>
                                    受赠用户数
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                资金规模
                                <span class="layui-badge layui-bg-red layuiadmin-badge">元</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">

                                <p class="layuiadmin-big-font">66,666</p>
                                <p>
                                    总资金规模
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                今日捐赠
                                <span class="layui-badge layui-bg-red layuiadmin-badge">元</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">

                                <p class="layuiadmin-big-font">66,666</p>
                                <p>
                                    今日捐赠金额
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                今日捐赠申请
                                <span class="layui-badge layui-bg-red layuiadmin-badge">个</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">

                                <p class="layuiadmin-big-font">66,666</p>
                                <p>
                                    今日捐赠申请数
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header">数据概览</div>
                            <div class="layui-card-body">

                                <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">
                                    <div id="LAY-index-dataview" style="width: 100%;height: 100%">
                                        <div><i class="layui-icon layui-icon-loading1 layadmin-loading"></i></div>
                                    </div>
                                </div>

                            </div>
                        </div>
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
        }).use(['index','admin','element','echarts'],function () {
        })
    </script>
    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
    <script>
        var myChart = echarts.init(document.getElementById('LAY-index-dataview'));

        var option = {
            title: {
                text: '近七日捐赠金额'
            },
            tooltip: {},
            legend: {
                data:['金额']
            },
            xAxis: {
                type: "category",
                boundaryGap: !1,
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {type:"value"},

            series: [{
                name: '金额',
                type: 'line',
                smooth: !0,
                itemStyle: {normal: {areaStyle: {type: "default"}}},
                data: [5, 20, 36, 10, 10, 20]
            }]

        };

        myChart.setOption(option);
        window.onresize = myChart.resize;
    </script>
</body>
</html>