<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="手机" />
    <meta name="description" content="小米手机,xiaomi" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">
    <table border="1">
        <tr>
            <td>产品id</td>
            <td id="productIdKey"></td>
        </tr>
        <tr>
            <td>名称</td>
            <td id="productNameKey"></td>
        </tr>
        <tr>
            <td>价格</td>
            <td id="productPriceKey"></td>
        </tr>
        <tr>
            <td>原价</td>
            <td id="productOriginalPriceKey"></td>
        </tr>
        <tr>
            <td>销量</td>
            <td id="productSalesVolumeKey"></td>
        </tr>
        <tr>
            <td>图片链接</td>
            <td><img id="productImageKey" src="" alt="图片加载失败！" width="300" height="300"></td>
        </tr>
    </table>

</div>
</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script>
    var ctx = '${request.contextPath}';

    /**一个页面响应加载的顺序是：域名解析、载html、加载js和css-加载图片等其他信息。那么Dom Ready应该在“加载js和css”和“加载图片等其他信息”之间，就可以操作Dom了。*/
    $(document).ready(function(){  //表示文档结构已经加载完成（不包含图片等非文字媒体文件）
        init();

    });
    function init() {
        var getDataUrl = ctx+ '/api/getProductDetailJson/573627';
        //$.get()的第一个参数是我们希望请求的URL，第二个参数是请求成功后所执行的回调函数（存有请求的状态）。
        $.get(getDataUrl,function(data,status){
            alert("数据: " + data + "\n状态: " + status);
            $("#productIdKey").html(data.data.productId);
            $("#productNameKey").html(data.data.productName);
            $("#productPriceKey").html(data.data.productPrice);
            $("#productOriginalPriceKey").html(data.data.productOriginalprice);
            $("#productSalesVolumeKey").html(data.data.productSalesvolume);
            $("#productPriceKey").html(data.data.productPrice);
            $("#productImageKey").attr("src",data.data.productImage);

        });
    }

</script>


<style type="text/css">.snow-container{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none;z-index:100001;}</style>
<div class="snow-container"></div>
</html>
