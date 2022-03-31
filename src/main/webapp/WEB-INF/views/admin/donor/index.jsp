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
    <title>慈善捐助系统个人中心</title>
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
                                上次登录
                                <span class="layui-badge layui-bg-cyan layuiadmin-badge">时间</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">
                                <p class="layuiadmin-big-font">${user.getStringTime(user.lastLogin)}</p>
                                <p>
                                    上次访问时间
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                捐赠次数
                                <span class="layui-badge layui-bg-cyan layuiadmin-badge">总</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">
                                <p class="layuiadmin-big-font">${times}</p>
                                <p>
                                    捐赠次数
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-sm6 layui-col-md3">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                捐赠总额
                                <span class="layui-badge layui-bg-orange layuiadmin-badge">总</span>
                            </div>
                            <div class="layui-card-body layuiadmin-card-list">

                                <p class="layuiadmin-big-font">${money}</p>
                                <p>
                                    捐赠总额
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header">近七日捐赠</div>
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
        function getStandDate(relative) {
            var datetime = new Date(new Date().getTime()-24*60*60*1000*relative);
            var year = datetime.getFullYear()
            var month = datetime.getMonth() + 1;
            month = month < 10 ? '0'+month : month;
            var day = datetime.getDate() < 10 ? '0'+datetime.getDate() : datetime.getDate();
            var now = year + '-' + month + '-' +day;
            return now
        }
        var myChart = echarts.init(document.getElementById('LAY-index-dataview'));
        var s = ${moneyDay};
        var arrDay = [];
        var arrMoney = [];
        for (let i = 0; i < 7; i++) {
            var aday = getStandDate(i)
            arrDay.unshift(aday)
            var flag = 0
            s.forEach(function (d) {
                if (d.date == aday) {
                    flag = 1;
                    arrMoney.unshift(d.money)
                }
            })
            if (flag == 0) {
                arrMoney.unshift(0)
            }
        }
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
                data: arrDay
            },
            yAxis: {type:"value"},

            series: [{
                name: '金额',
                type: 'line',
                smooth: !0,
                itemStyle: {normal: {areaStyle: {type: "default"}}},
                data: arrMoney
            }]

        };

        myChart.setOption(option);
        window.onresize = myChart.resize;
    </script>

</body>
</html>