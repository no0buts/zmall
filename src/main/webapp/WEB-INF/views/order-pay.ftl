<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="订单支付" />
    <meta name="description" content="订单支付页" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="./..//static/css/order-pay.css"  />

</head>
<body>
<div>
    <#--产品信息-->
    <div class="product-info">
        <img id="productImgKey" class="product-img" src="" alt="图片加载失败！">
        <div class="product-name-price">
            <div class="product-name">
                <p id="productNameKey" ></p>
            </div>
            <div class="product-price-count">
                <span id="productPriceKey" ></span> &emsp;&emsp;
                <em>x</em><span class="product-count"></span>

            </div>
        </div>
    </div>
    <#--半个小时内支付，倒计时-->
    <div>
        <div id="remainTime" style="font-size:12px;font-weight:600;color:#FF5722;padding-left:15px;"></div>
    </div>

    <#--订单费用相关信息-->
    <div class="order-cost">
        <div>
            共<span class="product-count"></span>件，小计：<span id="productTotalMoneyKey"></span>
        </div>
        <div>
            快递：<span id="freightKey"></span>
        </div>
        <div>
            合计： <span id="totalMoneyKey"></span>
        </div>
    </div>



    <#--关于支付-->
    <div>

    </div>

    <#--收件人-->
        <div>
            <div id="recipientInfoKey" class="recipient-info" >
                <div class="recipient-name-phonenum">
                    <img src="./..//static/icon/recipientIcon.ico">
                    <span id="recipientNameKey"></span>&nbsp;
                    <span id="recipientPhoneNumKey"></span>&nbsp;
                    <span id="recipientAddressKey"></span>
                </div>
            </div>
        </div>

</div>

</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
    var ctx = '${request.contextPath}';
    var orderNumber = getURLParam("orderNumber");
    var order;
    var product;
    console.log(orderNumber);


    //获取地址栏URL中的参数  订单编号orderNumber
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


    //
    $(document).ready(function () {

        //获取到订单信息
        var getOrderUrl = ctx + "/api/getOrderJson/" + orderNumber;
        $.get(getOrderUrl, function (data, status) {
            order = data.data;
            product = order.productVO;
            var productCount = order.productCount;
            var productPrice = product.productPrice;
            var totalMoney = order.totalMoney;
            orderDate = order.orderDate;
            console.log(order);

            //数据填充
            $("#productImgKey").attr("src", data.data.productVO.productImage);
            $("#productNameKey").html(data.data.productVO.productName);
            $("#productPriceKey").html('￥ ' + productPrice + '.00');  //单价
            $("#freightKey").html('￥ ' + data.data.freight + '.00');  //运费
            $("#productTotalMoneyKey").html('￥' + productPrice*productCount + '.00');  //小计
            $(".product-count").html( productCount + ' ');
            $("#totalMoneyKey").html('￥' + totalMoney + '.00');   //合计
            $("#recipientNameKey").html(data.data.recipientVO.recipientName);
            $("#recipientPhoneNumKey").html(data.data.recipientVO.recipientPhonenum);
            $("#recipientAddressKey").html(data.data.recipientVO.recipientAddress +" "
                    + data.data.recipientVO.recipientAddressDetail);

            //支付剩余时间倒计时
            $(function(){
                var now=new Date();
                var end=new Date(orderDate+30*60*1000);  //提交订单的时间+30min就是订单失效时间，后台Date传过来变成了毫秒

                /*两个时间相减,得到的是毫秒ms,变成秒*/
                var result=Math.floor(end-now)/1000; //result= 30*60s;
                var interval=setInterval(sub,1000); //定时器 调度对象
                /*封装减1秒的函数*/
                function sub(){
                    if (result>1) {
                        result = result - 1;
                        var second = Math.floor(result % 60);     // 计算秒 ，取余
                        var minite = Math.floor((result / 60) % 60); //计算分 ，换算有多少分，取余，余出多少秒
                        $("#remainTime").html("支付剩余时间：" + minite + "分" + second + "秒");
                    } else{
                        alert("未在规定时间内支付，订单已失效！");
                        window.clearInterval(interval);//这里可以添加倒计时结束后需要执行的事件
                        //TODO 订单失效后的一些列操作：更改订单状态的同时回库存
                    }
                };
            });

        }) ;

    });








</script>



<#--<script>-->
    <#--var s="2019-01-16 21:36:31";-->
    <#--var reg1=/\-/g;-->
    <#--var reg2 = /\:/g;-->
    <#--var reg3 = /\ /g;-->
    <#--alert(((s.replace(reg1,",")).replace(reg2,",")).replace(reg3,","));-->
<#--</script>-->


</html>
