<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/4
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
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
        <div class="layui-col-md-12">
            <div class="carousel">
                <div class="layui-carousel" id="images-carousel">
                    <div carousel-item>
                        <div>
                            <img lay-src="${pageContext.request.contextPath}/img/banner1.jpg" width="100%" height="350px;" />
                        </div>
                        <div>
                            <img lay-src="${pageContext.request.contextPath}/img/banner2.jpg" width="100%" height="350px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md9">
            <div class="article-main">
                <h2>
                    意外住院
                    <span><a href="#">查看更多</a></span>
                </h2>
                <div class="article-container">
                <div class="article-list">
                    <figure><img  lay-src="${pageContext.request.contextPath}/img/application_img.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
                </div>
            </div>
            <div class="article-main">
                <h2>
                    意外住院
                    <span><a href="#">查看更多</a></span>
                </h2>

                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
            </div>
            <div class="article-main">
                <h2>
                    意外住院
                    <span><a href="#">查看更多</a></span>
                </h2>

                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
            </div>
            <div class="article-main">
                <h2>
                    意外住院
                    <span><a href="#">查看更多</a></span>
                </h2>

                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
                <div class="article-list">
                    <figure><img lay-src="../static/images/01.jpg"></figure>
                    <ul>
                        <h3>
                            <a href="article_details.html">父亲意外住院，请帮帮我</a>
                        </h3>
                        <p>年轻的时候父亲烟酒特别重，2014年因脑血栓住院，入院治疗半个月后出院了。很庆幸，人还能正常走路。当时他答应我，烟和酒都不会再碰了，但是事实不是那样，烟越来越重，酒自己也偷喝。现如今他又住院了，被确诊是结核性脑膜炎，看他现在在病床上经受病痛的折磨，时而同情，时而愤怒。。。。。。...</p>
                        <p class="autor">
                            <span class="lm f_l"><a href="#">中国慈善基金总会</a></span>
                            <span class="dtime f_l">5558人捐赠</span>
                            <span class="viewnum f_r">12121213元已募</span>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="layout/rside.jsp"></jsp:include>
    </div>
</div>
<div class="footer">
    <hr class="layui-bg-red">
    <p><a href="http://itdaima.com/">山东理工大学</a> 2020 &copy; <a href="#">版权所有</a></p>
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

    //图片轮播
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#images-carousel'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,anim: 'fade' //切换动画方式
        });
    });

    //返回到顶部
    layui.use('util', function(){
        var util = layui.util
            ,laydate = layui.laydate
            ,layer = layui.layer;
        //固定块
        util.fixbar({
            bar1: false
            ,bar2: false
            ,css: {right: 50, bottom: 50}
            ,bgcolor: '#393D49'
            ,click: function(type){
                if(type === 'bar1'){
                    layer.msg('icon是可以随便换的')
                } else if(type === 'bar2') {
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

    //搜索
    layui.use('form', function(){
        var form = layui.form
            ,layer = layui.layer
    });

</script>
</body>
</html>
