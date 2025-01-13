<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/js.cookie.js"></script>
    <style>
        /* 全局背景 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('img/timg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #fff;
        }
    
        /* 表单容器样式 */
        #login {
            max-width: 400px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            padding: 20px 30px;
        }
    
        /* 表单标题 */
        .panel-heading {
            background-color: #007bff !important;
            color: white !important;
            text-align: center;
            font-size: 1.5em;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
            padding: 10px;
        }
    
        /* 标签样式 */
        label {
            color: #333; /* 深灰色字体 */
            font-size: 15px;
            margin-bottom: 5px;
            display: block;
        }
    
        /* 输入框样式 */
        .form-control {
            background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
            border: 1px solid #ccc; /* 边框颜色 */
            color: #333; /* 深灰色字体 */
            border-radius: 5px;
            padding: 10px;
            font-size: 15px;
            margin-bottom: 15px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s, box-shadow 0.3s;
        }
    
        .form-control:focus {
            border-color: #007bff; /* 高亮边框 */
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
        }
    
        /* 验证码输入框 */
        #yzm {
            width: 65%;
            display: inline-block;
            background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 15px;
            color: #333; /* 深灰色字体 */
            margin-bottom: 15px;
        }
    
        #image {
            vertical-align: middle;
            cursor: pointer;
            margin-left: 5px;
        }
    
        /* 按钮样式 */
        .btn-primary {
            border: none;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
    
        .btn-primary:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }
    
        /* 提示信息 */
        #info {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
    
        /* 记住密码标签 */
        .checkbox label {
            color: #333; /* 深灰色字体 */
            font-size: 14px;
        }
    
        /* 响应式设计 */
        @media (max-width: 768px) {
            h2 {
                font-size: 3em;
            }
    
            #login {
                width: 90%;
            }
        }
    </style>
    
</head>
<body>
    <!-- 页面标题 -->
    <h2>图 书 馆</h2>

    <!-- 登录表单 -->
    <div class="panel panel-default" id="login">
        <div class="panel-heading">
            请登录
        </div>
        <div class="panel-body">
            <!-- 账号输入框 -->
            <div class="form-group">
                <label for="id">账号</label>
                <input type="text" class="form-control" id="id" placeholder="请输入账号">
            </div>
            <!-- 密码输入框 -->
            <div class="form-group">
                <label for="passwd">密码</label>
                <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
            </div>
            <!-- 验证码输入框 -->
            <div class="form-group">
                <label for="yzm">验证码</label><br/>
                <input type="text" id="yzm" placeholder="请输入验证码">
                <img id="image" border="0" onclick="refresh()" src="/image.html" title="点击更换图片">
            </div>
            <!-- 提示信息 -->
            <p id="info"></p>
            <!-- 记住密码 -->
            <div class="checkbox">
                <label>
                    <input type="checkbox" id="remember"> 记住密码
                </label>
            </div>
            <!-- 登录按钮 -->
            <button id="loginButton" class="btn btn-primary btn-block">登录</button>
            <!-- 注册按钮 -->
            <button id="registeredButton" class="btn btn-primary btn-block">注册</button>
        </div>
    </div>

    <!-- 脚本 -->
    <script>
        function refresh() {
            // IE浏览器缓存问题，通过加时间戳解决
            document.getElementById("image").src = "/image.html?" + new Date().getTime();
        }

        $("#id").keyup(function () {
            if (isNaN($("#id").val())) {
                $("#info").text("提示: 账号只能为数字");
            } else {
                $("#info").text("");
            }
        });

        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, { expires: 30, path: '' });
        }

        function setLoginStatus() {
            var loginStatus = Cookies.getJSON('loginStatus');
            if (loginStatus) {
                $('#id').val(loginStatus.username);
                $('#passwd').val(loginStatus.password);
                $("#remember").prop('checked', loginStatus.remember);
            }
        }

        setLoginStatus();

        $("#loginButton").click(function () {
            var id = $("#id").val();
            var passwd = $("#passwd").val();
            var yzm = $("#yzm").val();
            var remember = $("#remember").prop('checked');

            if (id === '') {
                alert("提示: 账号不能为空");
            } else if (passwd === '') {
                alert("提示: 密码不能为空");
            } else if (isNaN(id)) {
                alert("提示: 账号必须为数字");
            } else if (yzm === '') {
                alert("提示: 验证码不能为空");
            } else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck",
                    data: { id, passwd, yzm },
                    dataType: "json",
                    success: function (data) {
                        if (data.stateCode === "0") {
                            alert("提示: 账号或密码错误！");
                        } else if (data.stateCode === "1") {
                            alert("提示: 登录成功，跳转中...");
                            if (remember) rememberLogin(id, passwd, remember);
                            window.location.href = "/admin_books.html";
                        } else if (data.stateCode === "3") {
                            alert("提示: 验证码错误！(区分大小写)");
                        }
                    }
                });
            }
        });

        $("#registeredButton").click(function () {
            window.location.href = "/reader1_add.html";
        });
    </script>
</body>
</html>
