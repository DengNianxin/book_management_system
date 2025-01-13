<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更改密码</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* 页面背景样式 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('img/book2.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 表单容器样式 */
        .panel {
            max-width: 500px; /* 限制宽度 */
            margin: 100px auto; /* 居中对齐 */
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .panel-heading {
            background-color: #337ab7 !important;
            color: #fff !important;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
        }

        /* 输入框样式 */
        .form-control {
            border-radius: 5px;
            padding: 12px;
            font-size: 15px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #66afe9;
            box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
        }

        /* 按钮样式 */
        .btn-default {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            background-color: #5cb85c;
            border: none;
            color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .btn-default:hover {
            background-color: #449d44;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }

        /* 提示框样式 */
        .alert {
            border-radius: 5px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 20px auto;
        }

        /* 提示信息样式 */
        #tishi {
            display: block;
            font-size: 14px;
            color: red;
            margin-top: -10px;
            margin-bottom: 15px;
        }
    </style>
    <script>
        $(function () {
            // 加载顶部导航栏
            $('#header').load('admin_header.html');
        });

        $(document).ready(function () {
            // 实时检测两次密码输入是否一致
            $(document).on('keyup', '#newPasswd, #reNewPasswd', function () {
                if ($("#newPasswd").val() !== $("#reNewPasswd").val() && $("#newPasswd").val() !== "" && $("#reNewPasswd").val() !== "") {
                    $("#tishi").text("两次输入的新密码不同，请检查");
                } else {
                    $("#tishi").text("");
                }
            });

            // 表单提交验证
            $("#repasswd").submit(function () {
                if ($("#oldPasswd").val() === '' || $("#newPasswd").val() === '' || $("#reNewPasswd").val() === '') {
                    $("#tishi").text("请填写完毕后提交");
                    return false;
                } else if ($("#newPasswd").val() !== $("#reNewPasswd").val()) {
                    $("#tishi").text("两次输入的新密码不同，请检查");
                    return false;
                }
            });
        });
    </script>
</head>
<body>
    <!-- 顶部导航 -->
    <div id="header" style="padding-bottom: 50px;"></div>

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

    <!-- 密码修改表单 -->
    <div class="panel panel-primary">
        <div class="panel-heading">
            密码修改
        </div>
        <div class="panel-body">
            <form method="post" action="admin_repasswd_do" id="repasswd">
                <!-- 旧密码 -->
                <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control">
                <!-- 新密码 -->
                <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control">
                <!-- 再次输入新密码 -->
                <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control">
                <!-- 提示信息 -->
                <em id="tishi"></em>
                <!-- 提交按钮 -->
                <input type="submit" value="提交" class="btn btn-default">
            </form>
        </div>
    </div>
</body>
</html>
