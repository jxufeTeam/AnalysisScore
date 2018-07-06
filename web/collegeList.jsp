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
    <title>院校列表</title>
    <link href="http://www.gaokao.com/favicon.ico" rel="shortcut icon">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <link href="lib/layui/css/layui.css" rel="stylesheet">
    <link href="css/mainPageStyle.css" rel="stylesheet">
    <script src="lib/layui/layui.js"></script>
    <link href="css/collegeListStyle.css?version=2018.6.14" rel="stylesheet">
    <link href="css/mainHeaderStyle.css" rel="stylesheet">
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
                <li><a>院校列表</a></li>
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
<div class="layui-container">
    <div class="college-info-list-sreach-wrap">
        <div class="college-info-list-sreach">
            <div class="college-info-list-sreach-left select">
                高校搜索
            </div>
            <div class="college-info-list-sreach-left">
                高校推荐
            </div>
            <div class="college-info-list-sreach-right">
                <input type="text" placeholder="请输入标题" autocomplete="off" class="layui-input">
                <input type="button" class="layui-btn layui-btn-normal" value="搜索">
            </div>
        </div>
        <div class="college-info-list-condition">
            <div style="margin-bottom: 10px" id="college-province"><strong>高校所在地：</strong></div>
            <div style="margin-bottom: 10px;display: none" id="student-province"><strong>考生所在地：</strong></div>
            <div id="student-score" class="layui-inline" style="display: none">
                <div class="layui-input-inline">
                    <strong>选择科别：</strong>
                    <div class="layui-input-inline" style="width: 200px">
                        <select class="layui-input" name="category" style="width: 150px">
                            <option value="">请选择一个科别</option>
                            <option value="理科">理科</option>
                            <option value="文科">文科</option>
                        </select>
                    </div>
                </div>
                <div class="layui-input-inline">
                    <strong>倾向批次：</strong>
                    <div class="layui-input-inline" style="width: 200px">
                        <select class="layui-input" name="batch" style="width: 150px">
                            <option value="">请选择倾向的批次</option>
                            <option value="提前批">提前批</option>
                            <option value="第一批">第一批</option>
                            <option value="第二批">第二批</option>
                            <option value="第三批">第三批</option>
                            <option value="专科">专科</option>
                        </select>
                    </div>
                </div>
                <div class="layui-input-inline">
                    <strong>输入个人估分：</strong>
                    <div class="layui-input-inline">
                      <input name="score" type="number" placeholder="输入个人估分" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-input-inline">
                    <input id="sreachScore" type="button" class="layui-btn layui-btn-normal" value="推荐">
                </div>
            </div>
        </div>
    </div>
    <div class="college-info-list-wrap">
        <div class="main-content-right" style="width: 380px;position: absolute;right: 0;">
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
    <div id="college-info-list-laypage"></div>
</div>
</body>
<script>

    function refreshProvince(data){
        var value = JSON.parse(data);
        console.log(value);
        var dom1 = $('#college-province');
        var dom2 = $('#student-province');
        dom1.append('<a class="select">全部</a>');
        dom2.append('<a class="select">全部</a>');
        $.each(value, function(index){
            var a = '<a>' + value[index] + '</a>';
            dom1.append(a);
            dom2.append(a);
        });

    }

    function refreshCollegelist(data) {
        var value = JSON.parse(data);
        console.log(value);
        if(value.length > 0){
            $.each(value, function (index) {
                var wrapDiv = $('<div class="college-info-list"></div>');
                var nodeDiv1 = $('<div class="college-info-list-left"><a href="collegeDetail.jsp?' + value[index].id +'"><img src="' + value[index].badge + '" /></a><strong><a href="">' + value[index].name + '</a></strong></div>');
                var nodeDiv2 = $('<div class="college-info-list-center"></div>');
                var nodeUl = $('<ul><li>高校所在地：' + value[index].province + '</li><li>院校特色：' + value[index].type + '</li><li>博士点：' + value[index].doctor + '个</li><li>高校隶属：' + value[index].belong + '</li><li>硕士点：' + value[index].master + '个</li><li>学校网址：<a target="_blank" href="' + value[index].collegesite + '">' + value[index].collegesite + '</a></li></ul>');
                nodeDiv2.append(nodeUl);
                wrapDiv.append(nodeDiv1);
                wrapDiv.append(nodeDiv2);
                $('.college-info-list-wrap').append(wrapDiv);
                if (index == 0) {
                    $('.college-info-list').css('border-top', '1px solid #E1E1E1');
                }
            });
        }else{
            var div = $('<div class="college-info-list-notfound"><h3>抱歉，没有找到相关内容</h3><p><span>您可以：</span><span>1.修改搜索“关键词”，再试一次。</span><span>2.减少部分搜索条件，便于搜索到更多内容。</span></p></div>');
            $('.college-info-list-wrap').append(div);
        }

    }

    function freshLayuipage(condition, province) {
        layui.use(['laypage','laydate'], function () {
            var laydate = layui.laydate;
            //建造实例
            laydate.render({
                elem: '#main-date'
                ,position: 'static'
                ,mark: {
                    '2018-6-6': '高考'
                }
            });
            var laypage = layui.laypage;
            // var province = encodeURIComponent($('.select').text());
            var count;
            function freshCount(data) {
                request({}, 'POST', '/collegelist/getNum?condition='+ condition + '&province=' + province, refreshCount)
            }
            function refreshCount(data) {
                count =  data;
            }
            freshCount();
            //执行一个laypage实例
            laypage.render({
                elem: 'college-info-list-laypage' //注意，这里的 test1 是 ID，不用加 # 号
                , count:  count//数据总数，从服务端得到
                , first: '首页'
                , last: '尾页'
                , prev: '<em class="layui-icon">&#xe65a;</em>'
                , next: '<em class="layui-icon">&#xe65b;</em>'
                , jump: function (obj) {
                    freshCollegelist(obj.curr, condition, province);
                }
            });
        });
    }

    function freshProvince(data){
        request({}, 'POST', '/provincelist/getProvince', refreshProvince);
    }

    function freshCollegelist(data, condition, province) {
        // $('.college-info-list-wrap').html('');
        $('.college-info-list-notfound').remove();
        $('.college-info-list').remove();
        request({}, 'POST', '/collegelist/getCollege?start=' + data + '&end=7&condition=' + condition + '&province=' + province, refreshCollegelist);
    }

    freshProvince();

    freshLayuipage('','全部');

    $('#college-province a').on('click', function () {
        $('.college-info-list-sreach-right input').eq(0).val('');
        $('#college-province a').removeClass('select');
        $(this).addClass('select');
        console.log($('#student-score').css('display'));
        if($('#student-score').css('display') != 'block'){
            freshLayuipage('',$(this).text().trim());
        };
    });

    $('.college-info-list-sreach-right input').eq(1).on('click',function(){
        var condition = $('.college-info-list-sreach-right input').eq(0).val();
        $('#college-province a').removeClass('select');
        $('#college-province a').eq(0).addClass('select');
        freshLayuipage(condition, '全部');
    });

    $('.college-info-list-sreach-left').on('click', function(){
        $('.college-info-list-sreach-left').removeClass('select');
        $(this).addClass('select');
        if($(this).index() == 1){
            $('#student-province').css('display','block');
            $('#student-score').css('display','block');
        }else{
            $('#student-province').css('display','none');
            $('#student-score').css('display','none');
        }
    });

    function freshforecast(score, province, studentProvince, category, batch) {
        layui.use(['laypage','laydate'], function () {
            // var rate = layui.rate;

            // var laydate = layui.laydate;
            // //建造实例
            // laydate.render({
            //     elem: '#main-date'
            //     ,position: 'static'
            //     ,mark: {
            //         '2018-6-6': '高考'
            //     }
            // });
            var laypage = layui.laypage;
            // var province = encodeURIComponent($('.select').text());
            var count;
            function freshforecastlist(data, score, province, studentProvince, category, batch) {
                // $('.college-info-list-wrap').html('');
                $('.college-info-list-notfound').remove();
                $('.college-info-list').remove();
                request({}, 'POST', '/collegelist/forecast?start=' + data + '&end=7&score='+ score + '&province=' + province + '&studentProvince=' + studentProvince + '&category=' + category + '&batch=' + batch, refreshforecastlist)
            }

            function refreshforecastlist(data){
                var value = JSON.parse(data);
                if(value.length > 0){
                    $.each(value, function (index) {
                        var rateID = 'rate' + (index  + 1);
                        var wrapDiv = $('<div class="college-info-list"></div>');
                        var nodeDiv1 = $('<div class="college-info-list-left"><a href="collegeDetail.jsp?' + value[index].id +'"><img src="' + value[index].badge + '" /></a><strong><a href="">' + value[index].name + '</a></strong></div>');
                        var nodeDiv2 = $('<div class="college-info-list-center"></div>');
                        var nodeUl = $('<ul><li>高校所在地：' + value[index].province + '</li><li>院校特色：' + value[index].type + '</li><li>预测2018年分数：' + value[index].score + '分</li><li>预测批次：' + batch + '</li><li>推荐指数：<div id="' + rateID + '"></div></li><li>学校网址：<a target="_blank" href="' + value[index].collegesite + '">' + value[index].collegesite + '</a></li></ul>');
                        layui.use(['rate'], function(){
                            var rate = layui.rate;
                            rate.render({
                                elem: '#' + rateID
                                ,value: value[index].rate
                                ,readonly: true
                            });
                        });
                        nodeDiv2.append(nodeUl);
                        wrapDiv.append(nodeDiv1);
                        wrapDiv.append(nodeDiv2);
                        $('.college-info-list-wrap').append(wrapDiv);
                        if (index == 0) {
                            $('.college-info-list').css('border-top', '1px solid #E1E1E1');
                        }
                    });
                }else{
                    var div = $('<div class="college-info-list-notfound"><h3>抱歉，没有找到相关内容</h3><p><span>您可以：</span><span>1.修改搜索“关键词”，再试一次。</span><span>2.减少部分搜索条件，便于搜索到更多内容。</span></p></div>');
                    $('.college-info-list-wrap').append(div);
                }
                // if(value.length > 0){
                //
                //     $.each(value, function (index) {
                //         var wrapDiv = $('<div class="college-info-list"></div>');
                //         var nodeDiv1 = $('<div class="college-info-list-left"><a href=""><img src="' + value[index].badge + '" /></a><strong><a href="">' + value[index].name + '</a></strong></div>');
                //         var linelist = JSON.parse(value[index].line);
                //         console.log(linelist);
                //         var nodeTable = $('<table class="layui-table" lay-size="sm"></table>');
                //         // var colgroup = $('<colgroup></colgroup>');
                //         var thead = $('<tr></tr>');
                //         var tbody = $('<tr></tr>');
                //         $.each(linelist, function(index){
                //             var theadTh = $('<th>' + linelist[index].year + '</th>');
                //             var tbodyTh = $('<th>' + linelist[index].averageScore +'</th>');
                //             thead.append(theadTh);
                //             tbody.append(tbodyTh);
                //         });
                //         nodeTable.append(thead).append(tbody);
                //         var nodeDiv2 = $('<div class="college-info-list-center"></div>');
                //         // var nodeUl = $('<ul><li>高校所在地：' + value[index].province + '</li><li>院校特色：' + value[index].type + '</li><li>博士点：' + value[index].doctor + '个</li><li>高校隶属：' + value[index].belong + '</li><li>硕士点：' + value[index].master + '个</li><li>学校网址：<a target="_blank" href="' + value[index].collegesite + '">' + value[index].collegesite + '</a></li></ul>');
                //         // nodeDiv2.append(nodeUl);
                //         nodeDiv2.append(nodeTable);
                //         wrapDiv.append(nodeDiv1);
                //         wrapDiv.append(nodeDiv2);
                //         $('.college-info-list-wrap').append(wrapDiv);
                //         if (index == 0) {
                //             $('.college-info-list').css('border-top', '1px solid #E1E1E1');
                //         }
                //     });
                // }else{
                //     var div = $('<div class="college-info-list-notfound"><h3>抱歉，没有找到相关内容</h3><p><span>您可以：</span><span>1.修改搜索“关键词”，再试一次。</span><span>2.减少部分搜索条件，便于搜索到更多内容。</span></p></div>');
                //     $('.college-info-list-wrap').append(div);
                // }
                // console.log(value);
                // console.log(value.length);
                // count = value.length;
            }
            freshforecastlist(1, score, province, studentProvince, category, batch);
            //执行一个laypage实例
            laypage.render({
                elem: 'college-info-list-laypage' //注意，这里的 test1 是 ID，不用加 # 号
                , count:  count//数据总数，从服务端得到
                , first: '首页'
                , last: '尾页'
                , prev: '<em class="layui-icon">&#xe65a;</em>'
                , next: '<em class="layui-icon">&#xe65b;</em>'
                , jump: function (obj, first) {
                    if(!first){
                        freshforecastlist(obj.curr, score, province, studentProvince, category, batch)
                    }
                }
            });
        });
    }

    $('#student-province a').on('click', function () {
        console.log("get!")
        $('#student-province a').removeClass('select');
        $(this).addClass('select');
    });

    $('#sreachScore').on('click', function(){
        var score = $('input[name="score"]').val();
        var province = $('#college-province .select').text().trim();
        var studentProvince = $('#student-province .select').text().trim();
        var category = $('select[name="category"]').val();
        var batch = $('select[name="batch"]').val();
        console.log(score + "," + province + "," + studentProvince + "," + category + "," + batch);
        freshforecast(score,province,studentProvince,category,batch);
    });
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
    freshSimulation();

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
</html>
