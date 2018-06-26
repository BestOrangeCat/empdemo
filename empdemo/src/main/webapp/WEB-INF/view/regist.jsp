<%--
  Created by IntelliJ IDEA.
  User: 79443
  Date: 2018/6/26
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>regist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal regist" action="${pageContext.request.contextPath}/user/regist">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6 username">
                    <input type="text" class="form-control" id="username" placeholder="username" name="username">
                </div>
            </div>
            <div class="form-group password">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6 password_1">
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                </div>
            </div>
            <div class="form-group">
                <label for="password1" class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-6 password1">
                    <input type="password" class="form-control" id="password1" placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <label for="img_a" class="col-sm-2 control-label">头像</label>
                <div class="col-sm-6">
                    <input type="file" id="img_a" >
                    <p class="help-block">仅支持png，jpg类型图片</p>
                    <img src="..." alt="..." class="img-thumbnail" id="img_b" width="150px" height="150px">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <button type="button" class="btn btn-default submit">确定</button>
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
        var isusername = false;
        var ispassword = false;
        var ispassword1 = false;
        $("#username").blur(function () {
            var test = $(this).val();
            reg=/[a-zA-Z]{0,5}/;
            if(reg.test(test)){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/checkUsername?username="+test,
                    type:"get",
                    success:function (data) {
                        var a = data.trim();
                        if(a=="true"){
                            $(".username").attr("class","col-sm-6 username has-success");
                            isusername=true;
                        }else{
                            $(".username").attr("class","col-sm-6 username has-error");
                            isusername!=false;
                        }
                    }
                })
            }else{
                $(".username").attr("class","col-sm-6 username has-error");
                isusername!=false;
            }
        });
        $("#password").blur(function () {
            var test = $(this).val();
            if(test!=""){
                $(".password_1").attr("class","col-sm-6 password_1 has-success");
                ispassword=true;
            }else{
                $(".password_1").attr("class","col-sm-6 password_1 has-error");
                ispassword=false;
            }
        });
        $("#password1").blur(function () {
            var test = $(this).val();
            if(test!=""){
                if(test==$("#password").val()){
                    $(".password1").attr("class","col-sm-6 password1 has-success");
                    ispassword1=true;
                }
            }else {
                $(".password1").attr("class","col-sm-6 password1 has-error");
                ispassword1=false;
            }
        });
        $(".submit").click(function () {
            if(isusername&&ispassword&&ispassword1){
                $(".regist").submit();
            }
        });
        $("#img_a").change(function () {
            var path = $(this).val();
            var suffix = path.substring(path.indexOf("."));
            if(suffix==".png"||suffix==".jpg"){
                var reader = new FileReader();
                var img = document.getElementById("img_a").files[0];
                reader.readAsDataURL(img);
                reader.onload = function (e) {
                    $("#img_b").attr("src",this.result);
                }
            }
        });
    })
</script>
</body>
</html>