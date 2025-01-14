<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>逾期未还的图书清单</title>
    <link rel="shortcut icon" href="img/library.ico"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
            // 检查是否有逾期未还的书籍，如果有则显示模态框
            if (${!empty overdueLends}) {
                $('#overdueModal').modal('show');
            }
        })
    </script>
</head>
<body background="img/lizhi.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%; background-attachment: fixed;">

<div id="header"></div>

<!-- 逾期未还的书籍提示模态框 -->
<div id="overdueModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">警告</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>您有逾期未还的书籍，请归还后再借书。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="container" style="padding: 20px 0;">
    <c:if test="${!empty overdueLends}">
        <div class="panel panel-default" style="width: 90%; margin-left: 5%;">
            <div class="panel-heading" style="background-color: #fff;">
                <h3 class="panel-title">逾期未还的图书</h3>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>服务号</th>
                        <th>书号</th>
                        <th>读者证号</th>
                        <th>借出日期</th>
                        <th>应还日期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${overdueLends}" var="lend">
                        <tr>
                            <td>${lend.ser_num}</td>
                            <td>${lend.bookId}</td>
                            <td>${lend.readerId}</td>
                            <td>
                                <fmt:formatDate value="${lend.lendDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${lend.dueDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <a href="returnbook.html?bookId=${lend.bookId}">
                                    <button type="button" class="btn btn-danger btn-xs">归还</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
    <c:if test="${empty overdueLends}">
        <div class="alert alert-info" role="alert">
            您没有逾期未还的图书。
        </div>
    </c:if>
</div>

</body>
</html>