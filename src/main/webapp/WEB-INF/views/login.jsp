<%--
  Created by IntelliJ IDEA.
  User: bb1
  Date: 03/05/2018
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>登陆</title>
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <!-- Custom styles for this template -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>

<body>

<div class="container">

    <c:if test="${!empty error}">
        <font style="text-align: center " color="red"><c:out value="${error}" /></font>
    </c:if>
   <!-- <input type="button" value="测试JQ" onclick="fn1()"><span id="span1"></span>-->
    <form class="form-signin" action="/User/logincheck" method="post">
        <h2 class="form-signin-heading">CRM SYSTEM</h2>
        <label for="userName" class="sr-only">用户名</label>
        <input type="text" id="userName" name = "userName" class="form-control" placeholder="userName">
        <span id="userNameInfo"></span>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name = "password" class="form-control" placeholder="Password">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
    </form>

</div> <!-- /container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(function () {
        $("#userName").blur(function () {
            var usernameInput = $(this).val();
            $.post(
                "/User/isExist",
                {"username":usernameInput},
                function (data) {
                    var isExist = data.isExist;
                    var userInfoName = "";
                    if(isExist){
                        userInfoName="用户名存在";
                        $("#userNameInfo").css("color","green");
                    }else {
                        userInfoName="用户名不存在";
                        $("#userNameInfo").css("color","red");
                    }
                    $("#userNameInfo").html(userInfoName);
                },
                "json"
            );
        });
    });
</script>
</body>
</html>


