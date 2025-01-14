<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        /* 主容器样式 */
        .content-wrapper {
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        /* Flex 布局用于居中对齐 */
        .row {
            display: flex;
            align-items: center; /* 竖直居中 */
            justify-content: space-between;
        }

        /* 图书封面样式 */
        .book-cover {
            text-align: center;
            flex: 1.5; /* 增加图片区域的比例 */
            max-width: 300px; /* 限制最大宽度 */
        }

        .book-cover img {
            width: 100%;
            max-height: 100%; /* 调整最大高度 */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        /* 书籍信息表格样式 */
        .panel {
            flex: 2.5; /* 减少书籍信息区域的比例 */
            margin-left: 20px; /* 左右间距 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        .panel-heading {
            background-color: #337ab7 !important;
            color: white !important;
            font-size: 18px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        /* 表格样式 */
        .table th, .table td {
            vertical-align: middle !important;
            padding: 10px 15px;
        }

        /* 响应式布局 */
        @media (max-width: 768px) {
            .row {
                flex-direction: column; /* 小屏幕上下排列 */
            }

            .panel {
                margin-left: 0;
                margin-top: 20px;
            }

            .book-cover img {
                max-height: 200px; /* 小屏幕图片高度调整 */
            }
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
            <div class="book-cover">
                <img src="img/books/${detail.isbn}.jpg" alt="《${detail.name}》封面">
            </div>

            <!-- 右侧：图书详细信息 -->
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
                                <td>￥${detail.price}</td>
                            </tr>
                            <tr>
                                <th>出版日期</th>
                                <td>
                                    <fmt:formatDate value="${detail.pubdate}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                            <tr>
                                <th>分类</th>
                                <td>${detail.className}</td>
                            </tr>
                            <tr>
                                <th>位置</th>
                                <td>
                                    <c:set var="location" value="${detail.location}" />
                                    <c:set var="floor" value="${fn:substring(location, 1, 3)}楼" />
                                    <c:set var="area" value="${fn:substring(location, 3, 4)}区" />
                                    <c:set var="shelf" value="${fn:substring(location, 5, 7)}号书架" />
                                    <c:set var="layer" value="${fn:substring(location, 8, 10)}层" />
                                    <c:set var="side" value="${fn:substring(location, 10, 11)}" />
                                    <c:choose>
                                        <c:when test="${side eq 'R'}">
                                            <c:set var="side" value="右侧" />
                                        </c:when>
                                        <c:when test="${side eq 'M'}">
                                            <c:set var="side" value="中间" />
                                        </c:when>
                                        <c:when test="${side eq 'L'}">
                                            <c:set var="side" value="左侧" />
                                        </c:when>
                                    </c:choose>
                                    <c:out value="${floor} ${area} ${shelf} ${layer} ${side}" />
                                </td>
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
        <!-- 返回按钮 -->
        <div class="text-center">
            <a href="reader_books.html" class="btn btn-primary">关闭</a>
        </div>
    </div>
</body>
</html>
