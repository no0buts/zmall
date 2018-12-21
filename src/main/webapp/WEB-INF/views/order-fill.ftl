<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="zmall,填写订单" />
    <meta name="description" content="填写订单" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="./..//static/css/order-fill.css"  />
    <link rel="stylesheet" href="./..//static/css/layui.css" media="all" />
</head>
<body>
<div class="ibody">
    <#--商品信息 购买数量-->
    <div class="product-info">
        <img id="productImgKey" class="product-img" src="" alt="图片加载失败！">
        <div class="product-name-price">
            <div class="product-name">
                <p id="productNameKey" ></p>
            </div>
            <div class="product-price">
                <p id="productPriceKey" ></p>
            </div>
        </div>
    </div>

    <div>
        <ul class="product-count">
            <li><span class="buy-count">购买数量</span></li>
            <li>
                <ul class="product-count-btn">
                    <li><span id="productMinusKey" class="product-count-minus"> - </span></li>
                    <li><input type="text" id="productCountInputKey" class="product-count-input" value="1"></li>
                    <li><span id="productPlusKey"  class="product-count-plus"> + </span></li>
                </ul>
            </li>
        </ul>
    </div>


    <#--收件人-->
    <div id="recipientInfoKey" class="recipient-info" >
        <div class="recipient-name-phonenum">
            收件人：
            <span id="recipientNameKey"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span id="recipientPhoneNumKey"></span>
        </div>
        <div class="recipient-address">
            收货地址：
            <span id="recipientAddressKey"></span>
        </div>
        <span>
            <button class="recipient-show-all" onclick="showAllRecipient()">显示全部收件人</button>
            <button id='recipientAddKey' class='recipient-add' >添加收件人</button>
        </span>
        <br>

        <ul id="recipientListKey">

        </ul>
    </div>
</div>

</body>

<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${request.contextPath}/static/js/template-web.js"></script>
<script src="${request.contextPath}/static/js/layer/layer.js"></script>

<script>
    var ctx = '${request.contextPath}';
    var productId = getURLParam("productId");
    var recipientList;
    // 页面加载完成执行ready
    $(document).ready(function(){
        initProduct();
        initRecipient();
    }) ;


    function initProduct() {
        var productUrl = ctx + '/api/getProductDetailJson/' + productId; //产品信息URL
        //向后端发请求得到产品信息（图片，名称，价格）填充到页面中
        $.get(productUrl, function (data, status) {
            $("#productImgKey").attr("src", data.data.productImage);
            $("#productNameKey").html(data.data.productName);
            $("#productPriceKey").html('￥ ' + data.data.productPrice + '.00');
        });
    }

    //获取收件人列表和默认收件人
    function initRecipient() {
        var recipientUrl = ctx + '/api/getAllRecipient';
        $.get(recipientUrl,function (data,status) {

            recipientList = data.data;
            var recipientDefaultId;

            console.log(recipientList);

            //用户收件人列表为空就设置成 “添加收件人” 按钮
            if(recipientList.length == 0 || recipientList == [] || recipientList == null) {
                var recipientInfo= document.getElementById("recipientInfoKey");
                recipientInfo.innerHTML = "<button id='recipientAddKey' class='recipient-add'>添加收件人</button>";

            }else {   //收件人列表不为空就显示默认收件人
                for(var i=0; i<recipientList.length; i++) {
                    if (recipientList[i].recipientDefault == 1) {
                        recipientDefaultId = recipientList[i].recipientId;
                        $("#recipientNameKey").html(recipientList[i].recipientName);
                        $("#recipientPhoneNumKey").html(recipientList[i].recipientPhonenum);
                        $("#recipientAddressKey").html(recipientList[i].recipientAddress +" "+ recipientList[i].recipientAddressDetail);
                    }
                }
            }
        });
    }
    //获取收件人列表和默认收件人
    function refreshRecipient() {
        var recipientUrl = ctx + '/api/getAllRecipient';
        $.get(recipientUrl,function (data,status) {

            recipientList = data.data;
            var recipientDefaultId;

            console.log(recipientList);

            //用户收件人列表为空就设置成 “添加收件人” 按钮
            if(recipientList.length == 0 || recipientList == [] || recipientList == null) {
                var recipientInfo= document.getElementById("recipientInfoKey");
                recipientInfo.innerHTML = "<button id='recipientAddKey' class='recipient-add'>添加收件人</button>";

            }else {   //收件人列表不为空就显示默认收件人
                for(var i=0; i<recipientList.length; i++) {
                    if (recipientList[i].recipientDefault == 1) {
                        recipientDefaultId = recipientList[i].recipientId;
                        $("#recipientNameKey").html(recipientList[i].recipientName);
                        $("#recipientPhoneNumKey").html(recipientList[i].recipientPhonenum);
                        $("#recipientAddressKey").html(recipientList[i].recipientAddress +" "+ recipientList[i].recipientAddressDetail);
                    }
                }
            }
            $("#recipientListKey").html("");
            showAllRecipient();
        });
    }

    //购买数量 + -
    var productMinus = document.getElementById("productMinusKey");
    var productPlus = document.getElementById("productPlusKey");
    var productCountInput = document.getElementById("productCountInputKey");
    productMinus.onclick = function () { //点击 -
        if (productCountInput.value <=1) {
            productCountInput.value = 1;
        } else {
            productCountInput.value = parseInt(productCountInput.value) - 1;
        }
    }
    productPlus.onclick = function () {  //点击 +
        productCountInput.value = parseInt(productCountInput.value) + 1;
    }

    //点击按钮显示全部收件人
    function showAllRecipient() {
        var recipientListHtmlStr = template("recipientLi",{"recipients":recipientList});
        $("#recipientListKey").html(recipientListHtmlStr);
    }




    //点击按钮弹出添加收件人
    $('#recipientAddKey').on('click', function(){
        // layer.msg('hello');
        layer.open({
            type: 1,  //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            title: '添加联系人',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['350px' , '250px'],
            content: '<div id="recipientAddDialogKey"></div>',    <#--使用template添加收件人弹窗-->
        });
        var recippientAddHtmlStr = template("recipientAddDailog",{}); <#-- 模板 -->
        $("#recipientAddDialogKey").html(recippientAddHtmlStr);

    });

    //点击添加收件人弹窗中的保存按钮，数据验证，输入的数据转成json传到后台
    function saveRecipient() {
        var recipientName = $("#recipientNameAdd").val();
        var recipientPhonenum = $("#recipientPhonenumAdd").val();
        var recipientAddress = $("#recipientAddressAdd").val();
        var recipientAddressDetail = $("#recipientAddressDetailAdd").val();
        var recipientDefault = 0;
        if (recipientList.length == 0 || recipientList == [] || recipientList == null) {
            recipientDefault = 1;
        }
        console.log(recipientDefault + recipientName + recipientPhonenum + recipientAddress + recipientAddressDetail);
        var isPass = recipientDataCheck(recipientName, recipientPhonenum, recipientAddress, recipientAddressDetail);
        if (isPass == true) {
            $.ajax({
                type: 'post',
                url: ctx + '/api/addRecipient',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    recipientName: recipientName,
                    recipientPhonenum: recipientPhonenum,
                    recipientAddress: recipientAddress,
                    recipientAddressDetail: recipientAddressDetail,
                    recipientDefault: recipientDefault
                }),
                dataType: 'json',
                success: function(data) {
                    var isSuccess = data.responseStatus.success;
                    var resultCode = data.responseStatus.resultCode;
                    var resultMsg = data.responseStatus.resultMsg;
                    if (isSuccess) {  //
                        var idx = $(".layui-layer-shade").attr("times");
                        alert("添加收件人成功！");
                        layer.close(idx);
                        refreshRecipient();
                    } else {  //不成功的一系列提示
                        console.log(resultCode);
                        $("recipientHint").html(resultMsg);
                    }
                }
            });
        }

    }

    //验证填写的收件人信息。 true：数据没问题，可以传到后台； false：提示出错原因
    function recipientDataCheck(name, phonenum, address, addressDetail) {
        var isPass = false;
        var phonenumReg = /^[1][3,4,5,7,8,9][1-9]{9}$/;
        if (name && name.length != 0) {
            if (phonenum && phonenum.length != 0) {
                if (phonenumReg.test(phonenum)) {
                    if (address && address.length!=0 && addressDetail && addressDetail.length!=0) {
                        $(".recipientHint").html("");
                        isPass = true;
                    }else {
                        $(".recipientHint").html("地址不能为空！");
                    }
                }else {
                    $(".recipientHint").html("请输入合法的11位手机号！");
                }
            } else {
                $(".recipientHint").html("手机号不能为空！");
            }
        } else {
            $(".recipientHint").html("收件人姓名不能为空！");
        }

        return isPass;
    }

    <#--//点击按钮修改收件人-->
    function toEditRecipient(index){
        var recipient = recipientList[index]; //获取需要编辑的那个收件人
        layer.open({
            type: 1,  //0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            title: '编辑联系人',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['350px' , '250px'],
            content: '<div id="recipientEditDialogKey"></div>',    <#--使用template添加收件人弹窗-->
        });

        console.log(recipient);
        var recipientEditHtmlStr = template("recipientEditDailog",{"recipient":recipient}); <#-- 模板 -->
        $("#recipientEditDialogKey").html(recipientEditHtmlStr);
    }

    //点击编辑收件人窗口的保存按钮后，进行数据验证，然后把数据转成json格式传到后台
    function updateRecipient(recipientId) {
        var recipientName = $("#recipientNameEdit").val();
        var recipientPhonenum = $("#recipientPhonenumEdit").val();
        var recipientAddress = $("#recipientAddressEdit").val();
        var recipientAddressDetail = $("#recipientAddressDetailEdit").val();
        console.log(recipientId+recipientName + recipientPhonenum + recipientAddress + recipientAddressDetail);
        var isPass = recipientDataCheck(recipientName, recipientPhonenum, recipientAddress, recipientAddressDetail);
        if (isPass == true) {
            $.ajax({
                type: 'post',
                url: ctx + '/api/updateRecipient',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    recipientId: recipientId,
                    recipientName: recipientName,
                    recipientPhonenum: recipientPhonenum,
                    recipientAddress: recipientAddress,
                    recipientAddressDetail: recipientAddressDetail
                }),
                dataType: 'json',
                success: function(data) {
                    var isSuccess = data.responseStatus.success;
                    var resultCode = data.responseStatus.resultCode;
                    var resultMsg = data.responseStatus.resultMsg;
                    if (isSuccess) {  //
                        var idx = $(".layui-layer-shade").attr("times");
                        alert("编辑收件人成功！");
                        layer.close(idx);
                        refreshRecipient();


                    } else {  //不成功的一系列提示
                        console.log(resultCode);
                        $("recipientHint").html(resultMsg);
                    }
                }

            });
        }
    }


    //获取地址栏URL中的参数productId
    function getURLParam(paramName) {
        /*window.location.search 获取url中"?"符后的字串
          substring()返回一个从指定位置开始的指定长度的子字符串,这里设置为1，是为了把url中的?号去掉
         */
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for(var i=0; i<vars.length; i++) {
            var pair = vars[i].split("=");
            if(pair[0] == paramName) {
                return pair[1];
            }
        }
        return(false);
    }



</script>

<#--收件人列表-->
<script id="recipientLi" type="text/template">
    {{each recipients as recipient}}
    <li>
        <div class="recipient-name-phonenum">
            <span>收件人：</span>
            <span>{{recipient.recipientName}}</span>&emsp;
            <span>{{recipient.recipientPhonenum}}</span>
        </div>
        <div class="recipient-address">
            <span>收货地址：</span>
            <span>{{recipient.recipientAddress}}&nbsp;{{recipient.recipientAddressDetail}}</span>
        </div>
        <button class="recipient-edit"  onclick="toEditRecipient({{$index}})">编辑</button>

        {{if recipient.recipientDefault == 1}}  <#--默认收件人的设置默认按钮为禁用按钮-->
            <button disabled="disabled">设置为默认收件人</button>
        {{else}}
            <button>设置为默认收件人</button>
        {{/if}}
    </li>
    <br>
    {{/each}}
</script>

<#--添加收件人弹窗内容-->
<script id="recipientAddDailog" type="text/template">
    <#--添加收件人的弹窗-->
    <div id="addRecipient" class="recipient-add-dialog">
        <div>
            <div>
                <span>收件人姓名：</span>
                <input type="text" id="recipientNameAdd">
            </div>
            <div>
                <span>&nbsp;手机号码：&nbsp;</span>
                <input type="text" id="recipientPhonenumAdd">
            </div>
            <div>
                <span>&nbsp;所在地区：&nbsp;</span>
                <input type="text" id="recipientAddressAdd" placeholder="省/直辖市、市、区/县">
            </div>
            <div>
                <span>&nbsp;详细地址：&nbsp;</span>
                <input type="text" id="recipientAddressDetailAdd" placeholder="街道/镇、楼栋、门牌号">
            </div>
            <div align="center">
                <button id="addsavebtn" class="save-btn" onclick="saveRecipient()">保存</button>
            </div>
            <div class="recipientHint"></div>
        </div>
    </div>
</script>

<#--编辑收件人弹窗内容-->
<script id="recipientEditDailog" type="text/template">
    <#--编辑收件人的弹窗-->
    <div id="editRecipient" class="recipient-edit-dialog">
        <div>
            <div>
                <span>收件人姓名：</span>
                <input  type="text" id="recipientNameEdit" value="{{recipient.recipientName}}">
            </div>
            <div>
                <span>&nbsp;手机号码：&nbsp;</span>
                <input type="text" id="recipientPhonenumEdit" value="{{recipient.recipientPhonenum}}">
            </div>
            <div>
                <span>&nbsp;所在地区：&nbsp;</span>
                <input type="text" id="recipientAddressEdit" value="{{recipient.recipientAddress}}">
            </div>
            <div>
                <span>&nbsp;详细地址：&nbsp;</span>
                <input type="text" id="recipientAddressDetailEdit" value="{{recipient.recipientAddressDetail}}">
            </div>
            <div align="center">
                <button id="editsavebtn" class="save-btn" onclick="updateRecipient({{recipient.recipientId}})">保存</button>
            </div>
            <div class="recipientHint"></div>
        </div>
    </div>
</script>
</html>
