<%-- 
    Document   : RegisterAdmin
    Created on : Nov 7, 2014, 11:03:32 PM
    Author     : CJ
--%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <style>
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: #888888;
                background-image: url('/dbms/Images/loginimg.jpg');
            }   
            .box{
                z-index: 1;
                display: inline-block;
                position: absolute;
                margin-top: 8%;
                margin-left: 14%;
                width: 80%;
                
            }   
            
            
            .inner{
                display: block;
                position: relative;
                background: black;
                background: rgba(0,0,0,0.6);
                width: 50%;
                text-align: center;
                height: 60%;
                border-radius: 10px;
                margin-left: 16%;
            }
            
            .deepinner{
                 display: block;
                position: relative;
                margin-top: 4%;
                height: 70%;
            }
            
            
            .head{
                width: 20%;
            }
            
            #signlegend {
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 30px;
                font-weight: 100;
                color: #e5e5e5;
                height: 25%;
                width : 70%;
                border: 0;
                margin-left: 15%;
                padding-top: 2%;
                border-bottom: 1px solid #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
             #textstyle{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
              #textstyle2{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
                margin-right: 3%;
                margin-top: 5%;
             }
             a:hover{
                 text-decoration: none;
             }
        </style>
    </head>
    <h:javascript formName="RegisterAdminBean"/>
    <body>
        <div class="box">
            <div class="inner">
                    <div class="deepinner">
                        <legend id="signlegend">
                           Register to <span style="color: #447fc8;">Medical NITUK</span>
                       </legend> 
       <h:form action="/registeradmin" onsubmit="return validateRegisterAdminBean(this)" method="post">
       <table class="tab1" align="center">
            <tr>
                <td align="center" style="color: red;" colspan="2">
                    <h:errors/>${requestScope.regmsg}
                </td>
            </tr>
        <tr>
            <td class="text-left" id="textstyle" >First Name </td>
            <td><input class="form-control" type="text" name="fname" maxlength="9" style="margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td class="text-left" id="textstyle" >Last Name </td>
            <td><input class="form-control" type="text" name="lname" maxlength="9" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
       
        <tr>
            <td class="text-left" id="textstyle" >Security Question </td>
            <td><input class="form-control" type="text" name="sec_ques" maxlength="40" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td class="text-left" id="textstyle" >Answer </td>
            <td><input class="form-control" type="text" name="sec_ans" maxlength="40" style="margin-top:3%; margin-left:5%;"/></td>   
         </tr>
         <tr>
            <td class="text-left" id="textstyle" >Master Password </td>
            <td><input class="form-control" type="password" name="mas_pass" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td colspan="2"><input class="btn btn-danger" type="button" value="Back" onclick="window.location ='/dbms/Pages/Login.jsp'" style="margin-top:4%; float:right"/><input class="btn btn-success" type="submit" value="Register" style="margin-top:4%;margin-right:4% ; float:right;"/></td>
        </tr>   
        </table>
            <br/>
    </h:form>
                </div>
            </div>
        </div>
    </body>
</html>
