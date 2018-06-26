<%--
  Created by IntelliJ IDEA.
  User: 79443
  Date: 2018/6/26
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deptlist</title>
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
                <th><input type="checkbox"></th>
                <th>#</th>
                <th>部门名</th>
                <th>所在地</th>
                <th style="width: 15%">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dept" items="${pageInfo.list}" varStatus="i" >
            <tr>
                <td><input type="checkbox"></td>
                <td>${i.index+1}</td>
                <td>${dept.dname}</td>
                <td>${dept.location}</td>
                <td>
                    <button type="button" class="btn btn-info">修改</button>
                    <button type="button" class="btn btn-danger">删除</button>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-9">
            <button type="button" class="btn btn-primary">增加</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
        <div class="col-sm-3">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li <c:if test="${pageInfo.isFirstPage}">class="disabled"</c:if>>
                        <a <c:if test="${!pageInfo.isFirstPage}">href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${pageInfo.prePage}"</c:if> aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="item">
                        <li <c:if test="${pageInfo.pageNum==item}">class="active"</c:if>><a href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${item}" >${item}</a></li>
                    </c:forEach>
                    <li <c:if test="${pageInfo.isLastPage}">class="disabled"</c:if>>
                        <a <c:if test="${!pageInfo.isLastPage}">href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${pageInfo.nextPage}"</c:if> aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row foot"></div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>