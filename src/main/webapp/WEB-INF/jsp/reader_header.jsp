<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    /* 导航栏整体样式 */
    .navbar {
        background-color: #ffffff; /* 背景白色 */
        border-bottom: 2px solid #ddd; /* 下边框 */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /* 统一字体 */
    }

    /* 导航栏标题样式 */
    .navbar-brand {
        font-family: "华文行楷", cursive; /* 设置品牌字体 */
        font-size: 200%; /* 字体大小 */
        color: #007bff !important; /* 标题颜色 */
    }

    .navbar-brand:hover {
        color: #0056b3 !important; /* 标题悬停颜色 */
    }

    /* 导航菜单项样式 */
    .navbar-nav > li > a {
        font-size: 16px; /* 菜单项字体大小 */
        color: #333 !important; /* 菜单项颜色 */
        padding: 12px 20px; /* 内边距调整 */
        transition: all 0.3s ease-in-out; /* 动画过渡效果 */
    }

    .navbar-nav > li:hover > a {
        background-color: #f8f9fa; /* 菜单悬停背景色 */
        color: #007bff !important; /* 悬停时文字颜色 */
        border-radius: 5px; /* 圆角 */
    }

    /* 左侧导航项悬停样式 */
    .app:hover {
        background-color: #f0f0f0; /* 背景悬停颜色 */
    }

    /* 右侧用户信息样式 */
    .navbar-nav.navbar-right > li > a {
        font-size: 14px;
        color: #666 !important;
    }

    .navbar-nav.navbar-right > li > a:hover {
        color: #dc3545 !important; /* 悬停时变为红色 */
    }

    /* 响应式菜单按钮样式 */
    .navbar-toggle {
        border: none; /* 去掉按钮边框 */
    }

    .navbar-toggle .icon-bar {
        background-color: #333; /* 菜单按钮颜色 */
    }

    /* 响应式布局 */
    @media (max-width: 768px) {
        .navbar-header {
            margin-left: 5%; /* 小屏幕缩小左间距 */
            margin-right: 5%; /* 小屏幕缩小右间距 */
        }
        .navbar-nav > li > a {
            padding: 10px 15px; /* 小屏幕内边距调整 */
        }
    }
</style>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- 左侧品牌 -->
        <div class="navbar-header" style="margin-left: 8%; margin-right: 1%">
            <a class="navbar-brand" href="reader_books.html">我的图书馆</a>
        </div>

        <!-- 导航菜单 -->
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="app">
                    <a href="reader_books.html">图书查询</a>
                </li>
                <li class="app">
                    <a href="reader_info.html">个人信息</a>
                </li>
                <li class="app">
                    <a href="mylend.html">我的借还</a>
                </li>
                <li class="app">
                    <a href="reader_repasswd.html">密码修改</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="reader_info.html">
                        <!-- <span class="glyphicon glyphicon-user" aria-hidden="false"></span>  -->
                        ${readercard.name}, 已登录
                    </a>
                </li>
                <li>
                    <a href="login.html">
                        <!-- <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>  -->
                        退出
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
            