<%--
  Created by IntelliJ IDEA.
  User: shyslav
  Date: 8/25/16
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/admin/cropper/cropp.css">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/admin/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/admin/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/admin/dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/admin/plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="/admin/plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="/admin/plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/admin/plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
    <title>Title</title>
</head>
<body>

<div id="container">
    <img id="image" src="/admin/picture.jpg">
    <div id="box"></div>
</div>
<div id="result">
    <img id="circleImg" class="img-circle" src="/admin/pict.jpg">
    <img id="rectangleImg" src="/admin/pict.jpg">
</div>
<button id="cropBtn">crop</button>

</body>
</html>
<script>
    $(document).ready(function () {
        $('#box').draggable({containment:'#image'});
        $('#box').resizable({containment:'#image'});
        $('#cropBtn').click(function () {
            var y = $('#box').position().top;
            var x = $('#box').position().left;
            var width = $('#box').width();
            var height = $('#box').height();
            console.log( x + " " + y + " " + width + " " + height)
            ajaxQuery(width,height,x,y);
        });
    });
    function ajaxQuery(width, height,x,y) {
        $.ajax({
            url: '/cropaction/index.htm',
            type: 'GET',
            data:{
              widthReq:width.toString(),
              heightReq: height.toString(),
              xReq: x.toString() ,
              yReq: y.toString() ,
            },
            success: function (data) {
                window.open('/cropaction/getImage.htm', '_blank');
            },
            error: function (data) {
                window.open('/cropaction/getImage.htm', '_blank');
            }
        });
    }

    function updateImage() {
        $.ajax({
            url: '/cropaction/getImage.htm',
            type: 'GET',
            success: function (data) {

            },
            error: function (data) {
            }
        });
    }

</script>