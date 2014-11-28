<%-- 
    Document   : Layout
    Created on : 26 Sep, 2014, 11:05:29 AM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="t" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
         <script src="../dbms/JavaScript/bootstrap.min2.js"></script>
        <link rel="stylesheet" href="<h:rewrite page='/CSS/Layout.css'/>" type="text/css" media="screen" />
    </head>
    <body style="height: auto !important;width: 100%;background-image:  url('../dbms/Images/bodybg.png');background-repeat: repeat;">
        <table align="center" style="height: auto;" width="100%">
            <tr id="Header">
                <td height="19%" width="100%" colspan="3" valign="top">
                    <t:insert attribute="Header"></t:insert>
                </td>
            </tr>
            <tr>
                <td id="Left" height="77%" width="18%" valign="center">
                    <t:insert attribute="Left_Sidebar"></t:insert>
                </td>
                <td height="80%" width="64%" valign="top" style="padding-bottom: 3%;">
                    <t:insert attribute="Body"></t:insert>
                </td>
                <td id="Right" height="77%" width="18%" valign="center">
                    <t:insert attribute="Right_Sidebar"></t:insert>
                </td>
            </tr>
            <tr id="Footer" style="float: bottom;width: 100%;background-image:  url('../dbms/Images/bg.png');background-repeat: repeat;">
                <td width="100%" colspan="3" valign="bottom" style="height: 60px !important;">
                    <t:insert attribute="Footer"></t:insert>
                </td>
            </div>
            </tr>
        </table>
    </body>
    <script>
    </script>
</html>
