<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>addEmp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal" id="update_Emp" action="${pageContext.request.contextPath}/emp/updateEmpView">
            <input type="hidden" name="id" value="${emp_id.id}">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">性名</label>
                <div class="col-sm-6 name_legitimate">
                    <input type="text" class="form-control" id="name" name="name" value="${emp_id.name}">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">电话</label>
                <div class="col-sm-6 phone_legitimate">
                    <input type="text" class="form-control" id="phone" value="${emp_id.phone}" onkeyup="value=value.replace(/[^\d]/g,'')" name="phone">
                </div>
            </div>
            <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">性别</label>
                <div class="radio" id="sex" style="left: 15px">
                    <label>
                        <input type="radio" name="sex"  value="男" <c:if test="${emp_id.sex.equals('男')}">checked</c:if>>男
                    </label>
                    <label>
                        <input type="radio" name="sex"  value="女" <c:if test="${emp_id.sex.equals('女')}">checked</c:if>>女
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class="col-sm-2 control-label">工资</label>
                <div class="col-sm-6 salary_legitimate">
                    <input type="text" class="form-control" id="salary" name="salary" value="${emp_id.salary}" onkeyup="value=value.replace(/[^\d]/g,'')">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">部门</label>
                <div class="col-sm-6">
                    <select class="form-control" name="dept_id">
                        <c:forEach items="${deptList}" var="item">
                            <option value="${item.id}" <c:if test="${emp_id.dept_id==item.id}">selected="selected"</c:if>>${item.dname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default submit">确认</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        var isname = true;
        var isphone = true;
        var issalary = true;
        $("#name").blur(function () {
            var test = $("#name").val();
            reg =/^[\u4e00-\u9fa5]{2,4}$/;
            if(reg.test(test)){
                $(".name_legitimate").attr("class","col-sm-6 name_legitimate has-success");
                isname=true;
            }else{
                $(".name_legitimate").attr("class","col-sm-6 name_legitimate has-error");
                isname=false;
            }
        })
        $("#phone").blur(function () {
            var test = $("#phone").val();
            reg =/^[1][3,4,5,7,8][0-9]{9}$/;
            if(reg.test(test)){
                $(".phone_legitimate").attr("class","col-sm-6 phone_legitimate has-success");
                isphone=true;
            }else{
                $(".phone_legitimate").attr("class","col-sm-6 phone_legitimate has-error");
                isphone=false;
            }
        })
        $("#salary").blur(function () {
            var test = $("#salary").val();
            reg =/^[0-9]{0,6}$/;
            if(reg.test(test)){
                $(".salary_legitimate").attr("class","col-sm-6 salary_legitimate has-success");
                issalary=true;
            }else{
                $(".salary_legitimate").attr("class","col-sm-6 salary_legitimate has-error");
                issalary=false;
            }
        })
        $(".submit").click(function () {
            if(isname&&isphone&&issalary){
                $("#update_Emp").submit();
            }
        })
    })
</script>
</body>
</html>
