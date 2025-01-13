<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借还日志</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 页面背景样式 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('img/u5.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 容器样式 */
        .panel {
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            max-width: 800px; /* 设置表单宽度 */
            margin: 30px auto; /* 居中 */
        }

        .panel-heading {
            background-color: #337ab7 !important;
            color: #fff !important;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        /* 表格样式 */
        .table {
            margin-bottom: 0;
            border-collapse: collapse;
            border: 1px solid #ddd;
            text-align: center;
            width: 100%; /* 表格占满容器宽度 */
        }

        .table thead th {
            background-color: #f7f7f7;
            color: #333;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table th, .table td {
            vertical-align: middle; /* 内容垂直居中 */
            padding: 12px; /* 内边距使内容对齐 */
        }

        /* 按钮样式 */
        .btn-danger {
            background-color: #d9534f;
            border: none;
            font-size: 12px;
        }

        .btn-danger:hover {
            background-color: #c9302c;
        }

        .btn-default {
            background-color: #e7e7e7;
            color: #aaa;
            font-size: 12px;
            border: none;
        }

        .btn-default:disabled {
            background-color: #f5f5f5;
            color: #aaa;
        }

        /* 提示框样式 */
        .alert {
            width: 80%;
            margin: 20px auto;
            border-radius: 5px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* 响应式表格 */
        @media (max-width: 768px) {
            .panel {
                width: 95%;
                margin: 20px auto;
            }

            .table {
                font-size: 12px;
            }

            .panel-heading {
                font-size: 16px;
            }
        }
    </style>
    <script>
        $(function () {
            // 加载顶部导航栏
            $('#header').load('admin_header.html');
        });
    </script>
</head>
<body>
    <!-- 顶部导航 -->
    <div id="header"></div>

    <!-- 提示框 -->
    <div style="padding-top: 50px;">
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

    <!-- 日志表格 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            借还日志
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>流水号</th>
                        <th>图书号</th>
                        <th>读者证号</th>
                        <th>借出日期</th>
                        <th>归还日期</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="alog">
                        <tr>
                            <td><c:out value="${alog.ser_num}"></c:out></td>
                            <td><c:out value="${alog.bookId}"></c:out></td>
                            <td><c:out value="${alog.readerId}"></c:out></td>
                            <td><c:out value="${alog.lendDate}"></c:out></td>
                            <td><c:out value="${alog.backDate}"></c:out></td>
                            <td>
                                <a href="deletelend.html?serNum=<c:out value='${alog.ser_num}'></c:out>">
                                    <c:if test="${!empty alog.backDate}">
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </c:if>
                                    <c:if test="${empty alog.backDate}">
                                        <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>
                                    </c:if>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
