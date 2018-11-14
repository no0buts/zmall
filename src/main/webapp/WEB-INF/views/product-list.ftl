<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
<#--<title>${blogger.nickName}</title>-->
    <meta name="keywords" content="JAVA, Web, Spring" />
    <meta name="description" content="小麦的个人博客，一时兴起的产物。" />
<#--<link href="${request.contextPath}/static/css/foreground/base.css" rel="stylesheet">-->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<body>
<div class="ibody">
    <table border="1">
        <tr>
            <td>产品id</td>
            <td id="productIdKey">N/A</td>
        </tr>
        <tr>
            <td>产品名称</td>
            <td id="productNameKey">N/A</td>
        </tr>
    </table>

</div>
</body>
<script src="${request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script>
    var ctx = '${request.contextPath}';
    $(document).ready(function(){
        alert(11);
        init();

    });
    function init() {
        alert(22);
        var getDataUrl = ctx+ '/api/getProductList';
        $.get(getDataUrl,function(data,status){
            alert("数据: " + data + "\n状态: " + status);
            $("#productIdKey").html(data.data.id);
            $("#productNameKey").html(data.data.name);
        });
    }

</script>


<style type="text/css">.snow-container{position:fixed;top:0;left:0;width:100%;height:100%;pointer-events:none;z-index:100001;}</style>
<div class="snow-container"></div>
</html>
