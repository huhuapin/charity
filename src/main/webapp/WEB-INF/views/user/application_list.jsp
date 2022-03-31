<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>慈善捐助系统</title>
    <link rel="stylesheet" href="https://a.alipayobjects.com/charityprod/charityprod.donate-1.8.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/template.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!--
    -->
    <style>
        .donate-item-default-progress {
            text-align: center;
            line-height: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="layui-container container">
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md9">
            <div class="ui-round-corner-content donate-gap">
                <ul class="donate-filter fn-clear">
                    <li class="charity-project-filter-item">项目类型：</li>
                    <li class="charity-project-filter-item">
                        <a href="${pageContext.request.contextPath}/application_list">全部</a>
                    </li>
                    <c:forEach items="${categories}" var="category">
                    <li class="charity-project-filter-item">
                        <a href="${pageContext.request.contextPath}/application_list?categoryId=${category.id}">${category.category}</a>
                    </li>
                    </c:forEach>
                </ul>

            </div>
            <div class="ui-round-corner-content donate-gap">
                <ul class="donate-item-default">
                    <c:forEach items="${applications}" var="application">
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="${pageContext.request.contextPath}/application_detail?id=${application.get("id")}" seed="donateItemDefaultLeft-donateItemDefaultPicA" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="${pageContext.request.contextPath}${application.get("img")}">
                            </a>
                            <div class="donate-item-default-progress">
                                <c:choose>
                                    <c:when test="${application.get(\"status\") == 1}">未开始</c:when>
                                    <c:when test="${application.get(\"status\") == 2}">正在进行</c:when>
                                    <c:when test="${application.get(\"status\") == 3}">已完成</c:when>
                                </c:choose>
                            </div>
                            <div class="donate-item-default-active">
                                <c:if test="${application.get(\"status\") == 2 }">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="${pageContext.request.contextPath}/donate?id=${application.get("id")}" seed="donateItemDefaultActive-donateButton" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                                </c:if>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[${application.get("category")}]</span>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    ${application.get("title")}
                                    <a class="donate-item-default-more" href="${pageContext.request.contextPath}/application_detail?id=${application.get("id")}" seed="donateItemDefaultDesc-donateItemDefaultMore" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发 布 机 构：${application.get("authority_name")}</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">${application.get("receive")}</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：${fn:substring(application.get("start"), 0, 10)}   至 ${fn:substring(application.get("end"), 0, 10)}</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">${application.get("donoor_num")}</span> 人</dd>
                                <dd class="donate-item-default-dd">是否紧急：
                                    <c:choose>
                                        <c:when test="${application.get(\"urgent\") == 2}">是</c:when>
                                        <c:otherwise> 否 </c:otherwise>
                                    </c:choose>
                                </dd>
                            </dl>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div id="page"></div>
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
    //分页模块
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;
        //只显示上一页、下一页
        laypage.render({
            elem: 'page'
            ,count: ${applications.size()}
            //['count', 'prev', 'page', 'next', 'limit', 'skip']
            ,layout: ['prev', 'page', 'next']
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });
    });
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
