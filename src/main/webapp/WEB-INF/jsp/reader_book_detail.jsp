<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《${detail.name}》</title>
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

        /* 主容器 */
        .content-wrapper {
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        /* 图书封面样式 */
        .book-cover {
            text-align: center;
        }

        .book-cover img {
            width: 100%;
            max-width: 250px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        /* 表格样式 */
        .table {
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* 标题栏样式 */
        .panel-heading {
            background-color: #337ab7 !important;
            color: white !important;
            font-size: 18px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('reader_header.html'); // 加载顶部导航栏
        });
    </script>
</head>
<body>
    <!-- 导航栏 -->
    <div id="header"></div>

    <!-- 内容容器 -->
    <div class="container content-wrapper">
        <div class="row">
            <!-- 左侧：图书封面 -->
            <div class="col-md-4 book-cover">
                <img src="img/books/${detail.isbn}.jpg" alt="《${detail.name}》封面">
            </div>

            <!-- 右侧：图书详细信息 -->
            <div class="col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">《${detail.name}》</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th width="20%">书名</th>
                                    <td>${detail.name}</td>
                                </tr>
                                <tr>
                                    <th>作者</th>
                                    <td>${detail.author}</td>
                                </tr>
                                <tr>
                                    <th>出版社</th>
                                    <td>${detail.publish}</td>
                                </tr>
                                <tr>
                                    <th>ISBN</th>
                                    <td>${detail.isbn}</td>
                                </tr>
                                <tr>
                                    <th>简介</th>
                                    <td>${detail.introduction}</td>
                                </tr>
                                <tr>
                                    <th>语言</th>
                                    <td>${detail.language}</td>
                                </tr>
                                <tr>
                                    <th>价格</th>
                                    <td>${detail.price}</td>
                                </tr>
                                <tr>
                                    <th>出版日期</th>
                                    <td>${detail.pubdate}</td>
                                </tr>
                                <tr>
                                    <th>分类号</th>
                                    <td>${detail.classId}</td>
                                </tr>
                                <tr>
                                    <th>状态</th>
                                    <td>
                                        <c:if test="${detail.number > 0}">
                                            在馆
                                        </c:if>
                                        <c:if test="${detail.number == 0}">
                                            借出
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
