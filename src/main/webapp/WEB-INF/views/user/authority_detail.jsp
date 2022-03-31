<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 21:19
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
    <title>慈善捐助系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/template.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!--
    -->
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="layui-container container">
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md9">
            <div class="fly-home">
                <img src="${pageContext.request.contextPath}${authority.get("img")}" alt="慈善机构">
                <h1>
                    ${authority.get("name")}
                </h1>
<%--                <p class="fly-home-sign">（人生仿若一场修行）</p>--%>
            </div>
            <div class="layui-card lay-card">
                <div class="layui-card-header">机构信息</div>
                <div class="layui-card-body">

                    <div class="layui-carousel layadmin-carousel layadmin-backlog">
                        <div carousel-item>
                            <ul class="layui-row layui-col-space10">
                                <li class="layui-col-xs6">
                                    <a lay-href="app/content/comment.html" class="layadmin-backlog-body">
                                        <h3>资金规模</h3>
                                        <p><cite>${authority.get("found")}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs6">
                                    <a lay-href="app/forum/list.html" class="layadmin-backlog-body">
                                        <h3>机构人数</h3>
                                        <p><cite>${authority.get("people")}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs6">
                                    <a lay-href="template/goodslist.html" class="layadmin-backlog-body">
                                        <h3>机构电话</h3>
                                        <p><cite>${authority.get("tel")}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs6">
                                    <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});" class="layadmin-backlog-body">
                                        <h3>机构地址</h3>
                                        <p><cite>${authority.get("address")}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs6">
                                    <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});" class="layadmin-backlog-body">
                                        <h3>机构法人</h3>
                                        <p><cite>${authority.get("represent")}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-xs6">
                                    <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});" class="layadmin-backlog-body">
                                        <h3>创建时间</h3>
                                        <p><cite>${fn:substring(authority.get("created_time"), 0, 10)}</cite></p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-card lay-card">
                <div class="layui-card-header">机构介绍信息</div>
                <div class="layui-card-body">
                    <div class="news-content">
                        ${authority.get("description")}
<%--                        <p>&nbsp;</p><p>&nbsp;</p><h2 style="text-align: center;">中国社会福利基金会简介</h2><p>&nbsp;</p><p style="text-indent: 2em;">中国社会福利基金会是由民政部登记和主管的全国性公募基金会，成立于2005年6月14日，原名中国社会福利教育基金会，2011年7月15日经民政部批准更名为“中国社会福利基金会”。中国社会福利基金会在民政部有关司局、社会爱心企业和爱心人士的大力支持和帮助下，募集善款规模逐年增长，事业得到长足发展。</p><p style="text-indent: 2em;">中国社会福利基金会一直秉承“以民为本、关注民生、扶危济困、共享和谐，服务社会福利事业。”的宗旨，坚持“立足民间、携手伙伴”的理念，致力于提高社会困境群体的社会福利水平，开展助孤、助残、助学、助困、助老服务、大病救助、社区发展、救灾救援、行业支持、公益文化宣传等方面的公益项目和公益活动，培育了免费午餐基金、芒果V基金、童享工程、暖心工程、授渔计划、暖流计划、919大病救助工程、梧桐成长计划等一批在社会上拥有一定知名度和影响力的项目，并多次获得中华慈善奖。截至2018年5月，累计捐赠收入突破20亿元，公益支出近15亿元，向贫困连片地区、老少边穷地区的儿童、老人等群体以及部分发达地区的流动人口等特殊弱势群体提供资金、物资的直接资助等服务，项目实施地区遍布全国各地。</p><p style="white-space: normal; text-indent: 2em;">基金会开展的公益项目先后获得了“2011年度十大法治人物奖”、“2011中国教育年度十大公益品牌”、2011年、2012年“中国慈善推动者奖”、“2012优秀公益项目奖”、“2012年第二届中国社会创新奖”、“2013年中国慈善推动者奖”、“2015年全国农民工优秀工作集体奖”、2011、2013、2015年“中华慈善奖”、“2015年度新浪微公益杰出贡献奖”、“2015责任中国公益行动奖”、2015年国务院颁发：“全国农民工工作优秀集体奖”、2017、2018年“十大公募基金会”称号。</p><p>&nbsp;</p><p><strong>基金会宗旨：</strong>以民为本、关注民生、扶危济困、共享和谐，服务社会福利事业。</p><p>&nbsp;</p><p><strong>基本信息：</strong></p><p>·基金会全称：中国社会福利基金会，英文译名：China Social Welfare Foundation，缩写：CSWF。</p><p>·基金会性质：全国性公募基金会</p><p>·中国社会组织评估等级：4A</p><p>·证书编号：社评基字[2016]第003号</p><p>·登记管理机关：民政部</p><p>·发起人：民政部</p><p>·业务主管单位：民政部</p><p>·统一社会信用代码：53100000500019795A</p><p>·基金会地址：北京市西城区广莲路1号建工大厦14层</p><p>&nbsp;</p><p><strong>业务范围：</strong></p><p>（1）资助社会福利机构儿童、残障儿童、孤儿和贫困家庭儿童，帮助他们完成学业；</p><p>（2）支持社会老年福利机构和困境中的老年群体，改善教育和生活质量；</p><p>（3）支持贫困地区、灾区、少数民族地区和革命老区解决在社会福利教育事业发展过程中遇到的特殊困难；</p><p>（4）开展或资助与社会福利教育相关的公益文化宣传活动；</p><p>（5）开展与社会福利教育相关的国际合作与业务交流；</p><p>（6）支持社会管理与社会福利方面的高等教育和职业教育，培养社会管理人才；</p><p>（7）支持和开展社会福利理论研究、学术交流活动。</p><p><br></p>--%>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="layout/rside.jsp"></jsp:include>
    </div>
</div>
<div class="footer">
    <hr class="layui-bg-red">
    <p><a href="https://www.sdut.edu.cn/">山东理工大学</a> 2020 &copy; <a href="#">版权所有</a></p>
    <p>慈善捐助系统</p>
</div>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js" type="text/javascript"></script>

<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index', //主入口模块
    }).use(['index','admin','carousel'],function () {
        var e = layui.$, t = (layui.admin, layui.carousel), a = layui.element, i = layui.device();
        e(".layadmin-carousel").each(function () {
            var a = e(this);
            t.render({
                elem: this,
                width: "100%",
                arrow: "none",
                interval: a.data("interval"),
                autoplay: a.data("autoplay") === !0,
                trigger: i.ios || i.android ? "click" : "hover",
                anim: a.data("anim")
            })
        }), a.render("progress")
    })

    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        element.on('nav(filter)', function(elem){
            console.log(elem.text());
        });
    });
</script>
</body>
</html>
