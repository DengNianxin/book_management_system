<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑读者信息《${readerInfo.readerId}》</title>
    <link rel="shortcut icon" href="img/library.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html'); // 加载头部导航
        });
    </script>
    <style>
        /* 背景样式 */
        body {
            background: url('img/book2.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #333;
        }

        /* 主容器样式 */
        .container {
            max-width: 500px; /* 调整最大宽度 */
            margin: 50px auto; /* 居中对齐，顶部增加间距 */
            background: rgba(255, 255, 255, 0.9); /* 半透明白色背景 */
            padding: 20px; /* 内边距 */
            border-radius: 10px; /* 圆角 */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 阴影效果 */
        }

        .panel-heading {
            background-color: #337ab7 !important; /* 标题背景颜色 */
            color: white !important; /* 标题文字颜色 */
            font-size: 18px; /* 字体大小 */
            text-align: center; /* 居中对齐 */
            border-radius: 10px 10px 0 0; /* 圆角 */
        }

        /* 表单输入框样式 */
        .input-group {
            margin-bottom: 15px; /* 每个输入框的间距 */
        }

        .input-group-addon {
            background-color: #f8f9fa; /* 添加背景颜色 */
            font-weight: bold; /* 字体加粗 */
        }

        .form-control {
            border-radius: 5px; /* 输入框圆角 */
        }

        /* 提交按钮样式 */
        .btn-success {
            width: 100%; /* 按钮宽度占满 */
            margin-top: 20px; /* 按钮与输入框的距离 */
            border-radius: 5px; /* 按钮圆角 */
        }

        .btn-success:hover {
            background-color: #28a745; /* 悬停背景颜色 */
        }

        /* 响应式布局 */
        @media (max-width: 768px) {
            .container {
                max-width: 90%; /* 小屏幕下宽度调整 */
                padding: 15px; /* 减少内边距 */
            }
        }
    </style>
</head>
<body>
    <!-- 顶部导航栏 -->
    <div id="header" style="padding-bottom: 80px"></div>

    <!-- 主体内容 -->
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">编辑读者信息《${readerInfo.readerId}》</h3>
            </div>
            <div class="panel-body">
                <form action="reader_edit_do.html?readerId=${readerInfo.readerId}" method="post" id="readeredit">
                    <div class="input-group">
                        <span class="input-group-addon">姓名</span>
                        <input type="text" class="form-control" name="name" id="name" value="${readerInfo.name}" placeholder="请输入姓名">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">性别</span>
                        <select class="form-control" name="sex" id="sex">
                            <option value="男" ${readerInfo.sex == '男' ? 'selected' : ''}>男</option>
                            <option value="女" ${readerInfo.sex == '女' ? 'selected' : ''}>女</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">生日</span>
                        <input type="date" class="form-control" name="birth" id="birth" value="${readerInfo.birth}" placeholder="请输入生日">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">地址</span>
                        <input type="text" class="form-control" name="address" id="address" value="${readerInfo.address}" placeholder="请输入地址">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">电话</span>
                        <input type="text" class="form-control" name="phone" id="phone" value="${readerInfo.phone}" placeholder="请输入电话号码">
                    </div>
                    <input type="submit" value="确定" class="btn btn-success">
                    <script>
                        // 表单提交验证
                        $("#readeredit").submit(function () {
                            if ($("#name").val() === '' || $("#sex").val() === '' || $("#birth").val() === '' || $("#address").val() === '' || $("#phone").val() === '') {
                                alert("请填入完整读者信息！");
                                return false;
                            }
                        });
                    </script>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
