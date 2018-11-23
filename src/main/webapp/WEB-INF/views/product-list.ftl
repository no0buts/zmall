<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
<#--<title>${blogger.nickName}</title>-->
    <meta name="keywords" content="小米手机,xiaomi" />
    <meta name="description" content="手机列表" />
<#--<link href="${request.contextPath}/static/css/foreground/base.css" rel="stylesheet">-->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">
    <ul>

    </ul>


</div>

</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${request.contextPath}/static/js/template-web.js"></script>

<script>
    var ctx = '${request.contextPath}';
    $(document).ready(function(){  //表示文档结构已经加载完成（不包含图片等非文字媒体文件）
        init();
    });
    function init() {
        var getDataUrl = ctx+ '/api/getProductList';
        $.get(getDataUrl,function(data,status){
            console.log("数据: " + data + "\n状态: " + status);

            var productList = data.data;
            var htmlStr = template("productLi",{"products":productList});
            $("ul").html(htmlStr);
        });
    }
</script>

<!-- 用到了art-template模板，后台传过来的数据Json（List集合），在这里要显示这个List -->
<script id="productLi" type="text/template">
    {{each products as product}}
    <a href="${request.contextPath}/product/{{product.productId}}" >
        <li id="productLiContainer">
            <div>
                <div><img src="{{product.productImage}}"  width="200" height="200">  </div>
                <div>
                    <p>{{product.productPrice}}</p>
                    原价：<span>{{product.productOriginalprice}}</span>
                    <p>{{product.productName}}</p>
                    销量：<span>{{product.productSalesvolume}}</span>
                </div>
            </div>
        </li>
    </a>
    <hr/>
    {{/each}}
</script>



<style type="text/css">.snow-container{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none;z-index:100001;}</style>

</html>
