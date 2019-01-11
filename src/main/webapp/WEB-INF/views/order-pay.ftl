<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="订单支付" />
    <meta name="description" content="订单支付页" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">



</div>

</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script>
    var ctx = '${request.contextPath}';
    var orderNumber = getURLParam("orderNumber");
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


</script>




</html>
