<%-- 
    Document   : Login
    Created on : 9 Sep, 2014, 8:29:33 PM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <style>
            #e{
                font-size: 2.7em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
            }
            .table-hover{
                font-family: 'Source Sans Pro', sans-serif !important;
                font-size:1.1em;
                color: #666;
                text-align: left !important;
            }
            #regerr{
                color: red;
            }
            #nyu a{
               color: white; 
            }
            #nyu a:hover{
                background-color: #428bca;
            }
            tr:hover{
                background-color: #ffffff;
            }
            
        </style>
    </head>
    <body><br>
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
                   
                    <a class="navbar-brand"  href="#" onclick="goSearch();">Search</a>
                  <a class="navbar-brand"  href="#">Add Person</a>
                  <a class="navbar-brand"  href="#" onclick="goEdit();">Edit Person</a>
                  <a class="navbar-brand"  href="#" onclick="goDel();">Delete</a>
                </div>
            </div>
            </div>
        </nav><br><br>
       <input type="text" id="rege" value="<%=(String)request.getAttribute("regerr")%>" hidden="true"/>
       <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.regerr}</div>
    <h:form action="/register" method="post">
    <label id="e">Register Person</label>
        <table class="table table-hover" style="margin-top: 0; padding-top: 0;">
            <tr><td style="font-weight: bold;">Name :</td><td><input type="text" style="width:40%;" maxlength="18" class="form-control" id="name"name="name" placeholder="Enter Name"/></td></tr>
                <tr><td style="font-weight: bold;">ID :</td><td><input type="text" id="p_id" style="width:40%;" class="form-control"name="p_id" placeholder="Enter ID"/></td></tr>
                <tr><td style="font-weight: bold;">D.O.B :</td><td><input type="text" style="width:40%;" id="dob" class="form-control" name="dob" placeholder="dd-mm-yyyy"/></td></tr>
                <tr><td style="padding-top: 1.5%;padding-bottom: 1.5%;font-weight: bold;">Gender :</td><td style="font-weight: bold;"> Male  <input type="radio" id="gen" name="gender" value="Male"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Female  <input type="radio" id="gen" name="gender" value="Female"/></td></tr> 
                <tr><td style="font-weight: bold;">Contact No. :</td><td><input type="text" id="contact" style="width:40%;" class="form-control" name="contact" maxlength="10" placeholder="Enter Number"/></td></tr><br><br>
            </table>
            <div id="other" style="float:right;"><input type="button" id="sub" onclick="gocheck();" class="btn btn-primary" value="Register"/></div>
            <input type="submit" id="add" name="do_admin" value="Add" hidden="true"/>
            <input type="submit" id="searchb" name="do_admin" value="Search" hidden="true"/>    
            <input type="submit" id="edit" name="do_admin" value="Edit"  hidden="true"/>
            <input type="submit" id="del" name="do_admin" value="Delete"  hidden="true"/>
            <br><br><br><br>
    </h:form>
    </body>
    <script>  
        checkerr();
        function checkerr(){
            document.getElementById("err").hidden = true;
            var dels = document.getElementById("rege").value;
            if(dels==="")
                document.getElementById("err").hidden = true;
            else if(!(dels==="null")){
                document.getElementById("err").hidden = false;
            }
            document.getElementById("rege").value = null;
        }
        function gocheck() {
            var ok =true;
            var alertString="";
            var name = document.getElementById("name").value;
            var pid = document.getElementById("p_id").value;
            var dob = document.getElementById("dob").value;
            var contact = document.getElementById("contact").value;
            if (name.length===0) {
                ok = false;
                alertString += "Name is Required!!!\n";
            }
            if (pid.length===0) {
                ok = false;
                alertString += "ID is Required!!!\n";
            }
            if (pid.length>0) {
                if (!(pid.length===10)){
                    ok = false;
                    alertString += "Invalid ID!!!\n";
                }
           }
            if (dob.length===0) {
                ok = false;
                alertString += "Date of Birth is Required!!!\n";
            }
            if (dob.length>0) {
                if ((!(dob.charAt(0)>=0 && dob.charAt(0)<=3)) || 
                    (!(dob.charAt(1)>=0 && dob.charAt(1)<=9)) ||
                    (!(dob.charAt(2)==='-')) ||
                    (!(dob.charAt(3)>=0 && dob.charAt(3)<=1)) ||
                    (!(dob.charAt(4)>=0 && dob.charAt(4)<=9)) ||
                    (!(dob.charAt(5)==='-')) ||
                    (!(dob.charAt(6)>0 && dob.charAt(6)<=2)) ||
                    (!(dob.charAt(7)>=0 && dob.charAt(7)<=9)) ||
                    (!(dob.charAt(8)>=0 && dob.charAt(8)<=9)) ||
                    (!(dob.charAt(9)>=0 && dob.charAt(9)<=9))){
                        ok = false;
                        alertString += "Date of Birth is Invalid!!!\n";
            }
            } 
            if (document.getElementById("gen").checked===false) {
                ok = false;
                alertString += "Select a gender!!!\n";
            }
            if (contact.length!==0) {
                if ((!(contact.charAt(0)>=7 && contact.charAt(0)<=9)) || 
                    (!(contact.charAt(1)>=0 && contact.charAt(1)<=9)) ||
                    (!(contact.charAt(2)>=0 && contact.charAt(1)<=9)) ||
                    (!(contact.charAt(5)>=0 && contact.charAt(1)<=9)) ||
                    (!(contact.charAt(3)>=0 && contact.charAt(3)<=9)) ||
                    (!(contact.charAt(4)>=0 && contact.charAt(4)<=9)) ||
                    (!(contact.charAt(6)>0 && contact.charAt(6)<=9)) ||
                    (!(contact.charAt(7)>=0 && contact.charAt(7)<=9)) ||
                    (!(contact.charAt(8)>=0 && contact.charAt(8)<=9)) ||
                    (!(contact.charAt(9)>=0 && contact.charAt(9)<=9))){
                        ok = false;
                        alertString += "Contact is Invalid!!!";
            }
            }
            if(ok===true){
                document.getElementById("add").click();
            }
            else{
                alert(alertString);
                event.preventDefault();
            }  
        }


        function goSearch(){
            document.getElementById("searchb").click();
        }
        function goDel(){
            document.getElementById("del").click();
        }
        function goEdit(){
            document.getElementById("edit").click();
        }
    </script>
</html>
