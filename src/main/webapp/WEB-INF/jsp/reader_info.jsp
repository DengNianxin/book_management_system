<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
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
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
                        url('img/lizhi.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Arial", sans-serif;
            color: #222; /* 深色字体，增强可读性 */
            margin: 0;
            padding: 0;
        }

        /* 主容器样式 */
        .panel {
            background-color: #ffffff; /* 白色背景 */
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* 柔和阴影 */
            margin: 30px auto;
            padding: 20px;
            width: 40%; /* 宽度调整为 50% */
            max-width: 900px; /* 限制最大宽度 */
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
            background-color: white; /* 白色背景 */
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin: 0;
        }

        .table th {
            background-color: #f8f9fa; /* 表头浅灰色背景 */
            color: #333; /* 表头深色字体 */
            text-align: left;
            padding: 10px;
        }

        .table td {
            padding: 10px;
            color: #444; /* 表格正文深灰色字体 */
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1; /* 鼠标悬停浅灰色背景 */
        }

        /* 按钮样式 */
        .btn-success {
            background-color: #28a745; /* 深绿色按钮 */
            border: none;
            color: white;
            padding: 10px 15px;
            font-size: 0.9em;
            border-radius: 5px;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838; /* 深绿色悬停效果 */
            color: #fff;
        }

        /* 提示框样式 */
        .alert {
            border-radius: 5px;
            font-size: 1em;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 95%; /* 小屏幕宽度调整为 95% */
            }

            .panel-title {
                font-size: 1.2em;
            }

            .btn-success {
                padding: 8px 12px;
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>
    <!-- 加载顶部导航栏 -->
    <div id="header" style="padding-bottom: 80px"></div>

    <!-- 成功和错误提示框 -->
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                &times;
            </button>
            ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                &times;
            </button>
            ${error}
        </div>
    </c:if>

    <!-- 个人信息展示 -->
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">我的信息</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="30%">读者证号</th>
                    <td>${readerinfo.readerId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${readerinfo.name}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${readerinfo.sex}</td>
                </tr>
                <tr>
                    <th>生日</th>
                    <td>
                        <fmt:formatDate value="${readerinfo.birth}" pattern="yyyy-MM-dd"/>
                    </td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>${readerinfo.address}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${readerinfo.phone}</td>
                </tr>
            </table>
        </div>
        <div style="text-align: center;">
            <a class="btn btn-success btn-sm" href="reader_info_edit.html" role="button">修改</a>
        </div>
    </div>
</body>
</html>
