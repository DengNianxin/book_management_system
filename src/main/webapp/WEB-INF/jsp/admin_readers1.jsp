<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 背景样式 */
        body {
            background: linear-gradient(rgba(255, 255, 255, 0.85), rgba(255, 255, 255, 0.85)), 
                        url('img/u1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Arial", sans-serif;
            color: #333; /* 深色字体，易于阅读 */
            margin: 0;
            padding: 0;
        }

        /* 主容器样式 */
        .panel {
            background-color: #ffffff; /* 纯白背景 */
            border-radius: 8px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* 增加柔和阴影 */
            margin: 30px auto;
            width: 80%; /* 限制宽度为 80% */
            max-width: 1200px; /* 最大宽度限制 */
            padding: 20px; /* 增加内边距 */
        }

        .panel-heading {
            background-color: #007bff; /* 蓝色标题栏 */
            color: white;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
            padding: 15px;
            border-radius: 8px 8px 0 0;
        }

        .panel-body {
            padding: 20px;
        }

        /* 表格样式 */
        .table {
            background-color: #ffffff; /* 表格背景为白色 */
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table thead {
            background-color: #007bff; /* 蓝色表头 */
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa; /* 鼠标悬停浅灰色背景 */
        }

        .table td, .table th {
            text-align: center;
            vertical-align: middle;
            color: #333; /* 深色字体 */
        }

        /* 提示框样式 */
        .alert {
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 1em;
            color: #333;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* 倒计时数字样式 */
        #num {
            font-weight: bold;
            color: #ff5722; /* 橙色字体 */
            font-size: 1.5em;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 90%; /* 窄屏设备占据 90% 宽度 */
            }

            .panel-title {
                font-size: 1.2em;
            }
        }
    </style>
</head>
<body>
    <!-- 顶部消息提示 -->
    <div id="header"></div>
    <c:if test="${!empty info}">
        <script>
            alert("${info}");
            window.location.href = "allreaders.html";
        </script>
    </c:if>

    <div class="panel panel-default">
        <div class="panel-heading">
            <p><em id="num">15</em> 秒后，自动跳转主页（请记住自己的读者号）</p>
        </div>
        <div class="panel-body">
            <c:if test="${!empty succ}">
                <div class="alert alert-success alert-dismissable text-center">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    ${succ}
                </div>
            </c:if>
            <c:if test="${!empty error}">
                <div class="alert alert-danger alert-dismissable text-center">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    ${error}
                </div>
            </c:if>

            <!-- 表格展示 -->
            <table class="table table-hover" id="readersTable">
                <thead>
                    <tr>
                        <th>读者号</th>
                        <th>姓名</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${readers}" var="reader">
                        <tr>
                            <td><c:out value="${reader.readerId}"></c:out></td>
                            <td><c:out value="${reader.name}"></c:out></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 倒计时和数据逆序的脚本 -->
    <script>
        // 倒计时逻辑
        var i = 15;
        function djs() {
            if (i == 0) {
                window.location.href = "/index.html";
            }
            document.getElementById("num").innerText = i--;
            setTimeout(djs, 1000);
        }
        djs();

        // 使用 JavaScript 实现表格数据逆序
        const table = document.querySelector('#readersTable tbody'); // 获取表格主体
        const rows = Array.from(table.rows); // 将表格中的所有行转换为数组
        rows.reverse(); // 逆序排列
        rows.forEach(row => table.appendChild(row)); // 重新插入到表格中
    </script>
</body>
</html>
