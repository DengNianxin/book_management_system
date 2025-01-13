<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑《 ${detail.name}》</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 页面背景 */
        body {
            background: url('../../static/img/book2.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 顶部导航栏 */
        #header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        /* 主内容区域 */
        .main-content {
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
            min-height: 100vh; /* 占满整个视口高度 */
            padding-top: 80px; /* 避免内容覆盖导航栏 */
            box-sizing: border-box;
        }

        /* 内容容器 */
        .content-wrapper {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 700px; /* 最大宽度 */
        }

        /* 表单样式 */
        .input-group {
            margin-bottom: 20px;
        }

        .input-group-addon {
            background-color: #f7f7f7;
            border-radius: 4px 0 0 4px;
            border: 1px solid #ddd;
        }

        .form-control {
            border-radius: 0 4px 4px 0;
            border: 1px solid #ddd;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #66afe9;
            outline: none;
            box-shadow: 0 0 5px rgba(102, 175, 233, 0.6);
        }

        /* 按钮样式 */
        .btn-success {
            background-color: #5cb85c;
            border-color: #4cae4c;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
        }

        .btn-success:hover {
            background-color: #449d44;
            border-color: #398439;
        }

        /* 标题样式 */
        .panel-heading {
            background-color: #337ab7 !important;
            color: white !important;
            font-size: 18px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }

        /* 提交按钮居中 */
        .text-center {
            text-align: center;
        }
    </style>
    <script>
        $(function () {
            // 加载顶部导航栏
            $('#header').load('admin_header.html');
        });

        // 表单验证
        $(document).ready(function () {
            $("#addbook").submit(function () {
                if (
                    $("#name").val() === '' || 
                    $("#author").val() === '' || 
                    $("#publish").val() === '' || 
                    $("#isbn").val() === '' || 
                    $("#introduction").val() === '' || 
                    $("#language").val() === '' || 
                    $("#price").val() === '' || 
                    $("#pubstr").val() === '' || 
                    $("#classId").val() === '' || 
                    $("#number").val() === ''
                ) {
                    alert("请填入完整图书信息！");
                    return false;
                }
            });
        });
    </script>
</head>
<body>
    <!-- 顶部导航栏 -->
    <div id="header"></div>

    <!-- 主内容 -->
    <div class="main-content">
        <div class="content-wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">编辑《 ${detail.name}》</h3>
                </div>
                <div class="panel-body">
                    <form action="book_edit_do.html?bookId=${detail.bookId}" method="post" id="addbook">
                        <!-- 书名 -->
                        <div class="input-group">
                            <span class="input-group-addon">书名</span>
                            <input type="text" class="form-control" name="name" id="name" value="${detail.name}">
                        </div>
                        <!-- 作者 -->
                        <div class="input-group">
                            <span class="input-group-addon">作者</span>
                            <input type="text" class="form-control" name="author" id="author" value="${detail.author}">
                        </div>
                        <!-- 出版社 -->
                        <div class="input-group">
                            <span class="input-group-addon">出版社</span>
                            <input type="text" class="form-control" name="publish" id="publish" value="${detail.publish}">
                        </div>
                        <!-- ISBN -->
                        <div class="input-group">
                            <span class="input-group-addon">ISBN</span>
                            <input type="text" class="form-control" name="isbn" id="isbn" value="${detail.isbn}">
                        </div>
                        <!-- 简介 -->
                        <div class="input-group">
                            <span class="input-group-addon">简介</span>
                            <input type="text" class="form-control" name="introduction" id="introduction" value="${detail.introduction}">
                        </div>
                        <!-- 语言 -->
                        <div class="input-group">
                            <span class="input-group-addon">语言</span>
                            <input type="text" class="form-control" name="language" id="language" value="${detail.language}">
                        </div>
                        <!-- 价格 -->
                        <div class="input-group">
                            <span class="input-group-addon">价格</span>
                            <input type="text" class="form-control" name="price" id="price" value="${detail.price}">
                        </div>
                        <!-- 出版日期 -->
                        <div class="input-group">
                            <span class="input-group-addon">出版日期</span>
                            <input type="date" class="form-control" name="pubstr" id="pubstr" value="${detail.pubdate}">
                        </div>
                        <!-- 分类号 -->
                        <div class="input-group">
                            <span class="input-group-addon">分类号</span>
                            <input type="text" class="form-control" name="classId" id="classId" value="${detail.classId}">
                        </div>
                        <!-- 数量 -->
                        <div class="input-group">
                            <span class="input-group-addon">数量</span>
                            <input type="text" class="form-control" name="number" id="number" value="${detail.number}">
                        </div>

                        <!-- 提交按钮 -->
                        <div class="text-center">
                            <input type="submit" value="确定" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
