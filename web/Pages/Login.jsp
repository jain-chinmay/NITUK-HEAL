<%-- 
    Document   : Login
    Created on : 26 Sep, 2014, 11:04:34 AM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>
            Login Panel
        </title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <style>
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: #888888;
                background-size: cover;                
            }   
            .box{
                z-index: 1;
                display: inline-block;
                position: absolute;
                left: 0;
                margin-top: 8%;
                margin-left: 14%;
                width: 70%;
                height: 60%;
            }

            .inner{
                display: block;
                position: relative;
                background: black;
                background: rgba(0,0,0,0.6);
                width: 60%;
                text-align: center;
                height: 100%;
                border-radius: 10px;
                margin-left: 20%;
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
                margin-top: 3%;
             }
             a:hover{
                 text-decoration: none;
             }   
        </style>
         
    </head>
    <h:javascript formName="LoginBean"/>
    <body 
        style=" max-height: 100%; max-width: 100%;background-image: url('/dbms/Images/loginimg.jpg');">
            <div class="box">
                <div class="inner">
                    <div class="deepinner">
                        <legend id="signlegend">
                            <span style="color: #447fc8;">Medical NITUK</span>
                       </legend> 
       <h:form action="/login" onsubmit="return validateLoginBean(this)" method="post">
       <table align="center">
            <tr>
                <td align="center" style="color: red;" colspan="2">
                    <h:errors/>${requestScope.msgg}
                </td>
            </tr>
            <tr>
                <td align="center" style="color: green;" colspan="2">
                    <h:errors/>${requestScope.msgg1}
                </td>
            </tr>
        <tr>
            <td class="text-center" id="textstyle" >User ID </td>
        </tr>
        <tr>
            <td><input class="form-control" type="text" name="admin_id" style="margin-top:2%;"/></td>   
        </tr>
        <tr>
            <td class="text-center" id="textstyle">Password </td>
        </tr>
        <tr>
            <td><input class="form-control" type="password" name="pass" style="margin-top:2%;"/></td>   
        </tr>
        <tr>
            <td style="color:white;"><input type="checkbox" name="fpass" id="fpass" style="margin-top:3%;"/>&nbsp; Forget Password</td>
        </tr>
         <tr>
            <td colspan="2"><input class="btn btn-success" onclick="setcheck();" type="submit" value="Log in" style="margin-top:4%;"/></td>
            
        </tr>   

        </table>
            <br/>
        
    </h:form>
                    </div><label id="textstyle2">Not Registered yet</label>
                    <button class="btn btn-primary"><a href="/dbms/Pages/RegisterAdmin.jsp" style="color:white;">Register</a></button>
                        
                    
                </div>
            </div>
    </body>
   <script>
        function setcheck(){
            var check = document.getElementById("fpass");
            if(check.checked){
                check.value = "yes";
            }else{
                check.checked = "true";
                check.value = "no";
            }
}
    </script>
</html>
