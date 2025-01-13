<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加读者</title>
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

        /* 页面背景样式 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('img/school.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 表单容器样式 */
        .content-wrapper {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 40px 50px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            margin: 100px auto;
            max-width: 600px;
            position: relative;
        }

        /* 标题样式 */
        .panel-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            color: #337ab7;
            margin-bottom: 20px;
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

        /* 输入框分组样式 */
        .input-group {
            margin-bottom: 20px;
        }

        .input-group-addon {
            background-color: #f7f7f7;
            border: 1px solid #ddd;
            border-radius: 5px 0 0 5px;
        }

        /* 提交按钮样式 */
        .btn-success {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            background-color: #5cb85c;
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #449d44;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }

        /* 响应式布局 */
        @media (max-width: 768px) {
            .content-wrapper {
                width: 90%;
                padding: 20px;
            }

            .panel-title {
                font-size: 20px;
            }
        }
    </style>
    <script>
        $(function () {
            // 加载顶部导航栏
            $('#header').load('admin_header.html');
        });

        // 表单验证
        $(document).ready(function () {
            $("#readeredit").submit(function () {
                if (
                    $("#password").val() === '' ||
                    $("#name").val() === '' ||
                    $("#sex").val() === '' ||
                    $("#birth").val() === '' ||
                    $("#address").val() === '' ||
                    $("#phone").val() === ''
                ) {
                    alert("请填入完整读者信息！");
                    return false;
                }
                if ($("#sex").val() !== '男' && $("#sex").val() !== '女') {
                    alert("性别请输入男/女！");
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
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">添加读者</h3>
            </div>
            <div class="panel-body">
                <form action="reader_add_do.html" method="post" id="readeredit">
                    <!-- 密码 -->
                    <div class="input-group">
                        <span class="input-group-addon">密码</span>
                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                    </div>
                    <!-- 姓名 -->
                    <div class="input-group">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control" name="name" id="name" placeholder="请输入姓名">
                    </div>
                    <!-- 性别 -->
                    <div class="input-group">
                        <span class="input-group-addon">性别</span>
                        <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入性别（男/女）">
                    </div>
                    <!-- 生日 -->
                    <div class="input-group">
                        <span class="input-group-addon">生日</span>
                        <input type="date" class="form-control" name="birth" id="birth">
                    </div>
                    <!-- 地址 -->
                    <div class="input-group">
                        <span class="input-group-addon">地址</span>
                        <input type="text" class="form-control" name="address" id="address" placeholder="请输入地址">
                    </div>
                    <!-- 电话 -->
                    <div class="input-group">
                        <span class="input-group-addon">电话</span>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="请输入电话号码">
                    </div>
                    <!-- 提交按钮 -->
                    <button type="submit" class="btn btn-success">添加</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
