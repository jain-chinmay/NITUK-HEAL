<%-- 
    Document   : Edit
    Created on : 24 Sep, 2014, 2:55:38 PM
    Author     : Cj
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
        <style type="text/css">
            #p_id{
                width:60%;
                margin-right:15%;
                
            }
            #other{
                margin-left: 50%;
            }
            #l{
                font-size: 2.7em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
                margin-bottom:5% ;
            }
            #edit_err {
                color:red;
            }
            #nyu a:hover{
                background-color: #428bca;
            }
            
        </style>
    </head>
    <body><br>
        <div style="padding-bottom: 30%;">
        <nav id="mynav" class="navbar navbar-default" role="navigation" style="margin-bottom: 0;">
            <div style="background-color: #2F65D0; color: white;">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div id="nyu" class="navbar-header" style="background-color: #2F65D0; color: white; padding:5px 0px;">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                   
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goSearch();">Search</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goAdd();">Add Person</a>
                  <a class="navbar-brand" style="color:white;" href="#">Edit Person</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goDel();">Delete</a>
                </div>
            </div>
            </div>
        </nav><br><br>
        <input type="text" id="edite" value="<%=(String)request.getAttribute("editerr")%>" hidden="true"/>
        <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.editerr}</div>
        <label id="l">Edit Person</label>
        <h:form action="/edit" method="post">
            <input type="text" class="form-control" id="p_id" name="p_id" value=""/><br>
            <div id="other"><input type="button" id="sub" onclick="gocheck();" value="Edit" class="btn btn-block btn-primary" style="width:30% ;float: right;margin-right:80%;"/></div>
            <input type="submit" id="edit" name="do_admin" value="Edit" hidden="true"/>
            <input type="submit" id="add" name="do_admin" value="Add" hidden="true"/>    
            <input type="submit" id="search" name="do_admin" value="Search"  hidden="true"/>
            <input type="submit" id="del" name="do_admin" value="Delete"  hidden="true"/>
            
    </h:form>
        </div>
    </body>
    <script>
        checkedit();
        function checkedit(){
            document.getElementById("err").hidden = true;
            var eds = document.getElementById("edite").value;
            if(eds==="")
                document.getElementById("err").hidden = true;
            else if(!(eds==="null")){
                document.getElementById("err").hidden = false;
            }
            document.getElementById("edite").value = null;
        }
        function gocheck() {
            var ok = true;
            var alertString="";
            var pid  = document.getElementById("p_id").value;
            if (pid==="") {
                ok = false;
                alertString += "ID is Required!!!\n";
            }
            if (pid.length>0){
                if (!(pid.length===10)){
                    ok = false;
                    alertString += "Invalid ID!!!\n";
                }
            }
            if(ok===true){
                document.getElementById("edit").click();
            }
            else{
                alert(alertString);
                event.preventDefault();
            }       
         }

        function goAdd(){
            document.getElementById("add").click();
        }
        function goDel(){
            document.getElementById("del").click();
        }
        function goSearch(){
            document.getElementById("search").click();
        }
    </script>
</html>
