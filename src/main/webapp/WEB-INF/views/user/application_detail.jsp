<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 22:23
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
    <link rel="stylesheet" href="https://a.alipayobjects.com/charityprod/charityprod.donate-1.8.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/template.css">
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
            <div class="ui-round-corner-content  donate-gap">
                <div class="donate-detail-content fn-clear">
                    <img alt="扶贫果树进农家" width="300" height="189" class="ui-donate-img-large fn-left" seed="donateDetailContent-imgLifeDonateCert201302261558539976120130226160921270271" smartracker="on" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=OPZLDFgJSTub3f6pUHl8DgAAACMAAQED&amp;zoom=original">
                    <div class="donate-detail-info donate-detail-info-personal">
                        <div class="donate-detail-info-content-title fn-clear">
                            <h2 class="fn-left donate-detail-title">扶贫果树进农家</h2>
                        </div>
                        <div class="donate-list-info-puborg">
                            <div class="donate-list-info-puborg-mask"></div>
                            <div class="donate-list-info-puborg-text">发布机构：河北慈善联合基金会</div>

                        </div>
                        <p class="donate-list-info donate-info-content-item">
                            已募善款：<em class="ft-amount-16 ft-orange ft-bold">24381.13</em>
                            元
                        </p>
                        <p class="donate-list-info donate-info-content-item">筹款目标：
                            <span class="donate-info-amount-left">118800.00</span> 元
                        </p>
                        <p class="donate-list-info donate-info-content-item">
                            募捐方案备案编号：53130000052692053DA18007
                        </p>
                        <p class="donate-list-info donate-info-content-item">
                            参捐人数：<em class="ft-green">545</em> 人参与捐助
                        </p>

                        <div class="ui-progressbar-float fn-clear">
                            <p>捐款进度：</p>
                            <div class="ui-progressbar-wrapper-s">
                                <div class="ui-progressbar-s" style="width:20.52%">
                                    <span>20.52%</span>
                                </div>
                            </div>
                        </div>


                        <p class="donate-list-info donate-info-content-item">项目时间：2020-05-21 至 2020-06-08</p>


                        <div class="donate-itemDetail-active">
                            <a class="donate-button donate-button-large-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052116072823002" seed="donateItemDetailActive-donateButton" smartracker="on">
                                <span class="donate-button-text">我要捐助</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="donate-detail-intro donate-gap" id="anchor-intro">
                <div class="ui-round-corner-content">
                    <div class="donate-detail-anchor">
                        <div class="layui-tab" lay-filter="detail">
                            <ul id="J-detailTabTrigger" class="layui-tab-title donate-detail-anchor-content">
                                <li class="layui-this">项目介绍</li>
                                <li>善款去向</li>
                            </ul>
                    <div id="J-detailTabContent"class="layui-tab-content">
                        <div id="J-intro" class="layui-tab-item layui-show donate-detail-intro-content J-basicDesc"><h3>荒凉的土地，贫困的家庭，举步维艰</h3><p>李爷爷今年65岁，生活在一个贫困的小山村，儿子因意外造成智力低下，丧失劳动能力，儿媳忍受不了家庭贫困离家打工，留下3个年幼的孩子，了无音信，家庭的重担仅靠爷爷一个人种地的微薄收入支撑，尽管一刻不闲还是入不敷出，家中的窘迫，抓襟见肘，有几次家里连下锅做饭的米都没了，为了孩子们能有学上，将来走出大山，摆脱贫困，改变命运，爷爷咬紧牙关，默默的承受着这一切，爷爷常说再穷不能穷教育，再苦不能苦孩子，不能因贫困耽误了孩子们上学受教育呀！</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=p6g-THzqSHu8WphlKtdVqQAAACMAAQED&amp;zoom=original" seed="mediaWrap-mediaWrap" smartracker="on"></div><p></p><p>可他们所在的村子地处偏僻，祖祖辈辈都靠种植农作物为生，年轻人在种地上看不到希望，纷纷外出打工谋生去了，留下的都是些老人和儿童，村里的人越来越少，土地荒废的面积越来越多，李爷爷也因年龄的增长，渐渐体力不支，为了维持全家的生活，爷爷开始种植些方便管理且收入较高的果树来减轻家里的负担。</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=9NFKho9KRQe0i1I74GXXuQAAACMAAQED&amp;zoom=original" seed="mediaWrap-mediaWrapT1" smartracker="on"></div><p></p><p>通过爷爷精心管理，果树开始结出累累硕果，不但缓解了家中的窘迫，还让孩子们上了重点学校。爷爷从中尝到甜头，从此开始开垦荒地，带领着村里人一起种植果树，奈何村庄贫穷偏僻，没有年轻劳力，原有的果树品种老化，产量低下，没有现成高品质树苗，这些问题困扰着这些急需脱贫的农民，让他们苦恼不已。</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=l64IULxhRMWu_rQD-xVg3AAAACMAAQED&amp;zoom=original" seed="mediaWrap-mediaWrapT2" smartracker="on"></div><p></p><h3>种下一棵果树，脱贫迈进一大步</h3><p>为认真贯彻落实习近平主总书记关于扶贫、脱贫工作重要指示精神，打响脱贫、扶贫攻坚战，开展农村专业技术扶贫新思路，鼓励农民自主创业，早日脱贫致富。为此河慈联-邯郸站倡议发起 为10户贫困家庭募集6000棵优质嫁接果树苗，推进乡村早日脱贫致富，为贫苦困乡村贡献力量。</p><p></p><h3>项目执行计划</h3><p>该项目以志愿者全环节参与的形式，通过河北慈善联合基金会的志愿者的走访调查，并确定帮扶名单，预计为 10户贫困家庭发放每户600棵树苗。</p><p>1、服务时间：2020年5月-2021年5月</p><p>2、帮扶地区：河北省地区</p><p>3、受助对象：贫困家庭</p><p></p><h3>项目预算</h3><p>（1）本项目主要为邯郸地区的10户贫困家庭，提供扶贫果树苗6000棵，后期如有增加，将在项目中公式说明</p><p>（2）预算明细表</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=A4QTcCFdT1qbDpScZEn8GAAAACMAAQED&amp;zoom=original" seed="mediaWrap-mediaWrapT3" smartracker="on"></div><p>预算审核说明：河北慈善联合基金会已根据基金会预算采购标准及采购流程规范对本项目的预算进行审核，确认符合基金会的预算制定规范及采购规范，如有疑问，可联系：基金会电话0311-69039212邮箱xmb@mail.hbcsw.org:</p><h3></h3><h3>执行机构</h3><p>河北慈善联合基金会是河北省民政厅批准登记注册，具有独立法人资格的非营利性社会公益组织，属于全省性公募基金会。致力于开展扶老助残、助学帮困、公益倡导、灾难救援，帮助社会弱势群体改善生活现状，脱离贫困救助的公益事业。</p><h3></h3><h3>捐赠收据说明</h3><p>河北慈善联合基金会将为您开具捐赠发票，需要捐赠发票的爱心用户须将以下信息（捐赠人姓名、开票抬头、金额、捐赠截图、电话、地址等）发至邮箱xmb@mail.hbcsw.org申请，联系电话0311-69039212。基于人力及邮寄成本的考虑，建议您在当年累计捐赠满100元后申请捐赠收据，请您务必于捐赠当年索取捐赠票据。感恩您的信任和理解。 </p>
                        </div>
                        <div id="J-feedback" class="layui-tab-item donate-detail-application donate-gap J-feed-back J-basicDesc J-Desc1">
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

                        <%--                            <div class="donate-detail-application-content"><div class="donate-detail-application-content-none">组织者还没有反馈本项目善款去向，请您继续关注支付宝公益。<a href="http://weibo.com/gyalipay" target="_blank">关注我们的官方微博</a>。</div></div>--%>

                        </div>
                    </div>
                    </div>
                    </div>
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
<script>
    layui.use('element', function(){
        var element = layui.element;
        //…
    });
</script>
</body>
</html>
