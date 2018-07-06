<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/6/11
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
    <link href="css/moreceeinfoStyle.css?version=20180611" rel="stylesheet">
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
<div class="layui-container" style="margin-top: 40px;">
    <div class="header">
    </div>
    <div class="layui-row">
        <div class="layui-col-md8">
            <div class="nav">
                <h3><span>地区导航</span></h3>
            </div>
            <div class="article">
                <h2 class="titDt">
                    <em>文章列表</em>
                </h2>
                <ul class="ceeinfo-list"></ul>
            </div>
        </div>
        <div class="layui-col-md4"></div>
    </div>
</div>
<script>

    // 全局参数
    var province;
    var category;

    function freshProvince(){
        console.log(category + ',' + province);
        $('.header').append($('<span>' + province + category + '</span>'))
        $('title').html($('.header span').html().trim());
        request({}, 'POST', '/provincelist/getProvince', refreshProvince);
    }

    function refreshProvince(data){
        var value = JSON.parse(data);
        var loadList = [];
        $.each(value, function(index){
            if(value[index] != '香港' && value[index] != '澳门' && value[index] != '台湾'){
                var a = $('<a href="moreceeinfo.jsp?' + value[index] + '&' + category + '"><span>' + value[index] + '</span></a>');
                if(value[index] == province){
                    a.addClass('select');
                }
                if((value[index].split('')).length > 2){
                    loadList.push(a);
                }else{
                    $('.nav').append(a);
                }
            }
        });
        $('.nav').append($('<a href="moreceeinfo.jsp?港澳&' + category + '"><span>港澳</span></a>'));
        $.each(loadList, function (index) {
            $('.nav').append(loadList[index]);
        })
    }

    function freshCeeinfoList(){
        request({},'POST','/ceeinfo/getList?start=1&count=20&category=' + category + '&province=' + province,refreshCeeinfoList);
    }

    function refreshCeeinfoList(data){
        var value = JSON.parse(data);
        console.log(value);
        $.each(value, function (index) {
           var li = $('<li></li>');
           li.append($('<span>' + value[index].time + '</span>'));
           li.append($('<a href="detail.jsp?' + value[index].id +'"> ' + value[index].title + '</a>'));
           if((index+1)%5 == 0){
               li.addClass('listLi');
           }
           $('.ceeinfo-list').append(li);
        });
    }

    function freshPage(){
        var data = location.href.split('?')[1];
        var datalist = data.split('&');
        province = decodeURI(datalist[0]);
        category = decodeURI(datalist[1]);
        freshProvince();
        freshCeeinfoList();
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
