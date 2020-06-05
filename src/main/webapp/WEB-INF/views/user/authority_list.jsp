<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 19:14
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/template.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!--
    -->
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="layui-card">
    <div class="layui-container container">
        <div class="layui-row layui-col-space20">
            <div class="layui-col-md9">
                <div class="layui-card-header lay-card-header">慈善机构列表</div>
                <div class="layui-card-body">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md4">
                        <div class="cmdlist-container">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/img/authority.jpg">
                            </a>
                            <a href="javascript:;">
                                <div class="cmdlist-text">
                                    <div class="authority-name">中华慈善基金总会</div>
                                    <div class="price">
                                        资金规模：<span style="color: #f46000;">13131556元</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="cmdlist-container">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/img/authority.jpg">
                            </a>
                            <a href="javascript:;">
                                <div class="cmdlist-text">
                                    <div class="authority-name">中华慈善基金总会</div>
                                    <div class="price">
                                        资金规模：<span style="color: #f46000;">13131556元</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="cmdlist-container">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/img/authority.jpg">
                            </a>
                            <a href="javascript:;">
                                <div class="cmdlist-text">
                                    <div class="authority-name">中华慈善基金总会</div>
                                    <div class="price">
                                        资金规模：<span style="color: #f46000;">13131556元</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="cmdlist-container">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/img/authority.jpg">
                            </a>
                            <a href="javascript:;">
                                <div class="cmdlist-text">
                                    <div class="authority-name">中华慈善基金总会</div>
                                    <div class="price">
                                        资金规模：<span style="color: #f46000;">13131556元</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="cmdlist-container">
                            <a href="javascript:;">
                                <img src="${pageContext.request.contextPath}/img/authority.jpg">
                            </a>
                            <a href="javascript:;">
                                <div class="cmdlist-text">
                                    <div class="authority-name">中华慈善基金总会</div>
                                    <div class="price">
                                        资金规模：<span style="color: #f46000;">13131556元</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!--分页-->
                </div>
                    <div id="page"></div>
                </div>
            </div>
            <jsp:include page="layout/rside.jsp"></jsp:include>
        </div>
    </div>
</div>
<div class="footer">
    <hr class="layui-bg-red">
    <p><a href="http://itdaima.com/">山东理工大学</a> 2020 &copy; <a href="#">版权所有</a></p>
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
            ,count: 100
            //['count', 'prev', 'page', 'next', 'limit', 'skip']
            ,layout: ['prev', 'page', 'next']
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第 '+ obj.curr +' 页');
                }
            }
        });
    });
</script>
</body>
</html>
