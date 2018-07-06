<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/6/11
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>高考试题</title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
    <link href="css/simulationStyle.css?version=20180614" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link href="lib/layui/css/layui.css" rel="stylesheet">
    <script src="lib/layui/layui.js"></script>
</head>
<body>
<div class="main-header">
    <div class="layui-container" style="padding-top: 56px">
        <div class="main-logo-wrap">
            <img src="img/logo_new.png">
        </div>
        <div class="main-menu-wrap">
            <ul class="main-menu">
                <li><a href="index.jsp">高考首页</a></li>
                <li><a href="ceeinfo.jsp">高考资讯</a></li>
                <li><a href="collegeList.jsp">院校列表</a></li>
                <li><a>高考试题</a></li>
                <li><a>高考报考</a></li>
                <li><a href="forecast.jsp">分数线</a></li>
            </ul>
        </div>
        <%--<div class="main-code-wrap">--%>
        <%--<div class="main-weixin">--%>
        <%--<div></div>--%>
        <%--<span>微信</span>--%>
        <%--</div>--%>
        <%--<div class="main-code"></div>--%>
        <%--</div>--%>
    </div>
</div>

<div class="hr_10"></div>
<!--正文-->
<div class="wrapper">
    <!--左边-->
    <div class="grid260">
        <!--左边上面-->
        <div class="perinfo">
            <div class="nologin">
                <p class="tc">十万试题 免费下载</p>
                <p class="tm10">
                    <a class="btnlogin">立即登录</a>
                </p>
            </div>
            <p class="tm20"></p>
            <div class="search">
                <input id="keywd" name="keywd" type="text" class="searchinput" placeholder="搜索试题" />
                <input type="button" class="btnicon" />
            </div>
        </div>
        <!--左边下面-->
        <div class="perside">
            <dl>
                <dt>高考题库</dt>
                <dd>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th scope="row">年份:</th>
                            <td>
                                <a>2018</a>
                                <a>2017</a>
                                <a>2016</a>
                                <a>2015</a>
                                <a>2014</a>
                                <a>2013</a>
                                <a>2012</a>
                                <a>2011</a>
                                <a>2010</a>
                                <a>更早</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">科目:</th>
                            <td>
                                <a>语文</a>
                                <a>数学</a>
                                <a>英语</a>
                                <a>政治</a>
                                <a>历史</a>
                                <a>地理</a>
                                <a>生物</a>
                                <a>物理</a>
                                <a>化学</a>
                                <a>理综</a>
                                <a>文综</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">类型:</th>
                            <td>
                                <a>真题</a>
                                <a>一模试题</a>
                                <a>二模试题</a>
                                <a>三模试题</a>
                                <a>压轴题</a>
                                <a>复习题</a>
                            </td>
                        </tr>
                    </table>
                </dd>
            </dl>
            <dl>
                <dt>高中题库</dt>
                <dd>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th scope="row">年级:</th>
                            <td>
                                <a>高一</a>
                                <a>高二</a>
                                <a>高三</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">科目:</th>
                            <td>
                                <a>语文</a>
                                <a>数学</a>
                                <a>英语</a>
                                <a>政治</a>
                                <a>历史</a>
                                <a>地理</a>
                                <a>生物</a>
                                <a>物理</a>
                                <a>化学</a>
                                <a>理综</a>
                                <a>文综</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">类型:</th>
                            <td>
                                <a>期末试题</a>
                                <a>期中试题</a>
                                <a>月考试题</a>
                                <a>练习题</a>
                            </td>
                        </tr>
                    </table>
                </dd>
            </dl>
        </div>
    </div>

    <!--中间-->
    <div class="grid730">
        <div class="focus">
            <ul class="focusimg">
                <li style="display: list-item;">
                    <a><img src="img/115608_582e7bd8cb123.jpg" width="482" height="230" /></a>
                </li>
            </ul>
            <div class="focusnum">
                <span class="on">1</span>
            </div>
        </div>
        <div class="calender">
            <a><img src="img/115609_582e7bd9c5b82.jpg" width="236" height="230" /></a>
        </div>
        <div class="hr_10"></div>
        <div class="btnnav">
            <a style="float: left;">
                <font class="cb9">汇集全国高一到高三各科精选练习题总计19297套，本日新增0套</font>
                <span class="c12">
							高中题库
							<i class="icon"></i>
						</span>
            </a>
            <a style="float: right;">
                <font class="cb9">历年高考真题大全、汇集最新模拟题总计3499套，本日新增0套</font>
                <span class="c12">
							高考题库
							<i class="icon"></i>
						</span>
            </a>
        </div>
        <div class="list">
            <div class="listtitle">
                <h2 style="float: left;">
                    <em>高中试题</em>
                    <i class="icon"></i>
                </h2>
                <a style="float: right;" class="cb6">更多试题>></a>
            </div>
            <ul class="clearfix">
                <li>
                    <s class="format"></s>
                    <a href="#">北京市延庆区2018届高三第一次模...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">北京市丰台区2018届高三一模语文试题</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">云南省昆明市2018届高三教学质量...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">新疆乌鲁木齐市2018年高三年级第...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">陕西省榆林市2018届高三第二次模...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">陕西省咸阳市2018届高三模拟检测...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">山西省太原市2018届高三3月模拟...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">山东省枣庄市2018届高三第二次模...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">宁夏吴忠市2018届高三下学期高考...</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">宁夏吴忠市2018届高三下学期高考...</a>
                </li>
            </ul>
        </div>
        <div class="list">
            <div class="listtitle">
                <h2 style="float: left;">
                    <em>高考试题</em>
                    <i class="icon"></i>
                </h2>
                <a style="float: right;" class="cb6">更多试题>></a>
            </div>
            <ul class="clearfix">
                <li>
                    <s class="format"></s>
                    <a href="#">高三英语代词分类及要点分析</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">英语代词考点分析</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">高三英语代词专练</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">高考复习- 代词练习及答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年浙江语文高考试题答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年浙江英语高考试题答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年浙江数学高考试题答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年天津语文高考试题答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年天津英语高考试题答案</a>
                </li>
                <li>
                    <s class="format"></s>
                    <a href="#">2017年天津文综高考试题答案</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="hr_10"></div>
</div>
<!--底部-->
<div class="footer">
    <div class="wrapper2">
        <dl class="city">
            <dt class="ft18">城市导航</dt>
            <dd>
                <a>北京高考</a>
                <a>上海高考</a>
                <a>天津高考</a>
                <a>重庆高考</a>
                <a>广东高考</a>
                <a>江苏高考</a>
                <a>山东高考</a>
                <a>浙江高考</a>
                <a>湖北高考</a>
                <a>四川高考</a>
                <a>广西高考</a>
                <a>黑龙江高考</a>
                <a>湖南高考</a>
                <a>辽宁高考</a>
                <a>海南高考</a>
                <a>宁夏高考</a>
                <a>福建高考</a>
                <a>甘肃高考</a>
                <a>河北高考</a>
                <a>吉林高考</a>
                <a>江西高考</a>
                <a>云南高考</a>
                <a>河南高考</a>
                <a>内蒙古高考</a>
                <a>陕西高考</a>
                <a>山西高考</a>
                <a>安徽高考</a>
                <a>新疆高考</a>
                <a>西藏高考</a>
                <a>贵州高考</a>
                <a>青海高考</a>
                <a>港澳高考</a>
            </dd>
        </dl>
        <div class="tc">
            <p>
                <a>关于我们</a>
                -
                <a>广告服务</a>
                -
                <a>友情链接</a>
                -
                <a>网站地图</a>
                -
                <a>服务条款</a>
                -
                <a>诚聘英才</a>
                -
                <a>联系我们</a>
            </p>
            <p>
                <a>京ICP备09042963号-9</a> 北京市公安局海淀分局备案编号：1101081950
            </p>
            <p>高考网版权所有 Copyright © 2005-2014 www.gaokao.com. All Rights Reserved.</p>
        </div>
    </div>
</div>
</body>
</html>
