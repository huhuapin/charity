

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layer iframe 示例</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <style>
        body{padding:10px; font-size:14px; background:#fff; width:95%; margin:0 auto; font-size:14px; line-height:20px; overflow:hidden;}
        p{margin-bottom:10px;}
        input{border:1px solid #999; padding:5px 10px; margin:0 10px 10px 0;}
    </style>
</head>
<body>

<input class="layui-input" placeholder="标记" id="LAY_mark">

<div class="layui-btn-container">
    <div class="layui-form" lay-filter="layuiadmin-form-tags" id="layuiadmin-app-form-tags" style="padding-top: 30px; text-align: center;">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" lay-verify="required" placeholder="请输入..." autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容</label>
            <textarea id="content" style="display: none;" name="content"></textarea>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['layer','layedit'], function(){
        var $ = layui.$
            ,layer = layui.layer
            ,index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        var layedit = layui.layedit;
        layedit.build('content'); //建立编辑器
        var active = {
            //让层自适应iframe
            auto: function(){
                $('body').append('插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。');
                parent.layer.iframeAuto(index);
            }

            //在父层弹出一个层
            ,parentPopup: function(){
                top.layer.msg('Hi, man', {shade: 0.3})
            }

            //给父页面传值
            ,setParent: function(){
                var id = '#LAY_layer_iframe_demo'
                    ,mark = $('#LAY_mark')
                    ,val = mark.val();

                if(val === ''){
                    mark.focus();
                    parent.layer.msg('请填写标记');
                    return true;
                }

                parent.layer.msg('您将标记 [ ' +val + ' ] 成功传送给了父窗口');
                parent.layui.$(id).text('我被改变了');
                parent.layer.tips('Look here', id, {
                    time: 5000
                });
                parent.layer.close(index);
            }


            //在内部关闭iframe
            ,close: function(set){
                parent.layer.close(index);
            }
        }

        $('.layui-btn-container .layui-btn').on('click', function(){
            var othis = $(this)
                ,type = othis.data('type');
            active[type] && active[type].call(this);
        });
    });
</script>
</body>
</html>
