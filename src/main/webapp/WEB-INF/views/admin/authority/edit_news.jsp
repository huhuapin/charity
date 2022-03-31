<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/31
  Time: 17:51
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
            <div class="layui-col-md6 layui-col-md-offset3">
                <div class="layui-card">
                    <div class="layui-card-header">修改新闻</div>
                    <div class="layui-card-body" style="padding: 15px;">
                        <form class="layui-form" action="${pageContext.request.contextPath}/authority/editNews" method="post" lay-filter="component-form-group">
                            <input type="hidden" name="id" value="${news.id}">
                            <div class="layui-form-item">
                                <label class="layui-form-label">标题</label>
                                <div class="layui-input-block">
                                    <input type="text" name="title" lay-verify="title" value="${news.title}" autocomplete="off" placeholder="请输入受赠人" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">简介</label>
                                <div class="layui-input-block">
                                    <textarea name="description" id="" class="layui-textarea">${news.description}</textarea>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">缩略图</label>
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                                    <div class="layui-upload-list">
                                        <input type="hidden" name="thumb" class="layui-upload-file" value="">
                                        <img class="layui-upload-img" id="demo1" src="${pageContext.request.contextPath}${news.thumb}">
                                        <p id="demoText"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">内容</label>
                                <div class="layui-input-block">
                                    <textarea name="content" id="content">${news.content}</textarea>
                                </div>
                            </div>
                                <div class="layui-form-item layui-layout-admin">
                                    <div class="layui-input-block">
                                        <div class="layui-footer" style="left: 0;">
                                            <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即提交</button>
                                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<jsp:include page="layout/footer.jsp" flush="true"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form','layedit','upload'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,layer = layui.layer
            ,form = layui.form;
        var layedit = layui.layedit;
        layedit.build('content',{
            uploadImage : {
                url:"${pageContext.request.contextPath}/upload/img",
                type: "POST",
                base_url:"${pageContext.request.contextPath}"
            }
        }) //建立编辑器

        form.render(null, 'component-form-group');


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
                    $("input[name='thumb']").val(data.data.src);
                    layer.msg(data.message,{icon:1});
                } else{
                    layer.msg(data.message,{icon:1});
                }
            }
            ,error: function(){
                //请求异常回调
            }
        });

        /* 自定义验证规则 */
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

    });
</script>

</body>
</html>
