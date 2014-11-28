<%-- 
    Document   : Update
    Created on : 10 Sep, 2014, 7:53:16 PM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Person</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <style>
            #nyu a:hover{
                background-color: #428bca;
            }
            #e{
                font-size: 2.7em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
                margin-bottom:5% ;
            }
            .table-hover{
                font-family: 'Source Sans Pro', sans-serif !important;
                font-size:1.1em;
                color: #666;
                text-align: left !important;
            }
        </style>
    </head>
    <body><br>
        <div style="padding-bottom: 30%;">
        <nav id="mynav" class="navbar navbar-default" role="navigation" style="margin-bottom:3%;font-family: 'Source Sans Pro', sans-serif !important;">
            <div style="background-color: #2F65D0; color: white;">
                <div class="container-fluid" style="padding: 0px ;">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div id="nyu" class="navbar-header" style="background-color: #2F65D0; color: white; padding:5px 0px;">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  
                  <a class="navbar-brand" style="color:white;" href="#">Edit Prescription</a>
                  <a class="active navbar-brand" style="color:white;" href="/dbms/edit_bdetails.do">Edit Basic Details</a>
                  <a class="navbar-brand" style="color:white;"  href="#" onclick="goFB();">Edit Family Background</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHF();">Edit Health Profile</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHIS();">Edit History</a>
               
            </div>
            </div>
        </nav>
         <input type="text" id="pr" value="<%=(String)request.getAttribute("presgo")%>" hidden="true"/>
        <div class="alert alert-success" id="suc" role="alert" hidden="true"><strong>Success! </strong>${requestScope.presgo}</div>
        <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.presgo}</div>
        <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Edit Prescription</label>
        <h:form action="/update">
            <table class="table table-striped" id="medTable" cellspacing="2" cellpadding="7">
                <tr>
                    <td style="font-weight: bold;">Date :</td><td><input type="text" id="dt" style="width:30%" class="form-control" name="date" placeholder="dd-mm-yyyy"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Prescription :</td><td><input type="text" style="width:30%" maxlength="38" class="form-control" name="pres"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Advice :</td><td><textarea name="adv" style="width:70%" maxlength="100" class="form-control" rows="6" cols="60"></textarea></td>
                </tr>
                
             </table>
            <input type="button" class="btn  btn-primary" value="Update Prescription" onclick="gocheck();" style="float:right;" /><br>
               <input type="submit" name="do_update" id="up_pres" value="Update Prescription" hidden="true"/><br>
               <input type="submit" name="do_update" id="fb" value="Edit Family Background" hidden="true"/><br>
               <input type="submit" name="do_update" id="hf" value="Edit Health Profile" hidden="true"/><br>
               <input type="submit" name="do_update" id="hist" value="Edit History" hidden="true"/><br>
        </h:form>
        </div>
    </body>
    <script>
        checkp();
        function gocheck() {
            var ok = true;
            var alertString="";
            var dt  = document.getElementById("dt").value;
            if (dt.length===0) {
                ok = false;
                alertString += "Date is Required!!!\n";
            }
            if (dt.length>0) {
                if ((!(dt.charAt(0)>=0 && dt.charAt(0)<=3)) || 
                    (!(dt.charAt(1)>=0 && dt.charAt(1)<=9)) ||
                    (!(dt.charAt(2)==='-')) ||
                    (!(dt.charAt(3)>=0 && dt.charAt(3)<=1)) ||
                    (!(dt.charAt(4)>=0 && dt.charAt(4)<=9)) ||
                    (!(dt.charAt(5)==='-')) ||
                    (!(dt.charAt(6)>0 && dt.charAt(6)<=2)) ||
                    (!(dt.charAt(7)>=0 && dt.charAt(7)<=9)) ||
                    (!(dt.charAt(8)>=0 && dt.charAt(8)<=9)) ||
                    (!(dt.charAt(9)>=0 && dt.charAt(9)<=9))){
                        ok = false;
                        alertString += "Date is Invalid!!!\n";
                }
            } 
            if(ok===true){
                document.getElementById("up_pres").click();
            }
            else{
                alert(alertString);
                event.preventDefault();
            } 
         }
        function checkp(){
            document.getElementById("err").hidden = true;
            document.getElementById("suc").hidden = true;
            var eds = document.getElementById("pr").value;
            if(eds===""){
                 document.getElementById("err").hidden = true;
                document.getElementById("suc").hidden = true;
            }
            if(eds==="Update Successful."){
                document.getElementById("suc").hidden = false;
                document.getElementById("err").hidden = true;
            }
            else if(eds==="null"){
                document.getElementById("suc").hidden = true;
                document.getElementById("err").hidden = true;
            }
            else{
                document.getElementById("suc").hidden = true;
                document.getElementById("err").hidden = false;
            }   
            document.getElementById("pr").value = null;
        }
         
        function goFB(){
            document.getElementById("fb").click();
        }
        function goHF(){
            document.getElementById("hf").click();
        }
        function goHIS(){
            document.getElementById("hist").click();
        }
    </script>
</html>
