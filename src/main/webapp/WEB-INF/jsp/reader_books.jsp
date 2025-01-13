<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 背景设置 */
        body {
            background: url('img/lizhi.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 搜索框容器 */
        .search-container {
            margin: 50px auto;
            margin-bottom: 20px;
            text-align: center;
        }

        .search-container .input-group {
            width: 50%;
            margin: 0 auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            display: flex;
            align-items: stretch;
        }

        /* 添加搜索按钮样式 */
        .search-container .input-group-btn {
            display: flex;
        }

        .search-container .input-group-btn .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            padding: 0 20px;
            margin: 0;
        }

        .search-container .form-control {
            height: 38px;  /* 设置固定高度 */
        }

        /* 提示框样式 */
        .alert {
            width: 90%;
            margin: 20px auto;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* 内容外层容器 */
        .content-wrapper {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            margin-top: 50px;
        }

        /* 表格样式 */
        .table {
            border-radius: 8px;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .table-hover tbody tr:hover {
            background: #f9f9f9;
        }

        /* 按钮样式 */
        .btn-xs {
            padding: 5px 10px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #337ab7;
            border-color: #2e6da4;
        }

        .btn-primary:hover {
            background-color: #286090;
            border-color: #204d74;
        }

        .btn-danger {
            background-color: #d9534f;
            border-color: #d43f3a;
        }

        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }

        .btn-success {
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        .btn-success:hover {
            background-color: #449d44;
            border-color: #398439;
        }

        .btn-default {
            background-color: #f7f7f7;
            border-color: #ddd;
        }

        .btn-default:hover {
            background-color: #e6e6e6;
            border-color: #d5d5d5;
        }

        /* 标题样式 */
        .panel-heading {
            background-color: #337ab7;
            color: white;
            font-size: 18px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('reader_header.html'); // 加载菜单栏
        });

        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
                alert("请输入关键字");
                return false;
            }
        });
    </script>
</head>
<body>
    <!-- 菜单栏 -->
    <div id="header"></div>

    <!-- 搜索框 -->
    <div class="search-container">
        <form method="post" action="reader_querybook_do.html" class="form-inline" id="searchform">
            <div class="input-group">
                <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord">
                <span class="input-group-btn">
                    <input type="submit" value="搜索" class="btn btn-default">
                </span>
            </div>
        </form>
    </div>

    <!-- 提示信息 -->
    <div class="container">
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

    <!-- 图书表格 -->
    <div class="container content-wrapper">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">全部图书</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>书名</th>
                            <th>作者</th>
                            <th>出版社</th>
                            <th>ISBN</th>
                            <th>价格</th>
                            <th>剩余数量</th>
                            <th>借还</th>
                            <th>详情</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${books}" var="book">
                            <tr>
                                <td><c:out value="${book.name}" /></td>
                                <td><c:out value="${book.author}" /></td>
                                <td><c:out value="${book.publish}" /></td>
                                <td><c:out value="${book.isbn}" /></td>
                                <td><c:out value="${book.price}" /></td>
                                <td><c:out value="${book.number}" /></td>
                                <c:set var="flag" value="false" />
                                <c:forEach var="lend" items="${myLendList}">
                                    <c:if test="${lend eq book.bookId}">
                                        <c:set var="flag" value="true" />
                                    </c:if>
                                </c:forEach>
                                <c:if test="${flag}">
                                    <td>
                                        <a href="returnbook.html?bookId=<c:out value='${book.bookId}'/>">
                                            <button type="button" class="btn btn-danger btn-xs">归还</button>
                                        </a>
                                    </td>
                                </c:if>
                                <c:if test="${not flag}">
                                    <c:if test="${book.number > 0}">
                                        <td>
                                            <a href="lendbook.html?bookId=<c:out value='${book.bookId}'/>">
                                                <button type="button" class="btn btn-primary btn-xs">借阅</button>
                                            </a>
                                        </td>
                                    </c:if>
                                    <c:if test="${book.number == 0}">
                                        <td>
                                            <button type="button" class="btn btn-default btn-xs" disabled>已空</button>
                                        </td>
                                    </c:if>
                                </c:if>
                                <td>
                                    <a href="reader_book_detail.html?bookId=<c:out value='${book.bookId}'/>">
                                        <button type="button" class="btn btn-success btn-xs">详情</button>
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
