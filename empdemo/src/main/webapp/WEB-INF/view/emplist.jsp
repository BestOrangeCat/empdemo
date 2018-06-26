<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>emplist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" class="choose_All"></th>
                <th>#</th>
                <th>姓名</th>
                <th>手机</th>
                <th>性别</th>
                <th>工资</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tbody>
                <c:forEach items="${pageInfo.list}" var="emplist1" varStatus="i" >
                    <tr>
                        <td><input type="checkbox" class="item" value="${emplist1.id}"></td>
                        <td>${i.index+1}</td>
                        <td>${emplist1.name}</td>
                        <td>${emplist1.phone}</td>
                        <td>${emplist1.sex}</td>
                        <td>${emplist1.salary}</td>
                        <td>${emplist1.dept.dname}</td>
                        <td>
                            <button type="button" class="btn btn-info update_btn" update_id="${emplist1.id}">修改</button>
                            <button type="button" class="btn btn-danger delete_btn" delete_id="${emplist1.id}">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary add_Emp">增加</button>
            <button type="button" class="btn btn-danger delete_All">删除</button>
        </div>
        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${!pageInfo.isFirstPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${(pageInfo.pages-pageInfo.pageNum)>4}">
                        <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="num" varStatus="index">
                            <c:if test="${index.index==pageInfo.pageNum}" var="isindex">
                                <li class="active"><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                            <c:if test="${!isindex}">
                                <li><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${!((pageInfo.pages-pageInfo.pageNum)>4)}">
                        <c:forEach begin="${(pageInfo.pages-4)>0?(pageInfo.pages-4):1}" end="${pageInfo.pages}" var="Num" varStatus="index">
                            <c:if test="${index.index==pageInfo.pageNum}" var="isindex">
                                <li class="active"><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                            <c:if test="${index.index!=pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${index.index}">${Num}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".delete_btn").click(function () {
            var id = $(this).attr("delete_id");
            var href = "${pageContext.request.contextPath}/emp/deleteEmpById?id="+id;
            location.href = href;
        })
        $(".update_btn").click(function () {
            var id = $(this).attr("update_id");
            var href = "${pageContext.request.contextPath}/emp/updateEmpById?id="+id;
            location.href = href;
        })
    })
</script>
<script>
    $(function () {
        $(".choose_All").click(function () {
            $(".item").prop("checked",$(this).prop("checked"));
        }
        );
        $(".delete_All").click(
            function () {
                var ids = [];
                $(".item").each(function () {
                    var boo = $(this);
                    if(boo.prop("checked")){
                        ids[ids.length] = boo.val();
                    };
                });
                var href = "${pageContext.request.contextPath}/emp/deleteEmpById?id="+ids;
                location.href = href;
            }
        );
        $(".add_Emp").click(function () {
            var href = "${pageContext.request.contextPath}/emp/addEmpView";
            location.href = href;
        })
    })
</script>
</body>
</html>