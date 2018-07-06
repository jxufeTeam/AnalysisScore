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
    <title>高考首页</title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
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
                <li><a href="ceeinfo.jsp">高考资讯</a></li>
                <li><a href="collegeList.jsp">院校列表</a></li>
                <li><a href="simulationList.jsp">高考试题</a></li>
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
        <div class="layui-carousel" id="main-broadcast" lay-filter="test1">
            <div carousel-item>
                <div style="background: url('img/1.jpg') center">
                    <span style="position: absolute;top: 50px;left: 100px;font-size: 20px; font-weight: bold; color: #fff;">江财欢迎你</span>
                </div>
                <div style="background: url('img/2.png') center">
                    <span style="position: absolute;top: 50px;left: 100px;font-size: 20px; font-weight: bold; color: #fff;">欧阳康为校党委中心组授课</span>
                </div>
                <div style="background: url('img/3.jpg') center">
                    <span style="position: absolute;top: 50px;left: 100px;font-size: 20px; font-weight: bold; color: #fff;">国际夏令营顺利开营</span>
                </div>
                <div style="background: url('img/4.jpg') center">
                    <span style="position: absolute;top: 50px;left: 100px;font-size: 20px; font-weight: bold; color: #000;">最美时光在江财</span>
                </div>
            </div>
        </div>
        <div class="main-overview-wrap">
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                </ul>
            </div>
            <div class="main-overview">
                <div class="main-overview-header">
                    <h2>高校资讯</h2>
                    <a>更多<i class="layui-icon layui-icon-right"></i></a>
                </div>
                <ul class="main-overview-content">
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content-right layui-col-md4">
        <div class="count-down">
            <span>距离2018年全国高考已经过去</span>
            <span></span>
            <span>天</span>
        </div>
        <script>
            // $('.count-down span').eq(1).html((6 - (new Date().getDate())) < 10 ? ('0' + (6 - (new Date().getDate()))) : 6 - (new Date().getDate()));

            $('.count-down span').eq(1).html(Math.abs((6 - (new Date().getDate()))) < 10 ? ('0' + Math.abs((6 - (new Date().getDate())))) : Math.abs((6 - (new Date().getDate()))));
        </script>
        <div class="layui-inline" id="main-date" style="left: 12.5%; margin-bottom: 20px"></div>
        <div class="main-simulation">
            <div class="main-simulation-header">精品试题推荐</div>
            <ul class="main-simulation-content">
            </ul>
        </div>
    </div>
</div>
<script>
    function freshSimulation(data){
        request({},'POST','/simulation/getMainList',refreshSimulation)
    }
    
    function refreshSimulation(data) {
        var value = JSON.parse(data);
        $.each(value, function (index) {
            var li = $('<li></li>');
            var span = $('<span class="layui-badge layui-bg-blue">' + (index + 1) + '</span>');
            var a = $('<a href="' + value[index].link + '">' + value[index].name + '</a>');
            li.append(span);
            li.append(a);
            $('.main-simulation-content').append(li);
        })
    }

    function freshCeEinfo(data){
        request({},'POST','/ceeinfo/getMainList?start=1&count=5&category=高考新闻',refreshCeEinfo)
    }

    function refreshCeEinfo(data){
        var value = JSON.parse(data);
        $.each(value, function(index){
            var li = $('<li></li>');
            var a = $('<a href="detail.jsp?' + value[index].id +'">' + value[index].title +'</a>');
            var span = $('<span>' + value[index].time + '</span>');
            li.append(a);
            li.append(span);
            $('.main-overview-content').append(li);
        });
    }

    freshSimulation();
    freshCeEinfo();

    function request(object, method, methodURL, successFunction) {
        $.ajax({
            url: methodURL,
            type: method,
            data: JSON.stringify(object),
            contentType: "application/json",
            dataType: "json",
            async: false,
            success: successFunction,
            error: function (data) {
                console.log('error!');
            }
        });
    }

    layui.use(['carousel','laydate'], function(){
        var carousel = layui.carousel;
        var laydate = layui.laydate;
        //建造实例
        carousel.render({
            elem: '#main-broadcast'
            ,width: '100%' //设置容器宽度
        });
        //监听轮播切换事件
        carousel.on('change(test1)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
            console.log(obj.index); //当前条目的索引
            console.log(obj.prevIndex); //上一个条目的索引
            console.log(obj.item); //当前条目的元素对象
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
