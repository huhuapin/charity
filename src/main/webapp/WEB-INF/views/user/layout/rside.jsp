<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="layui-col-md3">
    <div class="tuwen">
    <h3>为你推荐</h3>
    <div class="recommend-container">
    <c:forEach items="${recommends}" var="recommend">
        <a href="${pageContext.request.contextPath}/application_detail?id=${recommend.get("id")}">
        <div class="item">
        <div class="imgWrapper">
        <img alt="${recommend.get("title")}" width="100%" height="166px" seed="imgWrapper-loveDonateNull" src="${pageContext.request.contextPath}${recommend.get("img")}" smartracker="on" src="">
        <div class="dueWrapper">

        <span class="due">限时${recommend.get("end")}</span>
        </div>
        </div>
        <div class="infoWrapper">
        <h3>${recommend.get("title")}</h3>
        <h4>${recommend.get("authority_name")}</h4>
        <div class="countWrapper">
        <span class="countNumber countNumberA">${recommend.get("donoor_num")}</span>&nbsp;人&nbsp;捐赠&nbsp;&nbsp;&nbsp;<span class="countNumber countNumberB">${recommend.get("receive")}</span>&nbsp;元&nbsp;已募
        </div>
        </div>
        </div>
        </a>
    </c:forEach>
    <%--    <div class="item">--%>
<%--    <div class="imgWrapper">--%>
<%--    <img alt="壹基金儿童月捐" width="100%" height="166px" seed="imgWrapper-loveDonateNull" src="${pageContext.request.contextPath}/img/application_img.jpg" lay-src="${pageContext.request.contextPath}/img/application_img.jpg" smartracker="on" src="">--%>
<%--    <div class="dueWrapper">--%>

<%--    <span class="due">限时2021.03.31</span>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="infoWrapper">--%>
<%--    <h3>壹基金儿童月捐</h3>--%>
<%--    <h4>深圳壹基金公益基金会</h4>--%>
<%--    <div class="countWrapper">--%>
<%--    <span class="countNumber countNumberA">38543066</span>&nbsp;人&nbsp;捐赠&nbsp;&nbsp;&nbsp;<span class="countNumber countNumberB">302815948.39</span>&nbsp;元&nbsp;已募--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="item">--%>
<%--    <div class="imgWrapper">--%>
<%--    <img alt="壹基金儿童月捐" width="100%" height="166px" seed="imgWrapper-loveDonateNull" src="${pageContext.request.contextPath}/img/application_img.jpg" lay-src="${pageContext.request.contextPath}/img/application_img.jpg" smartracker="on" src="">--%>
<%--    <div class="dueWrapper">--%>

<%--    <span class="due">限时2021.03.31</span>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="infoWrapper">--%>
<%--    <h3>壹基金儿童月捐</h3>--%>
<%--    <h4>深圳壹基金公益基金会</h4>--%>
<%--    <div class="countWrapper">--%>
<%--    <span class="countNumber countNumberA">38543066</span>&nbsp;人&nbsp;捐赠&nbsp;&nbsp;&nbsp;<span class="countNumber countNumberB">302815948.39</span>&nbsp;元&nbsp;已募--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="item">--%>
<%--    <div class="imgWrapper">--%>
<%--    <img alt="壹基金儿童月捐" width="100%" height="166px" seed="imgWrapper-loveDonateNull" src="${pageContext.request.contextPath}/img/application_img.jpg" lay-src="${pageContext.request.contextPath}/img/application_img.jpg" smartracker="on" src="">--%>
<%--    <div class="dueWrapper">--%>

<%--    <span class="due">限时2021.03.31</span>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="infoWrapper">--%>
<%--    <h3>壹基金儿童月捐</h3>--%>
<%--    <h4>深圳壹基金公益基金会</h4>--%>
<%--    <div class="countWrapper">--%>
<%--    <span class="countNumber countNumberA">38543066</span>&nbsp;人&nbsp;捐赠&nbsp;&nbsp;&nbsp;<span class="countNumber countNumberB">302815948.39</span>&nbsp;元&nbsp;已募--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="item">--%>
<%--    <div class="imgWrapper">--%>
<%--    <img alt="壹基金儿童月捐" width="100%" height="166px" seed="imgWrapper-loveDonateNull" src="${pageContext.request.contextPath}/img/application_img.jpg" lay-src="${pageContext.request.contextPath}/img/application_img.jpg" smartracker="on" src="">--%>
<%--    <div class="dueWrapper">--%>

<%--    <span class="due">限时2021.03.31</span>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    <div class="infoWrapper">--%>
<%--    <h3>壹基金儿童月捐</h3>--%>
<%--    <h4>深圳壹基金公益基金会</h4>--%>
<%--    <div class="countWrapper">--%>
<%--    <span class="countNumber countNumberA">38543066</span>&nbsp;人&nbsp;捐赠&nbsp;&nbsp;&nbsp;<span class="countNumber countNumberB">302815948.39</span>&nbsp;元&nbsp;已募--%>
<%--    </div>--%>
<%--    </div>--%>
<%--    </div>--%>

    </div>
    </div>
    <div class="ad"> <img lay-src="../static/images/03.jpg"> </div>
    <div class="links">
    <h3>友情链接</h3>
    <ul>
    <li><a href="#">中国慈善基金总会</a></li>
    <li><a href="#">韩红爱心慈善基金会</a></li>
    <li><a href="#">中国红十字基金会</a></li>
    <li><a href="#">中国儿童少年基金会</a></li>
    </ul>
    </div>
    </div>
