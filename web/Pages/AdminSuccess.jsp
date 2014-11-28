<%-- 
    Document   : AdminSuccess
    Created on : Nov 7, 2014, 11:51:14 PM
    Author     : CJ
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
    </head>
    <%String admin_id =(String)session.getAttribute("admin_id");%>
    <%String pass =(String) request.getAttribute("password");%>
    <body><br>
        <div style="padding-top:10% ;padding-bottom: 60%;font-family: 'Source Sans Pro', sans-serif !important;">
            <h2 class="text-success">Your id :           <%=admin_id%></h2>
            <h2 class="text-success">Your Password :     <%=pass%></h2>
        </div>

    </body>
</html>
