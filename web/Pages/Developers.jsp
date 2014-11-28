<%-- 
    Document   : Developers
    Created on : Nov 17, 2014, 3:57:35 PM
    Author     : CJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developers Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <style>
            #div1{
                color: white;
                position: absolute;
                top:50px;
                z-index: 1;
                height: 60%;
                width: 90%;
                font-family:'Source Sans Pro',sans-serif;
                font-size: 1.4em;
            }
            #back{
                z-index: -3;
                height: 60%;
                width:29%;
                opacity: 0.8;
                background-color: black;
                position: absolute;
                top:60px;
                left:160px;
                border-radius: 12px;
            }
            #back2{
                border-radius: 12px;
                z-index: -3;
                height: 60%;
                width:29%;
                opacity: 0.8;
                background-color: black;
                position: absolute;
                top:60px;
                right:0px;
            }
            #e{
                font-size: 2.7em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
                margin-bottom:5% ;
            }
        </style>
    </head>
    <body><br>
        <div style="padding-bottom: 70%;">
             <label id="e">Developers</label>
        <div id="back" style="margin-top:20%;margin-left: 12%;"></div>
        <div id="back2" style="margin-top:20%;margin-right: 9%;"></div>
         <div id="div1" style="margin-top:18%;margin-left: 8%;padding-top: 5%;">
            
         <div class="row" style="margin-left:0;">
             <div style="">
             <table id="textstyle" class="col-lg-5" style="margin-right: 0">
             <tr>
                 <td><img src='../dbms/Images/chinmay.jpg' width="140" height="140" class="img-rounded" style="margin-left: 13%;margin-bottom: 6%;margin-top: 6%;"></td></tr>
             <tr>
                 <td style="width:80%;">
                     <div style="width:80%;">
                         Name : <span style="color: #447fc8; text-align: center;padding-left: 18%;">Chinmay Jain</span> <br>
                         Email Id : <span style="color: #447fc8; text-align: center;">chinmayjain107@gmail.com</span><br>
                       Contact No. : <span style="color: #447fc8; text-align: center;padding: 6%;">9528377401 </span><br>
                   </div>
                 </td>
             </tr>
             </table>
             <table id="textstyle" class="col-lg-5" style="">
                 <tr style="">
                     <td><img src='../dbms/Images/abhinav.jpg' width="140" height="140" class="img-rounded" style="margin-left: 13%;margin-bottom: 6%;margin-top: 6%;"></td></tr>
                 <tr>
                 <td style="">
                     <div style="">
                         Name : <span style="color: #447fc8; text-align: center; padding: 18%;">Abhinav Kumar</span> <br>
                         Email Id : <span style="color: #447fc8; text-align: center;">abhinavkumar479@gmail.com</span> <br>
                         Contact No. : <span style="color: #447fc8; text-align: center;padding: 6%;">8979105585</span> <br>
                     </div>
                 </td>
             </tr>
             </table></div><br><br>
             
         </div>
         </div>
        </div>
    </body>
</html>
