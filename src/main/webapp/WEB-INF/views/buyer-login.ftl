<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="zmall,登录" />
    <meta name="description" content="买家登录页" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">
    <div align="center">
        <div>
            <img src="./../static/icon/tao.ico" width="50px" height="50px"
        </div>
        <div>
            账号：<input id="buyerAccountKey" type="text" placeholder="请输入zmall账号" autofocus="autofocus" maxlength="20">
            <em id="accountHint"></em>
        </div>
        <div>
            密码：<input id="buyerPasswordKey" type="text" placeholder="请输入6-16位密码" minlength="6" maxlength="16">
            <em id="passwordHint"></em>
        </div>
        <div>
            <button id="loginBtn" type="button" onclick="buyerLogin()">登录</button>
        </div>
        <div><em id="errorHint"></em></div>
    </div>

</div>

</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script>
    var ctx = '${request.contextPath}';

    //前端校验数据
    function datacheck(buyerAccount, buyerPassword) {
        var isPass = false;
        //!buyerAccount—同时判断 null 和 undefined ;
        if (buyerAccount && buyerAccount.length!=0 && buyerAccount.length<21) {  //account非空
            if (buyerPassword && buyerPassword.length!=0) { //password非空
                if(buyerPassword.length>=6 && buyerPassword.length<=16) {  //密码6-16位
                    isPass = true;//前端数据校验验证通过
                } else {
                    $("#passwordHint").html("您输入的密码长度为"+buyerPassword.length+",请输入6至16位密码！");
                }
            } else {
                $("#passwordHint").html("密码不能为空，请您重新输入");
            }
        } else {
            $("#accountHint").html("账号不能为空且长度不超过20位，请您重新输入！");
        }
        return isPass;
    }


    //点击登录后执行的方法
    function buyerLogin() {
        var buyerAccount = $("#buyerAccountKey").val().trim();
        var buyerPassword = $("#buyerPasswordKey").val().trim();
        var requestUrl = ctx + "/api/buyerLogin";

        if (!datacheck(buyerAccount, buyerPassword)){
            return;
        }
        $.ajax({
            type: "POST",
            url: requestUrl,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({
                buyerAccount: buyerAccount,
                buyerPassword: buyerPassword
            }),
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                var isSuccess = data.responseStatus.success;
                var resultCode = data.responseStatus.resultCode;
                var resultMsg = data.responseStatus.resultMsg;
                if (isSuccess) {  //登录成功之后的一系列操作

                } else {  //登录不成功的一系列提示
                    console.log(resultCode);
                    $("#errorHint").html(resultMsg);
                }
            },
            complete: function (XMLHTTPRequest, textStatus) {  //不管有没有错误，complete下的函数都会执行的
                console.log("login后complete方法执行了")

            },
            error: function () {
                alert("服务器出错！");
            }
        });



    }

</script>

</html>
