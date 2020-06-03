<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/30
  Time: 15:09
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
            <div class="layui-card">
                <div class="layui-card-header layuiadmin-card-header-auto">
                    <button class="layui-btn layuiadmin-btn-tags" data-type="add">添加</button>
                </div>
                <div class="layui-card-body">
                    <table id="LAY-app-content-tags" lay-filter="LAY-app-content-tags"></table>
                    <script type="text/html" id="layuiadmin-app-cont-tagsbar">
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp" flush="true"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index','form', 'table'], function(){

        var table = layui.table;
        var $ = layui.$;
        table.render({
            elem: "#LAY-app-content-tags",
            //修改数据
            data: ${data},
            cols: [[ {field: "id", width: 100, title: "ID", sort: !0}, {
                field: "category",
                title: "分类名",
                minWidth: 100
            }, {title: "操作", width: 150, align: "center", fixed: "right", toolbar: "#layuiadmin-app-cont-tagsbar"}]],
            text: "对不起，加载出现异常！"
        }), table.on("tool(LAY-app-content-tags)", function (t) {
            console.log(t)
            var i = t.data;
            if ("del" === t.event) layer.confirm("确定删除此分类？", function (e) {
                console.log(i);
                //删除操作
                t.del(), layer.close(e)
            }); else if ("edit" === t.event) {
                $(t.tr);
                console.log(t)
                layer.open({
                    type: 1,
                    title: "编辑分类",
                    content: '  <div class="layui-form" lay-filter="layuiadmin-form-tags" id="layuiadmin-app-form-tags" style="padding-top: 30px; text-align: center;">\n' +
                        '    <div class="layui-form-item">\n' +
                        '<input type="hidden" name="id" value="'+t.data.id+'"/>' +
                        '      <label class="layui-form-label">分类名</label>\n' +
                        '      <div class="layui-input-inline">\n' +
                        '        <input type="text" name="category" lay-verify="required" placeholder="请输入..." autocomplete="off" class="layui-input" value="'+ t.data.category+'">\n' +
                        '      </div>\n' +
                        '    </div>\n' +
                        '  </div>',
                    area: ["450px", "200px"],
                    btn: ["确定", "取消"],
                    yes: function (e, i) {
                        var n = i.find("#layuiadmin-app-form-tags"),
                            l = n.find('input[name="category"]').val();
                        l.replace(/\s/g, "") &&
                        $.ajax({
                            method:'post',
                            url:"${pageContext.request.contextPath}/category/edit",
                            dataType:"jsonp",
                            data:{
                                "category":t.data
                            },
                            success:function(data){
                                if(data&&data.code == 0){
                                    layer.msg("修改成功！",{icon:1})
                                    t.update({category: l}),
                                        table.reload()
                                }
                                else{
                                    layer.msg("修改失败！",{icon:2})
                                }
                            },
                            error:function(e){
                                layer.msg("修改失败！",{icon:2})
                            },

                        })
                        //发送更新请求
                        //     console.log(t),
                        layer.close(e))
                    },
                    success: function (t, e) {
                        var n = t.find("iframe").contents().find("#layuiadmin-app-form-tags").click();
                        n.find('input[name="category"]').val(i.tags)
                    }
                })
            }
        })
        var active = {
            add: function(){
                layer.open({
                    type: 1
                    ,title: '添加分类'
                    ,content: '  <div class="layui-form" lay-filter="layuiadmin-form-tags" id="layuiadmin-app-form-tags" style="padding-top: 30px; text-align: center;">\n' +
                        '    <div class="layui-form-item">\n' +
                        '      <label class="layui-form-label">分类名</label>\n' +
                        '      <div class="layui-input-inline">\n' +
                        '        <input type="text" name="category" lay-verify="required" placeholder="请输入..." autocomplete="off" class="layui-input">\n' +
                        '      </div>\n' +
                        '    </div>\n' +
                        '  </div>'
                    ,area: ['450px', '200px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){
                        var othis = layero.find("#layuiadmin-app-form-tags")
                            ,tags = othis.find('input[name="category"]').val();

                        if(!tags.replace(/\s/g, '')) return;
                        //添加操作
                        $.ajax({
                            method:'post',
                            url:"${pageContext.request.contextPath}/category/add",
                            dataType:"jsonp",
                            data:{
                                "category":tags
                            },
                            success:function(data){
                                if(data&&data.code == 0){
                                    layer.msg("提交成功！",{icon:1})
                                    setTimeout(window.location.reload())
                                }
                                else{
                                    layer.msg("提交失败！",{icon:2})
                                }
                            },
                            error:function(e){
                                layer.msg("提交失败！",{icon:2})
                            },

                        })

                        table.reload('LAY-app-content-tags');
                        layer.close(index);
                    }
                });
            }
        }
        $('.layui-btn.layuiadmin-btn-tags').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
