<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的借还</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        });
    </script>
    <style>
        /* 背景设置，添加深色透明遮罩 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                        url('/img/lizhi.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Arial", sans-serif;
            color: #333; /* 默认字体颜色 */
            margin: 0;
            padding: 0;
        }

        /* 提示框样式 */
        .alert {
            margin: 20px auto;
            max-width: 80%;
            font-size: 1em;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .alert-success {
            background-color: #d4edda; /* 成功提示背景 */
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da; /* 错误提示背景 */
            color: #721c24;
        }

        /* 表格容器样式 */
        .panel {
            background-color: #ffffff; /* 白色背景 */
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* 柔和阴影 */
            margin: 30px auto;
            padding: 20px;
            width: 90%; /* 设置表格容器宽度 */
            max-width: 1200px; /* 限制最大宽度 */
        }

        .panel-heading {
            background-color: #007bff; /* 蓝色标题背景 */
            color: white;
            font-size: 1.5em;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px 10px 0 0;
        }

        .panel-body {
            padding: 20px;
        }

        /* 表格样式 */
        .table {
            background-color: white; /* 表格背景白色 */
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin: 0;
        }

        .table thead th {
            background-color: #f8f9fa; /* 表头浅灰色背景 */
            color: #333; /* 表头深色字体 */
            text-align: left;
            padding: 10px;
        }

        .table tbody td {
            padding: 12px;
            color: #555; /* 表格正文较浅字体颜色 */
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1; /* 鼠标悬停高亮背景 */
        }

        .table tbody tr td:last-child {
            font-weight: bold; /* 状态字段加粗 */
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 95%; /* 移动端表格容器宽度调整 */
            }

            .panel-title {
                font-size: 1.2em;
            }
        }
    </style>
</head>
<body>
    <!-- 顶部导航 -->
    <div id="header"></div>

    <!-- 提示信息 -->
    <div style="position: relative; top: 10%;">
        <c:if test="${!empty succ}">
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                ${succ}
            </div>
        </c:if>
        <c:if test="${!empty error}">
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                ${error}
            </div>
        </c:if>
    </div>

    <!-- 借还日志表格 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">我的借还日志</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>图书号</th>
                        <th>借出日期</th>
                        <th>归还日期</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="alog">
                        <tr>
                            <td><c:out value="${alog.bookId}"></c:out></td>
                            <td><c:out value="${alog.lendDate}"></c:out></td>
                            <td><c:out value="${alog.backDate}"></c:out></td>
                            <c:if test="${empty alog.backDate}">
                                <td style="color: red;">未还</td>
                            </c:if>
                            <c:if test="${!empty alog.backDate}">
                                <td style="color: green;">已还</td>
                            </c:if>
                            <!-- <c:if test="${alog.overdue == true}">
                                <td style="color: orange;">超期</td>
                            </c:if> -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
