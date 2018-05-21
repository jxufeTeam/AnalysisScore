<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/3/12
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link href="lib/layui/css/layui.css" rel="stylesheet">
    <link href="css/collegeListStyle.css?version=2018.5.16" rel="stylesheet">
    <script src="lib/layui/layui.js"></script>
</head>
<body>
Hello!
<div class="layui-container">

</div>
</body>
<script>
    $.ajax({
        url: '/collegelist/getCollegeline?start=1&end=5',
        type: 'POST',
        success: function (data) {
            var value = JSON.parse(data);
            console.log(value);
            $.each(value, function (index) {
                var wrapDiv = $('<div class="college-info-list"></div>');
                var nodeDiv1 = $('<div class="college-info-list-left"><a href=""><img src="' + value[index].badge + '" /></a><strong><a href="">' + value[index].name + '</a></strong></div>');
                var nodeDiv2 = $('<div class="college-info-list-center"></div>');
                var nodeUl = $('<ul><li>高校所在地：' + value[index].province + '</li><li>院校特色：' + value[index].type + '</li><li>博士点：' + value[index].doctor + '个</li><li>高校隶属：' + value[index].belong + '</li><li>硕士点：' + value[index].master + '个</li><li>学校网址：<a target="_blank" href="' + value[index].collegesite + '">' + value[index].collegesite + '</a></li></ul>');
                nodeDiv2.append(nodeUl);
                wrapDiv.append(nodeDiv1);
                wrapDiv.append(nodeDiv2);
                $('.layui-container').append(wrapDiv);
                if(index == 0){
                    $('.college-info-list-left').css('border-top','1px solid #E1E1E1');
                    $('.college-info-list-center').css('border-top','1px solid #E1E1E1');
                }
            });
        },
        error: function (data) {
            console.log('error!');
        }
    })
</script>
</html>
