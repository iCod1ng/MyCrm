<%--
  Created by IntelliJ IDEA.
  User: bb1
  Date: 09/05/2018
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
        function fn1() {
            $.get(
                "/User/test",
                {"name":"pig","age":100},
                function () {
                    alert();
                }
            );

        }
    </script>
</head>
<body>
<input type="button" value="测试JQ" onclick="fn1()"><span id="span1"></span>
</body>
</html>
