<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/30
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
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
                    <div class="layui-card-header">修改捐赠申请</div>
                    <div class="layui-card-body" style="padding: 15px;">
                        <form class="layui-form" action="${pageContext.request.contextPath}/authority/editApplication" method="post" lay-filter="component-form-group">
                            <input type="hidden" name="id" value="${application.id}">
                            <div class="layui-form-item">
                                <label class="layui-form-label">项目名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="title" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${application.title}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">受赠人</label>
                                <div class="layui-input-block">
                                    <select name="doneeId" lay-search>
                                        <option value="0">群体</option>
                                        <c:forEach items="${donees}" var="donee">
                                            <option value="${donee.get("id")}"<c:if test="${donee.get(\"id\") == application.doneeId}"> selected </c:if> >${donee.get("name")}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">图片</label>
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                                    <div class="layui-upload-list">
                                        <input type="hidden" name="img" class="layui-upload-file" value="">
                                        <img class="layui-upload-img" id="demo1" name="img" src="${pageContext.request.contextPath}${application.img}">
                                        <p id="demoText"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">项目分类</label>
                                <div class="layui-input-block">
                                    <select name="categoryId" lay-search>
                                        <option value="0" disabled>请选择</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" <c:if test="${category.id == application.categoryId}"> selected </c:if> >${category.category}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">目标善款</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="target" lay-verify="required|number" autocomplete="off" class="layui-input" value="${application.target}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">开始时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="start" id="LAY-component-form-group-date-start" lay-verify="date" placeholder="yyyy-MM-dd" value="${application.startString}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">结束时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="end" id="LAY-component-form-group-date-end" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" value="${application.endString}" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">申请紧急</label>
                                <div class="layui-input-block">
                                    <input type="radio" lay-filter="urgent" name="urgent"  title="否" value="0" <c:if test="${application.urgent == 0 }"> checked </c:if>>
                                    <input type="radio" lay-filter="urgent" name="urgent"  title="是" value="1" <c:if test="${application.urgent == 1 }"> checked </c:if>>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">项目描述</label>
                                <div class="layui-input-block">
                                    <textarea name="description" id="description">${application.description}</textarea>
                                </div>
                            </div>

                            <div class="layui-form-item layui-layout-admin">
                                <div class="layui-input-block">
                                    <div class="layui-footer" style="left: 0;">
                                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即修改</button>
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
    }).use(['index', 'form', 'laydate','layedit','upload'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
            ,form = layui.form;
        var layedit = layui.layedit;

        layedit.build('description',{
            uploadImage : {
                url:"${pageContext.request.contextPath}/upload/img",
                type: "POST",
                base_url:"${pageContext.request.contextPath}",
            }
        }) //建立编辑器

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date-start'
        });
        laydate.render({
            elem: '#LAY-component-form-group-date-end'
        });


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
                    $("input[name='img']").val(data.data.src);
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
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        /* 监听指定开关 */
        form.on('switch(urgent)', function(data){
            $('input[name="urgent"]').val(this.checked?1:0);
        });

    });
</script>
</body>
</html>
