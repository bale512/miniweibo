<%@ page import="pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2018/5/19
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="java.util.Map" %>
<%
    Map<String, Object> s= ActionContext.getContext().getSession();
    User user=(User)s.get("user");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>mini微博——发现身边的好玩事</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--jquery插件-->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript">
        $(document).ready(function(){
            $("#index_sousuo").focus(function(){
                $("#index_panel").css("display","");
            });
            $("#index_sousuo").blur(function(){
                $("#index_panel").css("display","none");
            });
            $("#mycontent").keyup(function(){
                //判断输入的字符串长度
                var content_len = $("#mycontent").val().length;
                $(".tips").text("已经输入"+content_len+"个字");
                if(content_len==0){
                    // alert(content);
                    $(".tips").text("");
                    $("#send").addClass("disabled");
                    return false;
                }else{
                    $("#send").removeClass("disabled");
                }
            });
        });
    </script>
    <style type="text/css">
        body{
            background: url("images/bg.jpg") center top;
        }
        #index_panel{
            position: fixed;
            top: 45px;
            left: 260px;
            width: 400px;
        }
        #myModal{
            text-align: center;
        }
        .face{
            background: url(images/face.png)  no-repeat;
            padding:1px 0 10px 25px;
            cursor: pointer;
            font-size: 15px;
        }
        .pic{
            background: url(images/pic.png)  no-repeat;
            margin-left: 10px;
            padding:1px 0 10px 25px;
            cursor: pointer;
            font-size: 15px;
        }
        .item_hot{
            padding: 10px 20px;
        }
        .item_num{
            color: #999;
        }
        .span{
            cursor: pointer;
        }
    </style>
</head>
<body>
<!--导航栏 基于bootstrap框架-->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">

    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand"><script type="text/javascript">for(var i=1;i<=30;i++){document.write("&nbsp;");}</script>mini微博</a>
        </div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="大家正在搜:东华最美毕业生" size="40" id="index_sousuo">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;首页</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp;视频</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-eye-open"></span>&nbsp;发现</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-equalizer"></span>&nbsp;游戏</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;<%=user.getUserNikename()%></a></li>
                <li><a href="#"><span class="glyphicon glyphicon-comment"></span>&nbsp;通知</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;设置</a></li>
                <li><script type="text/javascript">for(var i=1;i<=30;i++){document.write("&nbsp;");}</script></li>
            </ul>
        </div>
    </div>
</nav>

<!--网站主题内容-->
<div class="container" style="margin-top: 60px;">
    <div class="row clearfix">
        <!--网站侧标导航栏-->
        <div  style="text-align: left; font-size:14px;position: fixed;margin-left: 120px;width: 160px;">
            <a href="#" class="list-group-item" size=""><b>首页</b></a>
            <a href="#" class="list-group-item"><b>我的收藏</b></a>
            <a href="#" class="list-group-item"><b>我的赞</b></a>
            <a href="#" class="list-group-item">热门微博</a>
            <a href="#" class="list-group-item">热门视频</a>
            <a href="#" class="list-group-item">好友圈</a>
            <a href="#" class="list-group-item">特别关注</a>
            <a href="#" class="list-group-item">V+微博</a>
            <a href="#" class="list-group-item">作家</a>
            <a href="#" class="list-group-item">时尚</a>
            <a href="#" class="list-group-item">搞笑</a>
            <a href="#" class="list-group-item">电影</a>
            <a href="#" class="list-group-item">求职</a>
        </div>

        <div class="col-md-10 column" style="margin-left: 260px;">
            <div class="col-md-8 column">
                <!--发微博消息输入框-->
                <div style="margin-top: 5px;padding: 15px;background-color: white;">
                    <form role="form">
                        <div class="form-group">
                            <span class="pull-left">有什么新鲜事想告诉大家</span>
                            <span class="tips pull-right"></span><p>？</p>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="4" id="mycontent"></textarea>
                        </div>
                        <div class="form-group">
                            <span class="face">表情</span>
                            <span class="pic">图片</span>
                            <button type="submit" id="send" class="btn btn-default pull-right disabled" style="background-color: orange;">发布</button>
                        </div>
                    </form>
                </div>
                <!--tab选项卡-->
                <nav class="navbar naybar-default" role="navigation" style="background-color: white;">
                    <div class="container-fluid">
                        <ul class="nav navbar-nav">
                            <li><a href="#">全部</a></li>
                            <li><a href="#">原创</a></li>
                            <li><a href="#">图片</a></li>
                            <li><a href="#">文章</a></li>
                        </ul>
                        <form class="nav navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="搜索我关注人的微博">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    </div>
                </nav>
                <!--未读消息提示,后续可以增加-->
                <div>

                </div>
                <!--关注好友的所有微博动态-->
                <s:iterator value="weibos" var="weibo">
                    <div style="background-color: white;margin: 5px;">
                        <!--上层div-->
                        <div class="row clearfix">
                            <div class="col-md-2 column" style="padding-left: 25px;padding-top: 10px;">
                                <img src="images/icon.png" class="img-circle" width="70px;">
                            </div>
                            <div class="col-md-10 column">
                                <h4 style="font-weight: bold;">${weibo.getNikename()}</h4>
                                <h6>${weibo.getTime()}分钟前 来自miniweibo.com</h6>
                                <p>${weibo.getWeiboInfo()}</p>
                            </div>
                        </div>
                        <!--下层div-->
                        <div class="row clearfix">
                            <div class="col-md-3 column" style="text-align: center;padding: 5px;">
                                <span class="glyphicon glyphicon-link">转发${weibo.getTranspond()}</span>
                            </div>
                            <div class="col-md-3 column" style="text-align: center;">
                                <span class="glyphicon glyphicon-star-empty">收藏${weibo.getCollect()}</span>
                            </div>
                            <div class="col-md-3 column" style="text-align: center;">
                                <span id="showcomment" class="glyphicon glyphicon-edit">评价${weibo.getComment()}</span>
                            </div>
                            <div class="col-md-3 column" style="text-align: center;">
                                <span class="glyphicon glyphicon-thumbs-up">点赞${weibo.getAgree()}</span>
                            </div>
                        </div>
                        <!--点击评价显示出来的div-->
                        <div id="comment" style="height: 100px;background: red;display: none">

                        </div>
                    </div>
                </s:iterator>

            </div>

            <div class="col-md-4 column">
                <!--个人信息概览-->
                <div class="row text-center inform" style="margin-top: 5px;padding: 15px;background-color: white;">
                    <a href="personspaceUser"><img src="images/icon.png" class="img-circle" width="90px;"></a>
                    <h4 style="font-weight: bold;"><%=user.getUserNikename()%></h4>
                    <div class="col-sm-12" >
                        <div class="col-sm-4 col-xs-4">
                            <div>${idols}</div>
                            <div class="sort">关注</div>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <div>${fans}</div>
                            <div class="sort">粉丝</div>
                        </div>
                        <div class="col-sm-4 col-xs-4">
                            <div>${mymessageList.size()}</div>
                            <div class="sort">微博</div>
                        </div>
                    </div>
                </div>
                <!--大家正在看-->
                <div class="row part_hot" style="margin-top: 5px;padding: 15px;background-color: white;">
                    <div class="col-sm-12">
                        <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                        <span class="pull-right" style="padding: 10px;">换话题</span>
                    </div>
                    <hr style="margin: 0;padding: 0;width: 100%">

                    <div class="col-sm-12 item_hot" >
                        <span class="pull-left">#何张出道#</span>
                        <span class="pull-right item_num">34.6亿</span>
                    </div>

                    <div class="col-sm-12 item_hot" >
                        <span class="pull-left">#男生夺冠#</span>
                        <span class="pull-right item_num">2.6亿</span>
                    </div>

                    <div class="col-sm-12 item_hot" >
                        <span class="pull-left">#rng冠军#</span>
                        <span class="pull-right item_num">10.4亿</span>
                    </div>

                    <div class="col-sm-12 item_hot" >
                        <span class="pull-left">#李志谦回归#</span>
                        <span class="pull-right item_num">1.5亿</span>
                    </div>

                    <div class="col-sm-12 item_hot" >
                        <span class="pull-left">#突然开心#</span>
                        <span class="pull-right item_num">1.1亿</span>
                    </div>
                    <hr style="margin: 0;padding: 0;width: 100%">

                    <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>

                </div>

            </div>
        </div>
    </div>
</div>
<!--标题搜索栏获得焦点后，显示下拉搜索列表-->
<div id="index_panel" style="display:none; ">
    <a href="#" class="list-group-item"> <span class="badge" style="background-color: #FF4500;">爆</span>1.第一条热搜第一条热搜第一条热搜</a>
    <a href="#" class="list-group-item"><span class="badge" style="background-color: #FF0000;">热</span>2.第二条热搜第二条热搜第二条热搜</a>
    <a href="#" class="list-group-item"><span class="badge" style="background-color: #DC143C;">新</span>3.第三条热搜第三条热搜第三条热搜</a>
    <a href="#" class="list-group-item">4.第四条热搜第四条热搜第四条热搜</a>
    <a href="#" class="list-group-item">5.第五条热搜第五条热搜第五条热搜</a>
    <a href="#" class="list-group-item">6.第六条热搜第六条热搜第六条热搜</a>
    <a href="#" class="list-group-item">7.第七条热搜第七条热搜第七条热搜</a>
</div>
</body>
</html>
