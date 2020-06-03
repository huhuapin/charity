<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/5/29
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>慈善机构管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<jsp:include page="./layout/index.jsp"></jsp:include>
<div class="layui-body" id="LAY_app_body">
    <div class="layadmin-tabsbody-item layui-show">
        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div class="layui-form-item">

                        <div class="layui-inline">
                            <label class="layui-form-label">机构名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="author" placeholder="请输入" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <button class="layui-btn layuiadmin-btn-list" lay-submit
                                    lay-filter="LAY-app-contlist-search">
                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="layui-card-body">
                    <div style="padding-bottom: 10px;">
                        <button class="layui-btn layuiadmin-btn-list" data-type="add">添加</button>
                    </div>

                    <table id="LAY-app-content-list" lay-filter="LAY-app-content-list"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp"></jsp:include>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index', //主入口模块
    }).use(['index', 'form', 'table'], function () {
        var table = layui.table
            , form = layui.form;

        //监听搜索
        form.on('submit(LAY-app-contlist-search)', function (data) {
            var field = data.field;

            //执行重载
            table.reload('LAY-app-content-list', {
                where: field
            });
        });

    //第一个实例
    table.render({
        elem: '#LAY-app-content-list'
        ,data : [{
                "id": "001"
                ,"label": "美食"
                ,"title": "舌尖上的中国第一季"
                ,"author": "作者-1"
                ,"content": "通过中华美食的多个侧面，来展现食物给中国人生活带来的仪式、伦理等方面的文化；见识中国特色食材以及与食物相关、构成中国美食特有气质的一系列元素；了解中华饮食文化的精致和源远流长"
                ,"uploadtime": 20121204
                ,"status": true
            },{
                "id": "002"
                ,"label": "美食"
                ,"title": "舌尖上的中国第二季"
                ,"author": "作者-2"
                ,"content": "以食物为窗口，读懂中国——通过美食，使人们可以有滋有味地认知这个古老的东方国度。“一方水土一方人”，本片将通过展示人们日常生活中与美食相关的多重侧面，描绘与感知中国人的文化传统、家族观念、生活态度与故土难离。人们收获、保存、烹饪、生产美食，并在其过程中留存和传承食物所承载的味觉记忆、饮食习俗、文化样态与家常情感。"
                ,"uploadtime": 20141204
                ,"status": false
            },{
                "id": "003"
                ,"label": "美食"
                ,"title": "舌尖上的中国第三季"
                ,"author": "作者-3"
                ,"content": "以食物为窗口，读懂中国——通过美食，使人们可以有滋有味地认知这个古老的东方国度。“一方水土一方人”，本片将通过展示人们日常生活中与美食相关的多重侧面，描绘与感知中国人的文化传统、家族观念、生活态度与故土难离。人们收获、保存、烹饪、生产美食，并在其过程中留存和传承食物所承载的味觉记忆、饮食习俗、文化样态与家常情感将世界美食和中国美食进行比照。春耕、夏耘、秋收、冬藏，天人合一的东方哲学让中国饮食依时而变，智慧灵动，中医营养摄生学说创造了食材运用的新天地，儒家人伦道德则把心意和家的味道端上我们的餐桌。淘洗历史，糅合时光，一代又一代的中国人在天地间升起烟火，用至精至诚的心意烹制食物，一餐一食之间，中国人展示个性，确认归属，构建文明，理解和把握着世界的奥妙。"
                ,"uploadtime": 20161204
                ,"status": false
            },{
                "id": "004"
                ,"label": "历史"
                ,"title": "诸葛亮骂王朗"
                ,"author": "作者-1"
                ,"content": "皓首匹夫！苍髯老贼！你即将命归于九泉之下，届时，有何面目见汉朝二十四代先帝？二臣贼子！你枉活七十有六，一生未立寸功，只会摇唇舞舌，助曹为虐！一条断脊之犬，还敢在我军阵前狺狺狂吠！我从未见过如此厚颜无耻之人！！！"
                ,"uploadtime": 20180201
                ,"status": false
            },{
                "id": "005"
                ,"label": "新闻"
                ,"title": "新时代特色中国梦"
                ,"author": "作者-1"
                ,"content": "今天，我们比历史上任何时期都更接近、更有信心和能力实现中华民族伟大复兴的目标。新时代已经到来，蓝图已经绘就，中国梦离我们越来越近了。"
                ,"uploadtime": 20180512
                ,"status": false
            },{
                "id": "006"
                ,"label": "新闻"
                ,"title": "新时代特色中国梦"
                ,"author": "作者-2"
                ,"content": "梦想不会主动走向我们，只有我们去主动实现梦想。行百里者半九十。虽然中国梦离我们越来越近了，但是要实现中国梦，还要靠我们以永不懈怠的精神状态、功在不舍的坚强意志，不忘初心，继续前进。"
                ,"uploadtime": 20180514
                ,"status": false
            },{
                "id": "007"
                ,"label": "体育"
                ,"title": "皇马大战利物浦"
                ,"author": "作者-3"
                ,"content": "对欧足联而言，更想要产生个新冠军。连续三年都是同一个冠军队，这会毁掉欧冠……”格里姆表态，“皇马有梦幻般的阵容，但从促进竞争的角度而言，另一支球队获胜会更好。"
                ,"uploadtime": 20180515
                ,"status": false
            },{
            "id": "007"
            ,"label": "体育"
            ,"title": "皇马大战利物浦"
            ,"author": "作者-3"
            ,"content": "对欧足联而言，更想要产生个新冠军。连续三年都是同一个冠军队，这会毁掉欧冠……”格里姆表态，“皇马有梦幻般的阵容，但从促进竞争的角度而言，另一支球队获胜会更好。"
            ,"uploadtime": 20180515
            ,"status": false
        },{
            "id": "007"
            ,"label": "体育"
            ,"title": "皇马大战利物浦"
            ,"author": "作者-3"
            ,"content": "对欧足联而言，更想要产生个新冠军。连续三年都是同一个冠军队，这会毁掉欧冠……”格里姆表态，“皇马有梦幻般的阵容，但从促进竞争的角度而言，另一支球队获胜会更好。"
            ,"uploadtime": 20180515
            ,"status": false
        },{
            "id": "007"
            ,"label": "体育"
            ,"title": "皇马大战利物浦"
            ,"author": "作者-3"
            ,"content": "对欧足联而言，更想要产生个新冠军。连续三年都是同一个冠军队，这会毁掉欧冠……”格里姆表态，“皇马有梦幻般的阵容，但从促进竞争的角度而言，另一支球队获胜会更好。"
            ,"uploadtime": 20180515
            ,"status": false
        },{
            "id": "007"
            ,"label": "体育"
            ,"title": "皇马大战利物浦"
            ,"author": "作者-3"
            ,"content": "对欧足联而言，更想要产生个新冠军。连续三年都是同一个冠军队，这会毁掉欧冠……”格里姆表态，“皇马有梦幻般的阵容，但从促进竞争的角度而言，另一支球队获胜会更好。"
            ,"uploadtime": 20180515
            ,"status": false
        }]
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'id', title: 'ID', sort: true, fixed: 'left'}
            ,{field: 'label', title: '类别'}
            ,{field: 'title', title: '标题', sort: true}
            ,{field: 'author', title: '城市'}
            ,{field: 'content', title: '签名'}
            ,{field: 'uploadtime', title: '积分', sort: true}
            ,{field: 'status', title: '评分', templet : function (d) {
                // <button class="layui-btn layui-btn-xs">已发布</button>
                // <button class="layui-btn layui-btn-primary layui-btn-xs">待修改</button>
                    if (d.status == true)
                        return "正常"
                    else
                        return "异常"
                }}
            ,{field: 'caozuo',title: '操作',templet :function (d) {
                    return '<a href="${pageContext.request.contextPath}/add/'+d.id +'" class="layui-btn">添加</a>'

                        // <div class="layui-table-cell laytable-cell-1-0-7"> <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a> <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> </div>
                }}
        ]]
    })
    });
</script>
</body>
</html>
