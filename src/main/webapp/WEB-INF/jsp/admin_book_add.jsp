<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息添加</title>
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

        /* 背景样式 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('img/sky.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* 表单容器样式 */
        .content-wrapper {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 40px 50px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            margin: 100px auto;
            max-width: 700px;
            text-align: left;
        }

        /* 表单标题样式 */
        .form-title {
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            color: #337ab7;
            margin-bottom: 30px;
            position: relative;
        }

        .form-title::after {
            content: "";
            display: block;
            width: 100px;
            height: 3px;
            background: #337ab7;
            margin: 10px auto 0;
            border-radius: 5px;
        }

        /* 输入框样式 */
        .form-control {
            border-radius: 5px;
            padding: 12px 15px;
            font-size: 15px;
            border: 1px solid #ddd;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #66afe9;
            box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
            outline: none;
        }

        /* 按钮样式 */
        .btn-success {
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            background: #5cb85c;
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background: #449d44;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }

        /* 标签样式 */
        label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
            color: #555;
        }

        /* 响应式优化 */
        @media (max-width: 768px) {
            .content-wrapper {
                width: 90%;
                padding: 20px;
            }

            .form-title {
                font-size: 24px;
            }
        }
    </style>
    <script>
        $(function () {
            // 加载导航栏
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
                    $("#className").val() === '' ||
                    $("#location").val() === '' ||
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
    <!-- 顶部导航 -->
    <div id="header"></div>

    <!-- 表单内容 -->
    <div class="content-wrapper">
        <div class="form-title">图书信息添加</div>
        <form action="book_add_do.html" method="post" id="addbook">
            <!-- 图书名 -->
            <div class="form-group">
                <label for="name">图书名</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
            </div>
            <!-- 作者 -->
            <div class="form-group">
                <label for="author">作者</label>
                <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名">
            </div>
            <!-- 出版社 -->
            <div class="form-group">
                <label for="publish">出版社</label>
                <input type="text" class="form-control" name="publish" id="publish" placeholder="请输入出版社">
            </div>
            <!-- ISBN -->
            <div class="form-group">
                <label for="isbn">ISBN</label>
                <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN">
            </div>
            <!-- 简介 -->
            <div class="form-group">
                <label for="introduction">简介</label>
                <textarea class="form-control" rows="3" name="introduction" id="introduction" placeholder="请输入简介"></textarea>
            </div>
            <!-- 语言 -->
            <div class="form-group">
                <label for="language">语言</label>
                <input type="text" class="form-control" name="language" id="language" placeholder="请输入语言">
            </div>
            <!-- 价格 -->
            <div class="form-group">
                <label for="price">价格</label>
                <input type="text" class="form-control" name="price" id="price" placeholder="请输入价格">
            </div>
            <!-- 出版日期 -->
            <div class="form-group">
                <label for="pubstr">出版日期</label>
                <input type="date" class="form-control" name="pubstr" id="pubstr">
            </div>
            <!-- 分类 -->
            <div class="form-group">
                <label for="className">分类</label>
                <input type="text" class="form-control" name="className" id="className" placeholder="请输入分类">
            </div>
            <div class="form-group">
                <label for="location">位置</label>
                <input type="text" class="form-control" name="className" id="location" placeholder="请输入分类">
            </div>
            <!-- 数量 -->
            <div class="form-group">
                <label for="number">数量</label>
                <input type="text" class="form-control" name="number" id="number" placeholder="请输入图书数量">
            </div>
            <!-- 提交按钮 -->
            <div class="text-center">
                <button type="submit" class="btn btn-success">添加</button>
            </div>
        </form>
    </div>
</body>
</html>
