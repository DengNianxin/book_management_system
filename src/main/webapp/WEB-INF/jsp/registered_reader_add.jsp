<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<html>
<head>
    <title>添加读者</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 全局背景 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('img/school.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Arial", sans-serif;
            color: #fff;
        }

        /* 主容器样式 */
        .panel {
            background-color: rgba(255, 255, 255, 0.95); /* 半透明背景 */
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3); /* 阴影效果 */
            margin-top: 50px;
            padding: 20px;
        }

        .panel-heading {
            background-color: #007bff; /* 蓝色标题栏 */
            color: white;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
        }

        .input-group-addon {
            background-color: #007bff; /* 蓝色输入框标签 */
            color: white;
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
            font-size: 1em;
        }

        /* 提交按钮样式 */
        .btn-success {
            margin-top: 20px;
            width: 100%;
            font-size: 1.2em;
            font-weight: bold;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        .btn-success:hover {
            background-color: #28a745;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3); /* 悬停阴影效果 */
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 90%;
                margin: 50px auto;
            }

            .panel-title {
                font-size: 1.2em;
            }

            .btn-success {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <!-- 顶部容器 -->
    <div id="header"></div>

    <!-- 表单容器 -->
    <div class="col-xs-12 col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">添加读者</h3>
            </div>
            <div class="panel-body">
                <form action="reader_add_do1.html" method="post" id="readeredit">
                    <!-- 密码 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">密码</span>
                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                    </div>

                    <!-- 姓名 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control" name="name" id="name" placeholder="请输入姓名">
                    </div>

                    <!-- 性别 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">性别</span>
                        <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入男/女">
                    </div>

                    <!-- 生日 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">生日</span>
                        <input type="date" class="form-control" name="birth" id="birth">
                    </div>

                    <!-- 地址 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">地址</span>
                        <input type="text" class="form-control" name="address" id="address" placeholder="请输入地址">
                    </div>

                    <!-- 电话 -->
                    <div class="input-group" style="margin-top: 20px;">
                        <span class="input-group-addon">电话</span>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入电话号码">
                    </div>

                    <!-- 提交按钮 -->
                    <button type="submit" class="btn btn-success">添加</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // 表单验证
        $("#readeredit").submit(function () {
            if ($("#password").val() === '' || $("#name").val() === '' || $("#sex").val() === '' || $("#birth").val() === '' || $("#address").val() === '' || $("#phone").val() === '') {
                alert("请填入完整读者信息！");
                return false;
            }
            if ($("#sex").val() !== '男' && $("#sex").val() !== '女') {
                alert("性别请输入男/女！");
                return false;
            }
            return true;
        });
    </script>
</body>
</html>
