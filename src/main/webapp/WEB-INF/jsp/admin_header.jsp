<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top" style="z-index: 999; background: linear-gradient(90deg, #25c6fc, #147bdc); box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
    <div class="container-fluid">
        <!-- Logo和导航栏标题 -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar" style="background-color: #fff;"></span>
                <span class="icon-bar" style="background-color: #fff;"></span>
                <span class="icon-bar" style="background-color: #fff;"></span>
            </button>
            <a class="navbar-brand" href="admin_books.html" style="font-family: 华文行楷; font-size: 200%; color: white;">
                图书管理系统
            </a>
        </div>

        <!-- 导航菜单 -->
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <!-- 左侧导航 -->
            <ul class="nav navbar-nav">
                <!-- 图书管理 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white; font-size: 16px;">
                        图书管理 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="admin_books.html">全部图书</a></li>
                        <li class="divider"></li>
                        <li><a href="book_add.html">增加图书</a></li>
                    </ul>
                </li>
                <!-- 读者管理 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white; font-size: 16px;">
                        读者管理 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="allreaders.html">全部读者</a></li>
                        <li class="divider"></li>
                        <li><a href="reader_add.html">增加读者</a></li>
                    </ul>
                </li>
                <!-- 借还管理 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white; font-size: 16px;">
                        借还管理 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="lendlist.html">借还日志</a></li>
                    </ul>
                </li>
                <!-- 密码修改 -->
                <li>
                    <a href="admin_repasswd.html" style="color: white; font-size: 16px;">
                        密码修改
                    </a>
                </li>
            </ul>

            <!-- 右侧导航 -->
            <ul class="nav navbar-nav navbar-right">
                <!-- 已登录 -->
                <li>
                    <a href="login.html" style="color: white; font-size: 16px;">
                        ${admin.username}, 已登录
                    </a>
                </li>
                <!-- 退出 -->
                <li>
                    <a href="logout.html" style="color: white; font-size: 16px;">
                        退出
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    /* 鼠标悬停效果 */
    .nav > li > a:hover, .dropdown-menu > li > a:hover {
        background-color: rgba(255, 255, 255, 0.2); /* 背景高亮 */
        text-decoration: underline; /* 下划线效果 */
        color: #fff !important; /* 字体颜色 */
        transition: all 0.3s ease;
    }

    /* 下拉菜单 */
    .dropdown-menu {
        background-color: #147bdc; /* 菜单背景色 */
        border: none; /* 去掉边框 */
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 菜单阴影 */
    }

    .dropdown-menu > li > a {
        color: #fff; /* 字体颜色 */
        font-size: 14px;
    }

    .dropdown-menu > li > a:hover {
        background-color: rgba(255, 255, 255, 0.1); /* 悬停背景 */
        color: #fff;
    }

    /* 响应式导航栏调整 */
    @media (max-width: 768px) {
        .navbar-brand {
            font-size: 150%; /* 小屏幕标题字体缩小 */
        }

        .nav > li > a {
            font-size: 14px; /* 小屏幕导航字体缩小 */
        }
    }
</style>
