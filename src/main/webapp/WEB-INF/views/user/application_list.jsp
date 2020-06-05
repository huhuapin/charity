<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/5
  Time: 22:03
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
            <div class="ui-round-corner-content donate-gap">
                <ul class="donate-filter fn-clear">
                    <li class="charity-project-filter-item">项目类型：</li>
                    <li class="charity-project-filter-item">
                        <a href="https://love.alipay.com/donate/itemList.htm?itemClassified=&amp;orderType=gmt_create_desc&amp;donateShowName=" seed="charityProjectFilterItem-link" smartracker="on">全部</a>
                    </li>
                    <li class="charity-project-filter-item">
                        <a href="https://love.alipay.com/donate/itemList.htm?donateType=&amp;itemClassified=1&amp;orderType=gmt_create_desc&amp;donateShowName=" seed="charityProjectFilterItem-linkT1" smartracker="on">教育助学</a>
                    </li>
                    <li class="charity-project-filter-item">
                        <a href="https://love.alipay.com/donate/itemList.htm?donateType=&amp;itemClassified=2&amp;orderType=gmt_create_desc&amp;donateShowName=" class="current" seed="charityProjectFilterItem-current" smartracker="on">扶贫救灾</a>
                    </li>
                    <li class="charity-project-filter-item">
                        <a href="https://love.alipay.com/donate/itemList.htm?donateType=&amp;itemClassified=3&amp;orderType=gmt_create_desc&amp;donateShowName=" seed="charityProjectFilterItem-linkT2" smartracker="on">医疗救助</a>
                    </li>
                    <li class="charity-project-filter-item">
                        <a href="https://love.alipay.com/donate/itemList.htm?donateType=&amp;itemClassified=4&amp;orderType=gmt_create_desc&amp;donateShowName=" seed="charityProjectFilterItem-linkT3" smartracker="on">其他</a>
                    </li>
                </ul>

            </div>
            <div class="ui-round-corner-content donate-gap">
                <ul class="donate-item-default">
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052913405512947" seed="donateItemDefaultLeft-donateItemDefaultPicA" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=-rClXQpBSE2XnrGrBNO_1QAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052913405512947" seed="donateItemDefaultActive-donateButton" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[其他]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052913405512947" seed="donateItemDefaultTitle-link" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    帮扶困境养老护理员，感谢她们用爱和温暖陪伴老人！
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052913405512947" seed="donateItemDefaultDesc-donateItemDefaultMore" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：浙江省慈善联合总会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">1429.37</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-29   至 2020-08-29</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">72</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=202005281021106468" seed="donateItemDefaultLeft-donateItemDefaultPicAT1" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=LuXsDocCRmCVd4RxYjfwAAAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=202005281021106468" seed="donateItemDefaultActive-donateButtonT1" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=202005281021106468" seed="donateItemDefaultTitle-linkT1" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    善心不分大小，一起帮助贫困家庭大病患者，助力他们迎接生命的曙光。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=202005281021106468" seed="donateItemDefaultDesc-donateItemDefaultMoreT1" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：河北慈善联合基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">259.25</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-28   至 2021-03-31</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">54</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052809450195696" seed="donateItemDefaultLeft-donateItemDefaultPicAT2" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=LYnHAIS5Se2zIJ-0EQgqygAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052809450195696" seed="donateItemDefaultActive-donateButtonT2" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052809450195696" seed="donateItemDefaultTitle-linkT2" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    大一新生不幸患上急性淋巴细胞白血病，移植后又遇严重排异。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052809450195696" seed="donateItemDefaultDesc-donateItemDefaultMoreT2" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：上海市华侨事业发展基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">70681.35</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-28   至 2020-08-28</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">34411</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052714123367832" seed="donateItemDefaultLeft-donateItemDefaultPicAT3" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=wE1KJRbdRLilKW7SDNwvSwAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052714123367832" seed="donateItemDefaultActive-donateButtonT3" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052714123367832" seed="donateItemDefaultTitle-linkT3" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    为乡村困境留守妇女提供就业补贴，助力妇女自强就业、增收脱贫。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052714123367832" seed="donateItemDefaultDesc-donateItemDefaultMoreT3" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：浙江省慈善联合总会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">5190.88</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-27   至 2020-08-27</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">969</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052711393952788" seed="donateItemDefaultLeft-donateItemDefaultPicAT4" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=7XUndbzpRFuhivV8FMnBcgAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052711393952788" seed="donateItemDefaultActive-donateButtonT4" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052711393952788" seed="donateItemDefaultTitle-linkT4" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    为新疆贫困户修建夏季厨房和千坪帮扶
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052711393952788" seed="donateItemDefaultDesc-donateItemDefaultMoreT4" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：新疆维吾尔自治区资助教育基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">106.26</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-27   至 2020-08-27</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">13</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052616513039338" seed="donateItemDefaultLeft-donateItemDefaultPicAT5" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=T5JZ2AtuRoCAvptKkAIrVAAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052616513039338" seed="donateItemDefaultActive-donateButtonT5" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052616513039338" seed="donateItemDefaultTitle-linkT5" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    为农村留守老人提供家禽养殖补贴，助力老人通过家庭散养殖业脱贫。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052616513039338" seed="donateItemDefaultDesc-donateItemDefaultMoreT5" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：浙江省慈善联合总会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">5106.40</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-26   至 2020-08-27</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">1378</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052516554123215" seed="donateItemDefaultLeft-donateItemDefaultPicAT6" smartracker="on">
                                <img class="donate-item-default-pic" alt="" width="157" height="99" src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=zni9JywxSAy_mOgNXhgxswAAACMAAQED&amp;zoom=original">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052516554123215" seed="donateItemDefaultActive-donateButtonT6" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052516554123215" seed="donateItemDefaultTitle-linkT6" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    “爱心助老情暖夕阳”计划，帮助身陷困境的老人，让晚年不再无助！
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052516554123215" seed="donateItemDefaultDesc-donateItemDefaultMoreT6" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：河南省爱心助老基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">61696.31</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-25   至 2020-08-25</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">39509</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052515022472339" seed="donateItemDefaultLeft-donateItemDefaultPicAT7" smartracker="on">
                                <img class="donate-item-default-pic" lazyload-src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=uTi1zCDpToGPTYTRpo2ZTAAAACMAAQED&amp;zoom=original" alt="" width="157" height="99" src="https://t.alipayobjects.com/images/rmsweb/T1XFFgXnBwXXXXXXXX.png">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052515022472339" seed="donateItemDefaultActive-donateButtonT7" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052515022472339" seed="donateItemDefaultTitle-linkT7" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    解决孤寡、贫困、空巢的老人及环卫工人基本温饱问题
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052515022472339" seed="donateItemDefaultDesc-donateItemDefaultMoreT7" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：浙江省微笑明天慈善基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">1835.86</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-25   至 2020-08-25</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">677</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052212402370964" seed="donateItemDefaultLeft-donateItemDefaultPicAT8" smartracker="on">
                                <img class="donate-item-default-pic" lazyload-src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=map5rio7TPKwAXpnoUpW_gAAACMAAQED&amp;zoom=original" alt="" width="157" height="99" src="https://t.alipayobjects.com/images/rmsweb/T1XFFgXnBwXXXXXXXX.png">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052212402370964" seed="donateItemDefaultActive-donateButtonT8" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052212402370964" seed="donateItemDefaultTitle-linkT8" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    设立自然灾害家庭“保障”项目，用于甘肃省镇原县困难家庭生活基本保障。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052212402370964" seed="donateItemDefaultDesc-donateItemDefaultMoreT8" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：天津市红十字会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">69.01</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-22   至 2020-08-28</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">9</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                    <li class="donate-item-default-li fn-clear">
                        <div class="donate-item-default-left">
                            <a class="donate-item-default-pic-a" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052116072823002" seed="donateItemDefaultLeft-donateItemDefaultPicAT9" smartracker="on">
                                <img class="donate-item-default-pic" lazyload-src="https://oalipay-dl-django.alicdn.com/rest/1.0/image?fileIds=A8GJy374T-K4bIGhyy7ghwAAACMAAQED&amp;zoom=original" alt="" width="157" height="99" src="https://t.alipayobjects.com/images/rmsweb/T1XFFgXnBwXXXXXXXX.png">
                            </a>
                            <div class="donate-item-default-progress">
                            </div>
                            <div class="donate-item-default-active">
                                <a class="donate-button donate-button-medium-orange donate-button-single" href="https://love.alipay.com/donate/donateSingle.htm?name=2020052116072823002" seed="donateItemDefaultActive-donateButtonT9" smartracker="on">
                                    <span class="donate-button-text">我要捐助</span>
                                </a>
                            </div>
                        </div>
                        <div class="donate-item-default-right">
                            <dl class="donate-item-default-info">
                                <dt class="donate-item-default-title">
                                    <span class="ft-green">[扶贫救灾]</span>
                                    <a href="https://love.alipay.com/donate/itemDetail.htm?name=2020052116072823002" seed="donateItemDefaultTitle-linkT9" smartracker="on"></a>
                                </dt>
                                <dd class="donate-item-default-desc">
                                    为10户贫困农民，送去扶贫果树苗，助力他们早日脱贫致富。
                                    <a class="donate-item-default-more" href="https://love.alipay.com/donate/itemDetail.htm?name=2020052116072823002" seed="donateItemDefaultDesc-donateItemDefaultMoreT9" smartracker="on">查看详细 &gt;&gt;</a>
                                </dd>
                                <dd class="donate-item-default-dd">发  布  人：河北慈善联合基金会</dd>
                                <p class="donate-list-info donate-info-content-item">

                                    已募善款：<em class="ft-orange ft-bold">24381.12</em>

                                    元
                                </p>
                                <p class="donate-item-default-dd">项目时间：2020-05-21   至 2020-06-08</p>
                                <dd class="donate-item-default-dd">参捐人数：<span class="ft-green">544</span> 人</dd>
                            </dl>
                        </div>
                    </li>
                </ul>
                <div id="page"></div>
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
