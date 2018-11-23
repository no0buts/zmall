<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="zmall,注册" />
    <meta name="description" content="买家注册页" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">
    <div align="center">
        <div>
            账号： <input id="buyerAccountKey" type="text" placeholder="请输入zmall账号">
            <em id="accountHint"></em>
        </div>
        <div>
            密码：<input id="buyerPasswordKey" type="password" placeholder="请输入密码">
            <em id="passwordHint"></em>
        </div>
        <div>
            确认密码：<input id="buyerPasswordConfirmKey" type="password" placeholder="请再次输入密码">
            <em id="passwordConfirmHint"></em>
        </div>
        <div>
            昵称：<input id="buyerNicknameKey" type="text" placeholder="请输入您的昵称">
            <em id="nicknameHint"></em>
        </div>

        <div>
            真实姓名：<input id="buyerTruenameKey" type="text" placeholder="请输入您的真实姓名">
            <em id="truenameHint"></em>
        </div>
        <div>
        <#--头像：<img src="" id="buyerHeadimgKey">-->
        </div>
        <div>
            手机号：<input id="buyerPhonenumKey" type="text" placeholder="请输入您的手机号码"><br>
            <em id="phonenumHint"></em>
        </div>
        <button id="registBtn" type="button" onclick="buyerRegist()">注册</button><br>
        <em id="errorHint"></em>
    </div>
</div>



</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script>
    var ctx = '${request.contextPath}';


    //点击注册后执行的方法
    function buyerRegist() {   //
        var buyerAccount = $("#buyerAccountKey").val();
        var buyerPassword = $("#buyerPasswordKey").val();
        var buyerPasswordConfirm = $("#buyerPasswordConfirmKey").val();
        var buyerNickname = $("#buyerNicknameKey").val();
        var buyerTruename = $("#buyerTruenameKey").val();
        // var buyerHeadingimg = $("#buyerHeadimgKey").val();
        var buyerPhonenum = $("#buyerPhonenumKey").val();

        if (!datacheck(buyerAccount, buyerPassword,buyerPasswordConfirm, buyerNickname, buyerTruename, buyerPhonenum)){  //前端数据校验
            return;
        }

        $.ajax({
            type: 'post',
            url: ctx + '/api/buyerRegist',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                buyerAccount: buyerAccount,
                buyerPassword: buyerPassword,
                buyerNickname: buyerNickname,
                buyerTruename: buyerTruename,
                // buyerHeadingimg: buyerHeadingimg,
                buyerPhonenum: buyerPhonenum
            }),
            dataType: 'json',
            success: function (data) {
                var isSuccess = data.responseStatus.success;
                var resultCode = data.responseStatus.resultCode;
                var resultMsg = data.responseStatus.resultMsg;
                if (isSuccess) {  //注册成功之后跳转到登录界面
                    alert("恭喜您，注册成功！现在去登陆...")
                    location.href = ctx + '/buyer/login';

                } else {  //注册不成功的一系列提示
                    console.log(resultCode);
                    $("#errorHint").html(resultMsg);
                }
            },
            complete:function() {
                console.log("regist后complete方法执行了！");
            },
            error:function () {
                alert("服务器出错！");
            }
        });
    }

    //前端校验数据
    function datacheck(buyerAccount, buyerPassword,buyerPasswordConfirm, buyerNickname, buyerTruename, buyerPhonenum) {
        var isPass = false;
        //!buyerAccount—同时判断 null 和 undefined ;
        if (buyerAccount && buyerAccount.length!=0 && buyerAccount.length<21) {  //account非空
            if (buyerPassword && buyerPassword.length!=0) { //password非空
                if(buyerPassword.length>=6 && buyerPassword.length<=16) {  //密码6-16位
                    if(buyerPasswordConfirm && buyerPasswordConfirm.length!=0) {
                        if(buyerPassword == buyerPasswordConfirm) {  //两次输入的密码一致
                            if(buyerNickname && buyerNickname.length!=0) {
                                if(buyerTruename && buyerTruename.length!=0) {
                                    if(buyerPhonenum && buyerPhonenum.length!=0) {
                                        var phonenumReg = /^[1][3,4,5,7,8][1-9]{9}$/;
                                        if (phonenumReg.test(buyerPhonenum)) {
                                            isPass = true;
                                        }else {
                                            $("#phonenumHint").html("请输入合法的手机号");
                                        }
                                    }else {
                                        $("#phonenumHint").html("请输入您的手机号");
                                    }
                                }else {
                                    $("#truenameHint").html("请输入您的真实姓名！");
                                }
                            }else {
                                $("#nicknameHint").html("请输入您的昵称！");
                            }
                        }else {
                            $("#passwordConfirmHint").html("两次输入的密码不一致请您重新输入！");
                        }
                    }else {
                        $("#passwordConfirmHint").html("请您再次输入密码！");
                    }
                    // isPass = true;//前端数据校验验证通过
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

</script>

</html>
