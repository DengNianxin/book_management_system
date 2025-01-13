<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>

        /* 菜单栏修复 */
        #header {
            padding: 0;
            margin: 0;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 9999;
        }

        /* 背景设置 */
        body {
            background: url('img/u1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 遮罩效果，提升可读性 */
        .content-wrapper {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            margin-top: 100px;
        }

        /* 提示框样式 */
        .alert {
            width: 90%;
            margin: 20px auto;
            border-radius: 5px;
        }

        /* 表格样式 */
        .table {
            border-radius: 8px;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        /* 标题栏样式 */
        .panel-heading {
            background-color: #337ab7 !important;
            color: white !important;
            font-size: 18px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }

        /* 按钮样式 */
        .btn-xs {
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html'); // 加载菜单栏
        });
    </script>
</head>
<body>
    <!-- 菜单栏 -->
    <div id="header"></div>

    <!-- 提示框 -->
    <c:if test="${!empty info}">
        <script>
            alert("${info}");
            window.location.href = "allreaders.html";
        </script>
    </c:if>

    <div class="container content-wrapper">
        <!-- 提示消息 -->
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

        <!-- 读者信息表 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">全部读者</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>读者号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>生日</th>
                            <th>地址</th>
                            <th>电话</th>
                            <th>编辑</th>
                            <th>删除</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${readers}" var="reader">
                            <tr>
                                <td><c:out value="${reader.readerId}" /></td>
                                <td><c:out value="${reader.name}" /></td>
                                <td><c:out value="${reader.sex}" /></td>
                                <td><c:out value="${reader.birth}" /></td>
                                <td><c:out value="${reader.address}" /></td>
                                <td><c:out value="${reader.phone}" /></td>
                                <td>
                                    <a href="reader_edit.html?readerId=<c:out value='${reader.readerId}'/>">
                                        <button type="button" class="btn btn-info btn-xs">编辑</button>
                                    </a>
                                </td>
                                <td>
                                    <a href="reader_delete.html?readerId=<c:out value='${reader.readerId}'/>">
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
