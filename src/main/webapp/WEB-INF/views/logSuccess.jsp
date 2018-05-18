<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bb1
  Date: 03/05/2018
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        /*
 * Base structure
 */

        /* Move down content because we have a fixed navbar that is 50px tall */
        body {
            padding-top: 50px;
        }


        /*
         * Global add-ons
         */

        .sub-header {
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        /*
         * Top navigation
         * Hide default border to remove 1px line.
         */
        .navbar-fixed-top {
            border: 0;
        }

        /*
         * Sidebar
         */

        /* Hide for mobile, show later */
        .sidebar {
            display: none;
        }
        @media (min-width: 768px) {
            .sidebar {
                position: fixed;
                top: 51px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 20px;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
                background-color: #f5f5f5;
                border-right: 1px solid #eee;
            }
        }

        /* Sidebar navigation */
        .nav-sidebar {
            margin-right: -21px; /* 20px padding + 1px border */
            margin-bottom: 20px;
            margin-left: -20px;
        }
        .nav-sidebar > li > a {
            padding-right: 20px;
            padding-left: 20px;
        }
        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }


        /*
         * Main content
         */

        .main {
            padding: 20px;
        }
        @media (min-width: 768px) {
            .main {
                padding-right: 40px;
                padding-left: 40px;
            }
        }
        .main .page-header {
            margin-top: 0;
        }


        /*
         * Placeholder dashboard ideas
         */

        .placeholders {
            margin-bottom: 30px;
            text-align: center;
        }
        .placeholders h4 {
            margin-bottom: 0;
        }
        .placeholder {
            margin-bottom: 20px;
        }
        .placeholder img {
            display: inline-block;
            border-radius: 50%;
        }
    </style>
    <script>
        function search() {
            $.ajax(
                {
                    type:"POST",
                    dataType:"json",
                    url:"/User/test",
                    data:$("#searchform").serialize(),
                    success:function (rs) {
                        console.log(rs);
                    }
                }
            );
        }
    </script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
           <!-- <a class="navbar-brand" href="#">${User.userName}</a>-->
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/User/index">退出</a></li>
            </ul>

        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
                <li><a href="#">普通管理</a></li>
                <li><a href="#">高级管理</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <form id="searchform" action="search" method="post" class="form-form-horizontal form-label-left">
                <div class="clearfix">
                    <!--<label>用户名</label>-->
                    <div>
                       用户名: <input id="username" name="username" value="${username}" type="text" class="form-control" placeholder="请输入用户名" style="width: 20%;display: inline-block">&nbsp;&nbsp;

                        积分:<input id="start" name = "start" value="${start}" type="text" class="form-control" style="width: 10%;display: inline-block">--
                        <input id="end" name = "end" value="${end}" type="text" class="form-control" style="width: 10%;display: inline-block">
                        &nbsp;&nbsp;
                        <button id="search" type="submit" class="btn btn-success">查询</button>
                       <!-- <input type="button" value="查询" onclick="search()">-->
                    </div>
                </div>


            </form>
            <h2 class="sub-header">用户信息</h2>
            <div class="table-responsive">
                <table  id="table_test" class="table table-striped">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>用户名</th>
                        <th>积分</th>
                        <th>最后登陆时间</th>
                        <th>最后登陆IP</th>
                        <th class="a-center" >操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageBean.data}" var="user">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.userName}</td>
                            <td>${user.credits}</td>
                            <td>${user.lastVisit}</td>
                            <td>${user.lastIp}</td>
                            <td >
                                <a href="#" class="btn btn-info btn-xs list-edit update" userid="${user.userId}"><i class="fa fa-pencil"></i>修改</a>
                                <a href="#" class="btn btn-danger btn-xs delete" userid="${user.userId}"><i class="fa fa-trash-o"></i>删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <input id="prepage" name="prePage" type="button" value="上一页">
            <input id="nextpage" name="nextPage" type="button" value="下一页">
        </div>
    </div>
</div>

<div class="modal fade" id="my_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改积分</h4>
            </div>
            <div class="modal-body">
                <form id="updateCredits">
                    <div class="form-group">
                        <label>ID</label>
                        <div>
                            <input id="userId" name="userId" type="text" class="form-control" placeholder="请输入积分">
                        </div>
                    <div class="form-group">
                        <label>积分</label>
                        <div>
                            <input id="credit" name="credit" type="text" class="form-control" placeholder="请输入积分">
                        </div>
                    </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="save" class="btn btn-success">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript">

    $(function () {
        var page = '${pageBean.pageNumber}';
        var pages = '${pageBean.totalPage}';
        if(page==1){
            $('#prepage').attr("disabled",true);
        }
        if(page==pages){
            $("#nextpage").attr("disabled",true);
        }
    });
    $("#nextpage").click(function () {
        var pageNext = '${pageBean.pageNumber+1}';
        $("#searchform").append("<input type='hidden' name='currentPage' value= "+pageNext+">");
        $("#searchform").submit();
    });
    $("#prepage").click(function () {
        var pagePre = '${pageBean.pageNumber-1}';
        $('#prepage').attr("disabled",true);
        $("#searchform").append("<input type='hidden' name='currentPage' value= " + pagePre + ">");
        $("#searchform").submit();
    });
    $('#table_test tbody').on('click','.list-edit',function(){
        $('#my_modal').modal();
    });
    $(".update").click(function () {
        var id = $(this).attr("userid");
        $.ajax({
            type:"GET",
            dataType:"json",
            url:"/User/get/"+id,
            success:function (res) {
                $("#userId").val(res.userId);
                $("#credit").val(res.credits);
                console.log(res);
                }
        });
    })
    $("#save").click(function () {
      $.ajax({
          type:"POST",
          url:"/User/save",
          data:$("#updateCredits").serialize(),
          success:function () {
              console.log("sss");
              document.write("<form action=search method=post name=form1 style='display:none'>");
              document.write("</form>");
              document.form1.submit();
              /*$("#searchform").submit();*/
          }
      });
    })
</script>
</body>
</html>

