<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        /* 背景设置，添加深色遮罩 */
        body {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('img/lizhi.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Arial", sans-serif;
            color: #333; /* 深色字体 */
            margin: 0;
            padding: 0;
        }

        /* 主容器样式 */
        .panel {
            background-color: #ffffff; /* 白色背景 */
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* 柔和阴影 */
            margin: 30px auto;
            padding: 20px;
            width: 50%; /* 宽度调整为 50% */
            max-width: 800px; /* 限制最大宽度 */
        }

        .panel-heading {
            background-color: #007bff; /* 蓝色标题背景 */
            color: white;
            font-size: 1.5em;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-radius: 10px 10px 0 0;
        }

        .panel-body {
            padding: 20px;
        }

        /* 输入框样式 */
        .input-group {
            margin-bottom: 15px; /* 增加输入框之间的间距 */
        }

        .input-group-addon {
            background-color: #f8f9fa; /* 浅灰色背景 */
            color: #333; /* 深色字体 */
            border-radius: 4px 0 0 4px; /* 左侧圆角 */
        }

        .form-control {
            border-radius: 0 4px 4px 0; /* 右侧圆角 */
            padding: 10px;
            font-size: 1em;
        }

        /* 按钮样式 */
        .btn-success {
            background-color: #28a745; /* 深绿色按钮 */
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 0.9em;
            border-radius: 5px;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838; /* 深绿色悬停效果 */
            color: #fff;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .panel {
                width: 90%; /* 小屏幕宽度调整为 90% */
            }

            .panel-title {
                font-size: 1.2em;
            }

            .btn-success {
                padding: 8px 12px;
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>
    <!-- 顶部导航 -->
    <div id="header" style="padding-bottom: 80px"></div>

    <!-- 修改表单 -->
    <div class="col-xs-12 col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">信息修改</h3>
            </div>
            <div class="panel-body">
                <form action="reader_edit_do_r.html" method="post" id="edit">
                    <div class="input-group">
                        <span class="input-group-addon">读者证号</span>
                        <input type="text" readonly="readonly" class="form-control" name="readerId" id="readerId" value="${readerinfo.readerId}">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control" name="name" id="name" value="${readerinfo.name}">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">性别</span>
                        <input type="text" class="form-control" name="sex" id="sex" value="${readerinfo.sex}">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">生日</span>
                        <input type="text" class="form-control" name="birth" id="birth" value="${readerinfo.birth}">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">地址</span>
                        <input type="text" class="form-control" name="address" id="address" value="${readerinfo.address}">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">电话</span>
                        <input type="text" class="form-control" name="phone" id="phone" value="${readerinfo.phone}">
                    </div>
                    <br />
                    <div style="text-align: center;">
                        <input type="submit" value="确定" class="btn btn-success">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // 表单验证
        $("#edit").submit(function () {
            if ($("#name").val() === '' || $("#sex").val() === '' || $("#birth").val() === '' || $("#address").val() === '' || $("#phone").val() === '') {
                alert("请填写完整信息！");
                return false;
            }
        });
    </script>
</body>
</html>
