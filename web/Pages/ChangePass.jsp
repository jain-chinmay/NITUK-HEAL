<%-- 
    Document   : ChangePass
    Created on : Nov 7, 2014, 11:58:54 PM
    Author     : CJ
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <style>
            #e{
                font-size: 2.7em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
                margin-bottom:5% ;
            }
        </style>
    </head>
    <h:javascript formName="ChangePassBean"/>
    <body><br>
       <div style="padding-bottom: 30%;">
           <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Admin Name : <%=(String)session.getAttribute("admin_name")%><br>
              Admin ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("admin_id"))%></div>
              
           <label id="e">Change Password</label>
           <input type="text" id="chp" value="<%=(String)request.getAttribute("ermsg")%>" hidden="true"/>
            <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.ermsg}</div>
        
        <h:form action="/getNewPass" onsubmit="return validateChangePassBean(this)">
            <table class="table table-hover" cellspacing="2" cellpadding="7">
             <tr><td style="font-weight: bold;">Old Password:</td><td><input type="password" class="form-control" name="oldpass" style="width: 40%;"/></td></tr>
            <tr><td style="font-weight: bold;">New Password:</td><td><input type="password" class="form-control" id="npass" name="newpass" style="width: 40%;"/></td></tr>
            <tr><td style="font-weight: bold;">ReEnter Password:</td><td><input type="password" class="form-control" id="npass1" name="newpass1" style="width: 40%;" /></td></tr>          
            </table>
         <input type="submit" value="Change Password" class="btn btn-block btn-primary" style="width:30%;float:right;"/>
        </h:form>
        </div> 
    </body>
    <script>
        document.getElementById("menu").children[0].children[0].className="";
        document.getElementById("menu").children[1].children[0].className="selected";
        document.getElementById("menu").children[2].children[0].className="";
        document.getElementById("menu").children[3].children[0].className="";
        alertpass();
        function alertpass(){
                    document.getElementById("err").hidden = true;
                    var eds = document.getElementById("chp").value;
                    if(eds===""){
                        document.getElementById("err").hidden = true;
                    }
                    else if(!(eds==="null")){
                        document.getElementById("err").hidden = false;
                    }
                    document.getElementById("chp").value = null;
                }
    </script>
</html>
