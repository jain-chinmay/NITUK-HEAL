<%-- 
    Document   : Header
    Created on : 26 Sep, 2014, 11:31:23 AM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        
        <link rel="stylesheet" href="<h:rewrite page='/CSS/Header.css'/>" type="text/css" media="screen" />
    </head>
    <body>
        <div>
         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox" style="z-index:1; height: 100%;width:100%">
            <div class="item active">
              <img src='../dbms/Images/slide1.jpg' id="logo_right" >
            </div>
            <div class="item">
              <img src="../dbms/Images/slide2.jpg" alt="" >
            </div>
            <div class="item">
              <img src="../dbms/Images/slide3.jpg" alt="">
            </div>
          </div>
        </div>
        </div>
    </body>
    <script>
        slide();
        var img_index=0;
        function slide(){
            document.getElementById('carousel-example-generic').carousel({interval: 8000});
        }
       
           </script>
</html>
