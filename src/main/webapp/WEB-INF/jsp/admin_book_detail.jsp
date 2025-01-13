<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.name}》</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body {
            background: url('../../static/img/book2.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        .panel {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .panel-heading {
            background-color: #337ab7 !important;
            color: white !important;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .panel-title {
            font-size: 20px;
        }

        .image-container {
            display: flex;
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
        }

        .image-container img {
            max-height: 100%; /* 统一图片高度 */
            max-width: 100%; /* 防止图片溢出 */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .content-wrapper {
            margin-top: 20px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .table th, .table td {
            vertical-align: middle !important;
        }

        .row {
            display: flex;
            align-items: center; /* 保证左右两部分在竖直方向居中 */
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .row {
                flex-direction: column; /* 小屏幕下上下排列 */
            }

            .image-container img {
                max-height: 200px; /* 小屏幕下图片高度调整 */
            }
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        });
    </script>
</head>
<body>
<div id="header" style="padding-bottom: 80px;"></div>

<div class="container">
    <div class="row content-wrapper">
        <!-- 左侧图片展示 -->
        <div class="col-md-4 image-container">
            <img src="img/books/${detail.isbn}.jpg" alt="书籍封面" class="img-responsive">
        </div>

        <!-- 右侧书籍详情 -->
        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">《 ${detail.name}》</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <th>书名</th>
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
                            <th>数量</th>
                            <td>${detail.number}</td>
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
