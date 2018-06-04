<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/3/15
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/mainPageStyle.css" rel="stylesheet">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
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
                <li><a>高考首页</a></li>
                <li><a>高考资讯</a></li>
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
<div class="layui-container layui-row" style="margin-top: 40px;">
    <div class="main-content-center layui-col-md8">
        <div class="layui-carousel" id="main-broadcast">
            <div carousel-item>
                <div>条目1</div>
                <div>条目2</div>
                <div>条目3</div>
                <div>条目4</div>
                <div>条目5</div>
            </div>
        </div>
        <div class="main-overview-wrap">
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                    <li>
                        <a>湖北：异地高考考生6年增34倍</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>山东下发通知：违规参加高考替考者将入刑定罪</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>北京高招办：高考开考15分钟后不得进考点考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南省招办：高考生身份验证未通过可先入场考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南高考录取：集中录取7个批次持续34天</a>
                        <span>2018-06-01</span>
                    </li>
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                    <li>
                        <a>湖北：异地高考考生6年增34倍</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>山东下发通知：违规参加高考替考者将入刑定罪</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>北京高招办：高考开考15分钟后不得进考点考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南省招办：高考生身份验证未通过可先入场考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南高考录取：集中录取7个批次持续34天</a>
                        <span>2018-06-01</span>
                    </li>
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                    <li>
                        <a>湖北：异地高考考生6年增34倍</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>山东下发通知：违规参加高考替考者将入刑定罪</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>北京高招办：高考开考15分钟后不得进考点考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南省招办：高考生身份验证未通过可先入场考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南高考录取：集中录取7个批次持续34天</a>
                        <span>2018-06-01</span>
                    </li>
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                    <li>
                        <a>湖北：异地高考考生6年增34倍</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>山东下发通知：违规参加高考替考者将入刑定罪</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>北京高招办：高考开考15分钟后不得进考点考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南省招办：高考生身份验证未通过可先入场考试</a>
                        <span>2018-06-01</span>
                    </li>
                    <li>
                        <a>河南高考录取：集中录取7个批次持续34天</a>
                        <span>2018-06-01</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content-right layui-col-md4">
        <div class="count-down">
            <span>距离2018年全国高考还有</span>
            <span>04</span>
            <span>天</span>
        </div>
        <script>
            $('.count-down span').eq(1).html((6 - (new Date().getDate())) < 10 ? ('0' + (6 - (new Date().getDate()))) : 6 - (new Date().getDate()));
        </script>
        <div class="layui-inline" id="main-date" style="left: 12.5%; margin-bottom: 20px"></div>
        <div class="main-simulation">
            <div class="main-simulation-header">精品试题推荐</div>
            <ul class="main-simulation-content">
                <li><span class="layui-badge layui-bg-blue">1</span><a>海南省海口市高二英语期末调研测试题</a></li>
                <li><span class="layui-badge layui-bg-blue">2</span><a>甘肃省白银阳光高级中学高二英语期末考试</a></li>
                <li><span class="layui-badge layui-bg-blue">3</span><a>重庆市万州区高二物理期末质量监测</a></li>
                <li><span class="layui-badge layui-bg-blue">4</span><a>云南省昆明市第十二中学高二物理期末考试</a></li>
                <li><span class="layui-badge layui-bg-blue">5</span><a>河北省承德市联校高二物理期末考试</a></li>
                <li><span class="layui-badge layui-bg-blue">6</span><a>天津市耀华中学高二（上）化学期末试卷</a></li>
                <li><span class="layui-badge layui-bg-blue">7</span><a>四川省广安市高二上化学期末试卷</a></li>
                <li><span class="layui-badge layui-bg-blue">8</span><a>河北省承德市联校高二上地理期末考试</a></li>
                <li><span class="layui-badge layui-bg-blue">9</span><a>湖南省汉寿县普通高中地理期末测试题</a></li>
                <li><span class="layui-badge layui-bg-blue">10</span><a>广东省揭阳市产业园区高二历史期末考试</a></li>
            </ul>
        </div>
    </div>
</div>
<script>
    layui.use(['carousel','laydate'], function(){
        var carousel = layui.carousel;
        var laydate = layui.laydate;
        //建造实例
        carousel.render({
            elem: '#main-broadcast'
            ,width: '100%' //设置容器宽度
        });
        laydate.render({
            elem: '#main-date'
            ,position: 'static'
            ,mark: {
                '2018-6-6': '高考'
            }
        });
    });
</script>
</body>
</html>
