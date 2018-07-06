<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/6/9
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
    <link href="css/detailStyle.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link href="lib/layui/css/layui.css" rel="stylesheet">
    <script src="lib/layui/layui.js"></script>
</head>
<body style="background-color: #f0f0f0">
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
<div class="layui-container">
    <div class="detailContent">
        <header>
            <h1></h1>
            <div class="blogInfo" style="float: none">
                <span></span>
            </div>
        </header>
        <article class="bContent"></article>
        <footer>
            <i class="layui-icon layui-icon-note"></i>
        </footer>
    </div>
</div>
<script>

    function freshPage(data){
        var index = document.location.href.split('?')[1];
        request({},'POST','/ceeinfo/getOnce?id=' + index,refreshPage);
    }

    function refreshPage(data){
        var value = JSON.parse(data);
        console.log(value);
        $('title').html(value[0].title);
        $('.detailContent header h1').html(value[0].title);
        $('.blogInfo span').html('posted on ' + value[0].time + ' by ' + value[0].author);
        $('.detailContent article').html(value[0].content);
        $('footer').append($('<a class="layui-badge">' + value[0].province + '</a>'))
        $('footer').append($('<a class="layui-badge">' + value[0].category + '</a>'))
    }

    freshPage();

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
