<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/31
  Time: 18:00
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <title>慈善捐助系统后台管理</title>
    <style>
        .article-label {
            font-weight: bold;
            font-size: 20px;
            display: block;
            padding: 9px 15px;
            line-height: 20px;
            text-align: left;
        }
        .article-value {
            font-size: 18px;
            display: block;
            padding: 9px 15px;
            text-align: left;
        }
    </style>
</head>
<body class="layui-layout-body">
<jsp:include page="./layout/index.jsp" flush="true"></jsp:include>
<!-- 主体内容 -->
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">

        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md-12">
                    <div class="layui-card">
                        <div class="layui-card-header">项目详情</div>
                        <div class="layui-card-body" style="padding: 15px;">
                            <div class="layui-form-item layui-row">
                                <div class="layui-col-md3">
                                    <div class="article-label">今天周几？</div>
                                </div>
                                <div class="layui-col-md9">
                                    <div class="article-value">今天周一</div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-row">
                                <div class="layui-col-md3">
                                    <div class="article-label">今天周几？</div>
                                </div>
                                <div class="layui-col-md9">
                                    <div class="article-value">今天周一</div>
                                </div>
                            </div>                            <div class="layui-form-item layui-row">
                            <div class="layui-col-md3">
                                <div class="article-label">今天周几？</div>
                            </div>
                            <div class="layui-col-md9">
                                <div class="article-value">今天周一</div>
                            </div>
                        </div>                            <div class="layui-form-item layui-row">
                            <div class="layui-col-md3">
                                <div class="article-label">今天周几？</div>
                            </div>
                            <div class="layui-col-md9">
                                <div class="article-value">今天周一</div>
                            </div>
                        </div>                            <div class="layui-form-item layui-row">
                            <div class="layui-col-md3">
                                <div class="article-label">今天周几？</div>
                            </div>
                            <div class="layui-col-md9">
                                <div class="article-value">今天周一</div>
                            </div>
                        </div>
                        </div>
                    </div>

                </div>
                <div class="layui-col-md-12">
                    <div class="layui-card">
                        <div class="layui-card-header">善款去向</div>
                        <div class="layui-card-body">
                            <div style="padding-bottom: 10px;">
                                <button class="layui-btn layuiadmin-btn-list" data-type="add">添加</button>
                            </div>
                            <ul class="layui-timeline">
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">12月28日<a href="javascript:;"><i class="layui-icon layui-icon-edit" data-id="1"></i></a></h3>
                                        <p>
                                            一直以来，layui 秉承无偿开源的初心，虔诚致力于服务各层次前后端 Web 开发者，在商业横飞的当今时代，这一信念从未动摇。即便身单力薄，仍然重拾决心，埋头造轮，以尽可能地填补产品本身的缺口。在过去的一段的时间，我一直在寻求持久之道，已维持你眼前所见的一切。而 layuiAdmin 是我们尝试解决的手段之一。我相信真正有爱于 layui 生态的你，定然不会错过这一拥抱吧。
                                        </p>
                                        <p><br>子曰：君子不用防，小人防不住。请务必通过官网正规渠道，获得 <a href="http://www.layui.com/admin/" target="_blank">layuiAdmin</a>！</p>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">12月25日</h3>
                                        <p>又是一年 <em>“圣诞节”</em>，2018 向我们正在走来</p>
                                        <ul>
                                            <li>叮叮当，叮叮当，铃儿响叮当</li>
                                            <li>今晚滑雪多快乐，我们坐在雪橇上</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                    <div class="layui-timeline-content layui-text">
                                        <h3 class="layui-timeline-title">12月24日</h3>
                                        <p>
                                            美丽的夜晚，都是祈祷的人们。<br>他们等待着第二天，收到圣诞老人的礼物。<br><br>
                                        </p>
                                        <blockquote class="layui-elem-quote">平安夜，天赐平安。愿真善美的事物都能永恒。</blockquote>
                                    </div>
                                </li>
                                <li class="layui-timeline-item">
                                    <i class="layui-icon layui-timeline-axis"></i>
                                    <div class="layui-timeline-content layui-text">
                                        <div class="layui-timeline-title">过去</div>
                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="./layout/footer.jsp"></jsp:include>
<div id="layui-container" style="display: none">
    <div class="layui-card">
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <textarea name="content" id="content"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index', //主入口模块
    }).use(['index', 'form','layedit', 'table'], function () {
        var $ = layui.$
            ,table = layui.table
            ,layer = layui.layer
            , form = layui.form;

        $('.layui-icon-edit').on('click', function(d){
            console.log(d)
            console.log($(this).data('id'))
            layer.config({
                skin: 'layui-layer-molv'
            })
            layer.open({
                type: 1
                ,title: '编辑去向'
                ,content: $('#layui-container')
                ,area:['960px','540px']
                ,btn: ['确定', '取消']
                ,yes: function(index, layero){
                    console.log(index)
                    console.log(layero)
                }
            });
            var layedit = layui.layedit;
            layedit.build('content') //建立编辑器
        })

    })

</script>
</body>
</html>
