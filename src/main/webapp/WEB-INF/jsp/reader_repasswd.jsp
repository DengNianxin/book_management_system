<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        });
    </script>
    <style>
        /* 背景样式 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url("img/lizhi.jpg") no-repeat center center fixed;
            background-size: cover;
            color: #333;
            font-family: Arial, sans-serif;
        }

        /* 提示框 */
        .alert {
            margin: 20px auto;
            max-width: 600px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 表单容器 */
        .panel {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
            margin: 50px auto;
            max-width: 500px;
            padding: 20px;
        }

        .panel-heading {
            background-color: #007bff;
            color: white;
            font-size: 1.5em;
            text-align: center;
            padding: 15px;
            border-radius: 10px 10px 0 0;
        }

        .panel-body {
            padding: 20px;
        }

        /* 输入框样式 */
        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 1em;
            margin-bottom: 15px;
        }

        /* 提交按钮样式 */
        .btn {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            font-size: 1em;
            border: none;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
        }

        /* 提示信息 */
        #tishi {
            color: red;
            font-size: 0.9em;
            margin-top: 10px;
            display: block;
            text-align: center;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <!-- 顶部导航 -->
    <div id="header"></div>

    <!-- 提示框 -->
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

    <!-- 修改密码表单 -->
    <div class="col-xs-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">密码修改</h3>
            </div>
            <div class="panel-body">
                <form method="post" action="reader_repasswd_do" id="repasswd">
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control">
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control">
                    <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control">
                    <em id="tishi"></em>
                    <input type="submit" value="提交" class="btn">
                </form>
            </div>
        </div>
    </div>

    <!-- 表单校验 -->
    <script>
        $(document).keyup(function () {
            if (
                $("#newPasswd").val() !== $("#reNewPasswd").val() &&
                $("#newPasswd").val() !== "" &&
                $("#reNewPasswd").val() !== "" &&
                $("#newPasswd").val().length === $("#reNewPasswd").val().length
            ) {
                $("#tishi").text("提示: 两次输入的新密码不同，请检查!");
            } else {
                $("#tishi").text("");
            }
        });

        $("#repasswd").submit(function () {
            if (
                $("#oldPasswd").val() === "" ||
                $("#newPasswd").val() === "" ||
                $("#reNewPasswd").val() === ""
            ) {
                $("#tishi").text("提示: 请填写完整!");
                return false;
            } else if ($("#newPasswd").val() !== $("#reNewPasswd").val()) {
                $("#tishi").text("提示: 两次输入的新密码不同，请检查!");
                return false;
            }
        });
    </script>
</body>
</html>
