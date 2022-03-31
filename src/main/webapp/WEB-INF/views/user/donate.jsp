<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/12
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>慈善捐助系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
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
            <div class="layui-card">
                <div class="layui-card-header">我要捐赠</div>
                <div class="layui-card-body" style="padding: 15px;">
                    <form class="layui-form" action="${pageContext.request.contextPath}/donate" method="post" lay-filter="component-form-group">
                        <input type="hidden" name="applicationId" value="${application.id}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">项目名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" disabled value="${application.title}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">捐款金额</label>
                            <div class="layui-input-inline">
                                <input type="text" name="money" lay-verify="required|number" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">捐款证明</label>
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn" id="test1">上传图片</button>
                                <div class="layui-upload-list">
                                    <input type="hidden" name="prove" class="layui-upload-file" value="">
                                    <img class="layui-upload-img" name="img" id="demo1" src="">
                                    <p id="demoText"></p>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">是否匿名</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="isAnoymous" value="0" title="否" checked>
                                <input type="radio" name="isAnoymous" value="1" title="是">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">留言</label>
                            <div class="layui-input-block">
                                <textarea name="message" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item layui-layout-admin">
                            <div class="layui-input-block">
                                <div class="" style="left: 0;">
                                    <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </div>
                    </form>
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
<script type="text/javascript">

    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
        element.on('nav(filter)', function(elem){
            console.log(elem.text());
        });
    });


    //返回到顶部
    layui.use('util', function() {
        var util = layui.util
            , laydate = layui.laydate
            , layer = layui.layer;
        //固定块
        util.fixbar({
            bar1: false
            , bar2: false
            , css: {right: 50, bottom: 50}
            , bgcolor: '#393D49'
            , click: function (type) {
                if (type === 'bar1') {
                    layer.msg('icon是可以随便换的')
                } else if (type === 'bar2') {
                    layer.msg('两个bar都可以设定是否开启')
                }
            }
        });
    });

    //所有图片懒加载
    layui.use('flow', function(){
        var flow = layui.flow;
        //当你执行这样一个方法时，即对页面中的全部带有lay-src的img元素开启了懒加载（当然你也可以指定相关img）
        flow.lazyimg();

    });

    layui.use(['form','upload'],function () {
        //图片上传
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '${pageContext.request.contextPath}/upload/img' //上传接口
            ,done: function(data){
                //上传完毕回调
                console.log(data);
                if (data.code == 0) {
                    $('#demo1').attr("src","${pageContext.request.contextPath}"+data.data.src);
                    console.log(this.item);
                    $("input[name='prove']").val(data.data.src);
                    layer.msg(data.message,{icon:1});
                } else{
                    layer.msg(data.message,{icon:1});
                }
            }
            ,error: function(){
                //请求异常回调
            }
        });

    })
</script>
</body>
</html>
