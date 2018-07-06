<%--
  Created by IntelliJ IDEA.
  User: 84975
  Date: 2018/6/13
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta name="keywords" content="北京大学录取分数线,北京大学专业设置">
    <meta name="description" content="高考院校库为广大高中生提供北京大学录取分数线、北京大学专业设置、北京大学高校信息、就业形势、食宿条件、招生计划、自主招生、保送生招生、特长招生、录取规则、收费标准、重点专业等北京大学相关信息…">
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
    <link href="css/collegeDetail.css?version=20180619" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link href="lib/layui/css/layui.css" rel="stylesheet">
    <script src="lib/layui/layui.js"></script>
    <script src="lib/echarts.min.js"></script>
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

<div class="channel_Nav">
    <ul>
        <li><a>高校搜索</a></li>
        <li><a>专业搜索</a></li>
        <li><a>高校分数线</a></li>
        <li><a>专业分数线</a></li>
        <li><a>地区批次线</a></li>
    </ul>
    <div class="right_Search_Box">
        <input id="schname_h" type="text" placeholder="搜索高校">
        <input id="sch_btn" type="button" value="搜索">
    </div>
</div>
<div class="wrap">
    <div class="menufix">

    </div>
    <div style="width: 1000px; height: 10px;"></div>
    <div class="menu_Cto">
        <h2>
            <a href="" class="college_com">高校对比</a>
        </h2>
        <div class="college_msg">
            <dl>
                <dt><img style="float: left;width: 121px;height: 121px;" src="http://college.gaokao.com/style/college/images/icon/1.png"></dt>
                <dd>

                </dd>
            </dl>
        </div>
    </div>
    <div style="width: 1000px; height: 10px;"></div>
    <div class="sm_nav">
        <p>
            <strong>高校概况：</strong>
            <a href="">院校简介</a>
            <a href="">师资力量</a>
            <a href="">院系设置</a>
            <a href="">专业介绍</a>
            <a href="">就业状况</a>
        </p>
        <p>
            <strong>招生信息：</strong>
            <a href="">招生简章</a>
            <a href="">招生计划</a>
            <a href="">自主招生</a>
            <a href="">保送生招生</a>
        </p>
        <p>
            <strong>报考指南：</strong>
            <a href="">录取分数</a>
            <a href="">专业分数</a>
            <a href="">录取规则</a>
            <a href="">收费标准</a>
            <a href="">重点学科</a>
        </p><p>
        <strong>高校互动：</strong>
        <a href="">联系方式</a>
        <a href="">学校点评</a>
        <a href="">高校对比</a>
        <a href="">我要收藏</a>
    </p>
    </div>
</div>

<div class="wrapper">
    <div style="width: 1000px; height: 10px;"></div>
    <div class="cont_l">
        <div class="selbox">
            <div class="graybox">
                <p>近六年对比图</p>
            </div>
        </div>
        <div id="container1" style="height: 300px;"></div>
        <div id="container2" style="height: 300px;display: none;"></div>
        <script type="text/javascript">

        </script>
        <h1 style="padding: 5px;">各省录取分数线</h1>
        <div class="tabschool">
            <ul class="tabTit5">
                <li class="on5">理科</li>
                <li class="">文科</li>
            </ul>
            <div>
                <p class="btnFsxBox"><font></font>各省市录取分数线（<font>北京</font>→<font>理科</font>）</p>
                <table id="college_tab">
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="cont_r">
        <div class="ct_t">
            <h3><p>高校投票</p></h3>
            <div style="width: 1000px;"></div>
            <div class="voteArea">
                <p id="vote_yes" class="vote_red left w60"><a class="vote" vote="yes">想报考</a><em style="height: 85.5733px;"><span>17000</span></em></p>
                <p id="vote_no" class="vote_blue left w60 lm15"><a class="vote" vote="no">不想报考</a><em style="height: 9.63959px;"><span>1915</span></em></p>
                <p id="vote_null" class="vote_grey right w60"><a class="vote" vote="null">还没想好</a><em style="height: 4.78707px;"><span>951</span></em></p>
            </div>
        </div>
        <div style="height: 10px;"></div>
        <div class="ct_t">
            <h3>同地区高校排行榜</h3>
            <div style="height: 10px;"></div>
            <ul id="bg_sz">
                <li><span>1718311</span><a href="http://college.gaokao.com/school/1/" target="_blank">北京大学</a></li>
                <li><span>1540624</span><a href="http://college.gaokao.com/school/3/" target="_blank">清华大学</a></li>
                <li><span>825466</span><a href="http://college.gaokao.com/school/7/" target="_blank">北京师范大学</a></li>
                <li><span>676882</span><a href="http://college.gaokao.com/school/4/" target="_blank">北京航空航天大学</a></li>
                <li><span>615766</span><a href="http://college.gaokao.com/school/2/" target="_blank">中国人民大学</a></li>
                <li><span>587905</span><a href="http://college.gaokao.com/school/139/" target="_blank">中国人民公安大学</a></li>
                <li><span>512555</span><a href="http://college.gaokao.com/school/5/" target="_blank">北京理工大学</a></li>
                <li><span>463529</span><a href="http://college.gaokao.com/school/121/" target="_blank">中国传媒大学</a></li>
            </ul>
        </div>
        <div style="height: 10px;"></div>
        <div class="ct_t">
            <h3><a href="http://college.gaokao.com/schlist/c/" target="_blank">同类型高校排行榜</a></h3>
            <div class="hr_10"></div>
            <ul id="bg_sz1">
                <li><span>1718310</span><a href="http://college.gaokao.com/school/1/" target="_blank">北京大学</a></li>
                <li><span>1592692</span><a href="http://college.gaokao.com/school/24/" target="_blank">厦门大学</a></li>
                <li><span>1220997</span><a href="http://college.gaokao.com/school/22/" target="_blank">浙江大学</a></li>
                <li><span>1215941</span><a href="http://college.gaokao.com/school/575/" target="_blank">南华大学</a></li>
                <li><span>1144991</span><a href="http://college.gaokao.com/school/27/" target="_blank">武汉大学</a></li>
                <li><span>1026751</span><a href="http://college.gaokao.com/school/15/" target="_blank">复旦大学</a></li>
                <li><span>897452</span><a href="http://college.gaokao.com/school/29/" target="_blank">中山大学</a></li>
                <li><span>815798</span><a href="http://college.gaokao.com/school/36/" target="_blank">四川大学</a></li>
            </ul>
        </div>
        <div style="height: 10px;"></div>
        <div class="ct_t">
            <h3>高校资讯</h3>
        </div>
    </div>
    <div style="width: 1000px;height: 10px;overflow: hidden"></div>
    <div class="msg">
        <p>高考院校库分数线统计时包含了特长生分数，因此最低分和平均分可能与院校公布数据不一致，请以各高校正式公布数据为准。</p>
        <p>如果您发现网页当中的任何错误，欢迎发送邮件（xiangnan@100tal.com）与我们联系，我们会及时更正，谢谢! </p>
    </div>
    <div style="width: 1000px;height: 10px;"></div>
</div>
<div class="footer2013">
    <div class="wrapper">
        <dl class="link">
            <dt class="ft18 ffm">城市导航</dt>
            <dd><a title="北京高考网" target="_blank" href="http://www.gaokao.com/beijing/">北京高考</a> <a title="上海高考网" target="_blank" href="http://sh.gaokao.com/">上海高考</a> <a title="天津高考网" target="_blank" href="http://www.gaokao.com/tianjin/">天津高考</a> <a title="重庆高考网" target="_blank" href="http://www.gaokao.com/chongqing/">重庆高考</a> <a title="广东高考网" target="_blank" href="http://www.gaokao.com/guangdong/">广东高考</a> <a title="江苏高考网" target="_blank" href="http://www.gaokao.com/jiangsu/">江苏高考</a> <a title="山东高考网" target="_blank" href="http://www.gaokao.com/shandong/">山东高考</a> <a title="浙江高考网" target="_blank" href="http://www.gaokao.com/zhejiang/">浙江高考</a> <a title="湖北高考网" target="_blank" href="http://www.gaokao.com/hubei/">湖北高考</a> <a title="四川高考网" target="_blank" href="http://www.gaokao.com/sichuan/">四川高考</a> <a title="黑龙江高考网" target="_blank" href="http://www.gaokao.com/heilongjiang/">黑龙江高考</a><br><a title="湖南高考网" target="_blank" href="http://www.gaokao.com/hunan/">湖南高考</a> <a title="辽宁高考网" target="_blank" href="http://www.gaokao.com/liaoning/">辽宁高考</a> <a title="海南高考网" target="_blank" href="http://www.gaokao.com/hainan/">海南高考</a> <a title="宁夏高考网" target="_blank" href="http://www.gaokao.com/ningxia/">宁夏高考</a> <a title="福建高考网" target="_blank" href="http://www.gaokao.com/fujian/">福建高考</a> <a title="甘肃高考网" target="_blank" href="http://www.gaokao.com/gansu/">甘肃高考</a> <a title="河北高考网" target="_blank" href="http://www.gaokao.com/hebei/">河北高考</a> <a title="吉林高考网" target="_blank" href="http://www.gaokao.com/jilin/">吉林高考</a> <a title="江西高考网" target="_blank" href="http://www.gaokao.com/jiangxi/">江西高考</a> <a title="云南高考网" target="_blank" href="http://www.gaokao.com/yunnan/">云南高考</a> <a title="内蒙古高考网" target="_blank" href="http://www.gaokao.com/neimenggu/">内蒙古高考</a><br> <a title="河南高考网" target="_blank" href="http://www.gaokao.com/henan/">河南高考</a> <a title="广西高考网" target="_blank" href="http://www.gaokao.com/guangxi/">广西高考</a> <a title="陕西高考网" target="_blank" href="http://www.gaokao.com/shanxi/">陕西高考</a> <a title="山西高考网" target="_blank" href="http://www.gaokao.com/sx/">山西高考</a> <a title="安徽高考网" target="_blank" href="http://www.gaokao.com/anhui/">安徽高考</a> <a title="新疆高考网" target="_blank" href="http://www.gaokao.com/xinjiang/">新疆高考</a> <a title="西藏高考网" target="_blank" href="http://www.gaokao.com/xizang/">西藏高考</a> <a title="贵州高考网" target="_blank" href="http://www.gaokao.com/guizhou/">贵州高考</a> <a title="青海高考网" target="_blank" href="http://www.gaokao.com/qinghai/">青海高考</a> <a title="港澳高考网" target="_blank" href="http://www.gaokao.com/gd/">港澳高考</a>
            </dd>
        </dl>
        <div class="tc">
            <p><a title="关于我们" target="_blank" href="http://www.eduu.com/edgw/">关于我们</a> - <a target="_blank" href="http://www.gaokao.com/z2014/ad/">广告服务</a> - <a target="_blank" href="http://www.eduu.com/z/yqlj/index.html">友情链接</a> - <a target="_blank" href="http://bj.aoshu.com/include/map.html">网站地图</a> - <a target="_blank" href="http://www.eduu.com/include/fuwu.html">服务条款</a> - <a title="学而思招聘" target="_blank" href="http://www.eduu.com/edgw/cpyc/shzp/">诚聘英才</a> - <a target="_blank" href="http://www.gaokao.com/z2014/contactus/">联系我们</a></p>
            <p><a target="_blank" href="http://www.miibeian.gov.cn/">京ICP备09042963号-9</a> 北京市公安局海淀分局备案编号：1101081950</p>
            <p>高考网版权所有 Copyright © 2005-2017 www.gaokao.com. All Rights Reserved.</p>
        </div>
    </div>
</div>

<p id="back-to-top" style="display: block;">返回顶部</p>
<script>
    function freshPage(data){
        var id = location.href.split('?')[1];
        request({},'POST','/collegelist/getDetail?id=' + id,refreshPage);
    }

    function refreshPage(data) {
        var value = JSON.parse(data)[0];
        $('title').html(value.name);
        $('.menu_Cto h2').html( value.name + $('.menu_Cto h2').html());
        $('.college_msg img').attr('src', value.badge);
        var ul1 = $('<ul></ul>');
        var ul2 = $('<ul></ul>');
        ul1.append($('<li>高校类型：' + value.type.indexOf("985") != -1 ? value.type.indexOf("211") != -1 ? '<span class="c985">985</span><span class="c211">211</span></li>' : '<span class="c985"></span></li>' : value.type.indexOf("211") == -1 ? '<span class="c211"></span></li>':'</li>'))
        ul1.append($('<li>高校隶属于：' + value.belong + '</li>'));
        ul1.append($('<li>高校所在地：' + value.province + '</li>'));
        ul1.append($('<li>院士：' + value.academician +'人 博士点：' + value.doctor + '个 硕士点：' + value.master + '个</li>'));
        ul2.append($('<p><br>联系电话：010-62751407<br>电子邮箱：bdzsb@pku.edu.cn<br>学校网址：' + value.collegesite + '</p>'));
        $('.college_msg dd').append(ul1);
        $('.college_msg dd').append(ul2);
        $('.btnFsxBox').find('font').eq(0).html(value.name + ' ');
        var line = JSON.parse(value.collegeline);
        var provinceLine;

        function freshProvinceLine(data){
            request({},'POST','/provincelist/getProvinceline?province=' + data, refreshProvinceLine);
        }

        function refreshProvinceLine(data){
            var line = JSON.parse((JSON.parse(data)[0]).provinceline);
            var list = [];
            $.each(line, function (index) {
                if(line[index].batch == '本科一批' && line[index].score != 0 && line[index].province == '北京'){
                    list.push(line[index]);
                }
            });
            provinceLine = list;
        }

        freshProvinceLine('北京');
        console.log(provinceLine);
        var chartData1 = [['type', '校线', '省控线']];
        var chartData2 = [['type', '校线', '省控线']];
        var tbody = $('<tbody style="display: none"></tbody>');
        // tbody.append($('<tr><th scope="col">年份</th><th scope="col">最低</th><th scope="col">最高</th><th scope="col">平均</th><th scope="col">录取人数</th><th scope="col">录取批次</th></tr>'));
        $.each(line, function (index) {
            if(line[index].province != '北京'){
                $('#college_tab').append(tbody);
                $('#college_tab tbody').prepend($('<tr><th scope="col">年份</th><th scope="col">最低</th><th scope="col">最高</th><th scope="col">平均</th><th scope="col">录取人数</th><th scope="col">录取批次</th></tr>'));
                $('#college_tab tbody').append($('<tr><td class="pr10" colspan="7"><a style="color: #005EAC;float: right;">各省录取分数线&gt;&gt;</a></td>\</tr>'));
                // tbody.append($('<tr><td class="pr10" colspan="7"><a style="color: #005EAC;float: right;">各省录取分数线&gt;&gt;</a></td>\</tr>'));
                return false;
            }
            if(line[index].batch == '第一批' && line[index].averageScore != 0){
                if(line[index].classical == '理科'){
                    var yearline = [];
                    yearline.push(line[index].year);
                    yearline.push(parseInt(line[index].averageScore));
                    $.each(provinceLine,function (i) {
                        if(provinceLine[i].category == '理科' && provinceLine[i].year == line[index].year){
                            yearline.push(parseInt(provinceLine[i].score));
                            return false;
                        }
                    });
                    chartData1.push(yearline);
                }else if(line[index].classical == '文科'){
                    var yearline = [];
                    yearline.push(line[index].year);
                    yearline.push(parseInt(line[index].averageScore));
                    $.each(provinceLine,function (i) {
                        if(provinceLine[i].category == '文科' && provinceLine[i].year == line[index].year){
                            yearline.push(parseInt(provinceLine[i].score));
                            return false;
                        }
                    });
                    chartData2.push(yearline);
                }
            }
            var tr = $('<tr></tr>');
            tr.append($('<td>' + line[index].year + '</td>'));
            tr.append($('<td>' + (line[index].lowScore == 0 ? '------' : line[index].lowScore) + '</td>'));
            tr.append($('<td>' + (line[index].higtScore == 0 ? '------' : line[index].higtScore) + '</td>'));
            tr.append($('<td>' + (line[index].averageScore == 0 ? '------' : line[index].averageScore) + '</td>'));
            tr.append($('<td>' + (line[index].admissions == 0 ? '------' : line[index].admissions) + '</td>'));
            tr.append($('<td>' + line[index].batch + '</td>'));

            if(line[index].classical == '理科'){
                // console.log(tr.html());
                // $('#college_tab tbody').eq(0).html($('.college_tab tbody').eq(0).html() + tr.html());
                $('#college_tab tbody').eq(0).append(tr);
            }else if(line[index].classical == '文科'){
                // var tr = $('<tr></tr>');
                // console.log(tr.html());
                tbody.append(tr);
                // tbody.html(tbody.html() + tr.html());
            }
        });
        // console.log(JSON.stringify(chartData1));
        // console.log(JSON.stringify(chartData2));
        drawChart(JSON.stringify(chartData1),'container1');
        drawChart(JSON.stringify(chartData1),'container2');
    }

    $('.tabTit5 li').on('click', function () {
        $('.tabTit5 li').removeClass('on5');
        $(this).addClass('on5');
        console.log($(this).index());
        if($(this).index() == 0){
            $('#college_tab tbody').eq(0).css('display','block');
            $('#college_tab tbody').eq(1).css('display','none');
            $('.btnFsxBox').find('font').eq(3).html('理科');
            $('container1').css('display','block');
            $('container2').css('display','none');
        }else{
            $('#college_tab tbody').eq(0).css('display','none');
            $('#college_tab tbody').eq(1).css('display','block');
            $('.btnFsxBox').find('font').eq(3).html('文科');
            $('container1').css('display','none');
            $('container2').css('display','block');
        }
    });

    function drawChart(data,id){
        var dom = document.getElementById(id);
        var myChart = echarts.init(dom);
        console.log(data);
        var app = {};
        option = null;
        option = {
            legend: {},
            tooltip: {},
            dataset: {
                source:JSON.parse(data)
            },
            xAxis: {type: 'category'},
            yAxis: {},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                {type: 'bar'},
                {type: 'bar'}
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
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
