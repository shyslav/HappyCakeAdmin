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
    <script src="/admin/cropper/jquery-3.1.0.js"></script><!-- jQuery is required -->
    <link  href="/admin/cropper/cropper.css" rel="stylesheet">
    <script src="/admin/cropper/cropper.js"></script>
    <title>Title</title>
</head>
<body>
<style>
    img {
        max-width: 100%; /* This rule is very important, please do not ignore this! */
    }
</style>
<div>
    <img id="image" src="/admin/picture.jpg">
</div>

</body>
</html>
<script>
    $('#image').cropper({
        aspectRatio: 16 / 9,
        crop: function(e) {
            // Output the result data for cropping image.
            console.log(e.x);
            console.log(e.y);
            console.log(e.width);
            console.log(e.height);
            console.log(e.rotate);
            console.log(e.scaleX);
            console.log(e.scaleY);
        }
    });
</script>