    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%--
          Created by IntelliJ IDEA.
          User: hasee
          Date: 2020/6/5
          Time: 18:23
          To change this template use File | Settings | File Templates.
        --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="layui-header header">
    <div class="main">
    <ul class="layui-nav layui-nav-left" lay-filter="filter">
    <a class="logo" href="${pageContext.request.contextPath}/index" title="Fly">慈善捐助系统</a>
    <li class="layui-nav-item layui-this nav-left">
    <a href="${pageContext.request.contextPath}/index">首页</a>
    </li>
    <li class="layui-nav-item">
    <a href="${pageContext.request.contextPath}/authority_list">慈善机构</a>
    </li>
    <li class="layui-nav-item">
    <a href="${pageContext.request.contextPath}/application_list">捐赠项目</a>
    </li>
    <li class="layui-nav-item">
    <a href="${pageContext.request.contextPath}/article">新闻通知</a>
    </li>
    </ul>
    <ul class="layui-nav layui-layout-right layui-nav-right" lay-filter="filter">

    <li class="layui-nav-item">
    <a href="javascript:;">
        <c:choose>
            <c:when test="${user==null}">
                请登录
            </c:when>
            <c:otherwise>
                ${user.name}
            </c:otherwise>
        </c:choose>
        </a>
    <dl class="layui-nav-child">
    <dd><a href="${pageContext.request.contextPath}/user/my">个人中心</a></dd>
    <dd><a href="${pageContext.request.contextPath}/user/logout">退出</a></dd>
    </dl>
    </li>
    </ul>
    </div>
    </div>
    <div class="layui-container container">
    <div id="head-wrapper">
    <div class="searchWrapper">
        <form action="${pageContext.request.contextPath}/application_list" method="get" id="Search">
    <input class="searchInput" name="keywords" id="J_searchInput" placeholder="搜索公益项目" type="text" seed="searchWrapper-J_searchInput" smartracker="on">
    <a href="javascript:;" onclick="document:Search.submit()" class="actionBtn zoomIcon" id="J_actionSearchBtn" seed="searchWrapper-J_actionSearchBtn" smartracker="on">&nbsp;</a>
        </form>
        </div>
    <div class="headLinkWrapper">
    <div style="float: right;margin-left: 26px;line-height: 34px; padding: 4px 0;">
    <img style="width:32px" src="https://gw.alipayobjects.com/mdn/rms_be077b/afts/img/A*lxwRRK3oocwAAAAAAAAAAABkARQnAQ" alt="本网站支持IPV6" seed="headLinkWrapper-gwMdnRms_be077bAftsImgA*lxwRRK3oocwAAAAAAAAAAABkARQnAQ" smartracker="on">
    </div>
    <a href="${pageContext.request.contextPath}/authority/index" class="headLinkBtn linkToNGO" target="_blank" seed="headLinkWrapper-headLinkBtn" smartracker="on">公益机构后台</a>
    <a href="${pageContext.request.contextPath}/donor/history" class="headLinkBtn linkToMy" target="_blank" seed="headLinkWrapper-headLinkBtnT1" smartracker="on">我的捐赠</a>
    </div>
    </div>
    </div>