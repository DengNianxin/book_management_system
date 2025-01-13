<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background: url('img/book1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

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

        /* 搜索框容器 */
        .search-container {
            margin: 100px auto 20px; /* 减少搜索框与内容的上下距离 */
            text-align: center;
        }

        /* 搜索框样式 */
        .search-container .input-group {
            width: 50%;
            margin: 0 auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* 表格样式 */
        .table {
            border-radius: 8px;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* 消息提示框 */
        .alert {
            width: 90%;
            margin: 20px auto;
            border-radius: 5px;
        }

        /* 内容外层容器 */
        .content-wrapper {
            margin-top: 50px; /* 减少内容与顶部菜单栏的距离 */
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html'); // 加载顶部菜单栏
        });

        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val === '') {
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
        <form method="post" action="querybook.html" class="form-inline" id="searchform">
            <div class="input-group">
                <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-primary">搜索</button>
                </span>
            </div>
        </form>
    </div>

    <!-- 提示框 -->
    <div>
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

    <!-- 图书信息表 -->
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
                            <th>详情</th>
                            <th>编辑</th>
                            <th>删除</th>
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
                                <td>
                                    <a href="admin_book_detail.html?bookId=<c:out value='${book.bookId}'/>">
                                        <button type="button" class="btn btn-success btn-xs">详情</button>
                                    </a>
                                </td>
                                <td>
                                    <a href="updatebook.html?bookId=<c:out value='${book.bookId}'/>">
                                        <button type="button" class="btn btn-info btn-xs">编辑</button>
                                    </a>
                                </td>
                                <td>
                                    <a href="deletebook.html?bookId=<c:out value='${book.bookId}'/>">
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
