<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/6/11
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>高考资讯</title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
    <link href="css/ceeinfoStyle.css" rel="stylesheet">
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
    <div class="layui-col-md6" style="padding-right: 48px;">
        <div class="header">
            <em></em>
            <a>高考新闻</a>
            <span>News</span>
        </div>
        <ul class="nav news-nav">
            <li class="nav-header">地区导航</li>
        </ul>
        <div class="content news"></div>
    </div>
    <div class="layui-col-md6" style="padding-left: 48px;">
        <div class="header">
            <em></em>
            <a>院校动态</a>
            <span>Dynamic</span>
        </div>
        <div class="nav dynamic-nav">
            <li class="nav-header">地区导航</li>
        </div>
        <div class="content dynamic" style="position:relative;">
            <div class="borderL"></div>
        </div>
    </div>
</div>
<script>
    function freshProvince(data){
        request({},'POST','/provincelist/getProvince',refreshProvince);
    }

    function refreshProvince(data){
        var value = JSON.parse(data);
        $.each(value, function(index){
            if(value[index] != '香港' && value[index] != '澳门' && value[index] != '台湾'){
                $('.news-nav').append($('<li><a href="moreceeinfo.jsp?' + value[index] + '&高考新闻">' + value[index] + '</a></li>'));
                $('.dynamic-nav').append($('<li><a href="moreceeinfo.jsp?' + value[index] + '&院校动态">' + value[index] + '</a></li>'));
            }
        });
        $('.news-nav').append($('<li><a href="moreceeinfo.jsp?港澳&高考新闻">港澳</a></li>'));
        $('.dynamic-nav').append($('<li><a href="moreceeinfo.jsp?港澳&院校动态">港澳</a></li>'));
    }

    function freshContent(data){
        request({},'POST','/ceeinfo/getMainList?start=1&count=20&category=' + data,refreshContent);
    }

    function refreshContent(data){
        var value = JSON.parse(data);
        var dom = value[0].category == '高考新闻' ? $('.news') : $('.dynamic');
        var ul1= $('<ul></ul>');
        var ul2= $('<ul></ul>');
        var ul3= $('<ul></ul>');
        var ul4= $('<ul></ul>');
        ul4.css('border','none');
        $.each(value, function (index) {
            var li = $('<li></li>');
            li.append($('<strong>•</strong>'));
            li.append($('<a href="detail.jsp?' + value[index].id +'"> ' + value[index].title + '</a>'));
            li.append($('<span>' + value[index].time + '</span>'));
            switch (parseInt(index / 5)){
                case 0:
                    ul1.append(li);
                    if((index + 1) % 5 == 0){
                        dom.append(ul1);
                    }
                    break;
                case 1:
                    ul2.append(li);
                    if((index + 1) % 5 == 0){
                        dom.append(ul2);
                    }
                    break;
                case 2:
                    ul3.append(li);
                    if((index + 1) % 5 == 0){
                        dom.append(ul3);
                    }
                    break;
                case 3:
                    ul4.append(li);
                    if((index + 1) % 5 == 0){
                        dom.append(ul4);
                    }
                    break;
                default:
                    console.log('error');
            }
        });
        dom.append($('<a class="readMore">查看更多</a>'));
    }

    freshProvince();

    freshContent('高考新闻');

    freshContent('院校动态');

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
</script>
</body>
</html>
