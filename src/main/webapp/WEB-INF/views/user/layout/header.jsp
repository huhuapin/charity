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
    <a class="logo" href="index.html" title="Fly">慈善捐助系统</a>
    <li class="layui-nav-item layui-this nav-left">
    <a href="index.html">首页</a>
    </li>
    <li class="layui-nav-item">
    <a href="article.html">慈善机构</a>
    </li>
    <li class="layui-nav-item">
    <a href="time_line.html">捐赠项目</a>
    </li>
    <li class="layui-nav-item">
    <a href="time_line.html">新闻通知</a>
    </li>
    </ul>
    <ul class="layui-nav layui-layout-right layui-nav-right" lay-filter="filter">

    <li class="layui-nav-item">
    <a href="home.html">我的主页<span class="layui-badge-dot"></span></a>
    </li>
    <li class="layui-nav-item">
    <a href="javascript:;"><img src="../static/images/head.jpg" class="layui-nav-img">我</a>
    <dl class="layui-nav-child">
    <dd><a href="article_pub.html">文章发布</a></dd>
    <dd><a href="set.html">修改信息</a></dd>
    <dd><a href="javascript:;">退了</a></dd>
    </dl>
    </li>
    </ul>
    </div>
    </div>
    <div class="layui-container container">
    <div id="head-wrapper">
    <div class="searchWrapper">
    <input class="searchInput" name="search" id="J_searchInput" placeholder="搜索公益项目" type="text" seed="searchWrapper-J_searchInput" smartracker="on">
    <a href="#" class="actionBtn zoomIcon" id="J_actionSearchBtn" seed="searchWrapper-J_actionSearchBtn" smartracker="on">&nbsp;</a>
    </div>
    <div class="headLinkWrapper">
    <div style="float: right;margin-left: 26px;line-height: 34px; padding: 4px 0;">
    <img style="width:32px" src="https://gw.alipayobjects.com/mdn/rms_be077b/afts/img/A*lxwRRK3oocwAAAAAAAAAAABkARQnAQ" alt="本网站支持IPV6" seed="headLinkWrapper-gwMdnRms_be077bAftsImgA*lxwRRK3oocwAAAAAAAAAAABkARQnAQ" smartracker="on">
    </div>
    <a href="/user/ngoLogin.htm" class="headLinkBtn linkToNGO" target="_blank" seed="headLinkWrapper-headLinkBtn" smartracker="on">公益机构后台</a>
    <a href="https://love.alipay.com/donate/i.htm" class="headLinkBtn linkToMy" target="_blank" seed="headLinkWrapper-headLinkBtnT1" smartracker="on">我的捐赠</a>
    </div>
    </div>
    </div>