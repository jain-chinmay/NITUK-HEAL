<%-- 
    Document   : Student
    Created on : 10 Sep, 2014, 8:32:14 PM
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
    <h:javascript formName="StaffBean"/>
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
                  
                    <a class="navbar-brand" style="color:white;" href="#" onclick="goPres();">Edit Prescription</a>
                  <a class="active navbar-brand" style="color:white;" href="#">Edit Basic Details</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goFB();">Edit Family Background</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHF();">Edit Health Profile</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHIS();">Edit History</a>
                </div>
            
            </div>
        </nav>
         <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Edit Basic Details</label>
              <h:form action="/staff" onsubmit="return validateStaffBean(this)" method="post">
                        <table class="table table-hover">
        <tr><td style="font-weight: bold;">Department:</td><td> <select name="dept" id="dept"style="width:50%;"  class="form-control">
             <option value="-1">----Select Deapartment----</option>
            <option value="Computer Science and Engineering">Computer Science and Engineering</option>
            <option value="Electrical and Electronics Engineering">Electrical and Electronics Engineering</option>
            <option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
            <option value="Mechanical Engineering">Mechanical Engineering</option>
            <option value="Civil Engineering">Civil Engineering</option>
            <option value="Chemical Engineering">Chemical Engineering</option>
            <option value="Science and Humanities">Science and Humanities</option>
            <option value="Others">Others</option>
                </select></td></tr>
        <tr><td style="font-weight: bold;">Year of joining:</td><td> <input type="number" id="joinyr"  style="width:20%;" class="form-control" min=2007 max=2050 name="year"/></td></tr>
        <tr><td style="font-weight: bold;">Address:</td><td> <textarea rows="5" cols="46" maxlength="98" style="margin-right:40%;" name="address"></textarea></td></tr>
        <tr><td style="font-weight: bold;">Type:</td><td> <select name="type" id="type" style="width:20%;" class="form-control" >
            <option value="-1">Select Type</option>
            <option value="Teaching">Teaching</option>
            <option value="Non Teaching">Non Teaching</option>
        </select></td></tr>
                        </table>
          <input type="button" onclick="checkstaff();" value="Update" class="btn btn-block btn-primary" style="width:30%;float: right;"/>
            <input type="submit" name="do_update" id="ststaf" value="Update" hidden="true"/>
         <input type="submit" name="do_update" id="up_pres" value="Update Prescription" hidden="true"/><br>
           <input type="submit" name="do_update" id="fb" value="Edit Family Background" hidden="true"/><br>
           <input type="submit" name="do_update" id="hf" value="Edit Health Profile" hidden="true"/><br>
           <input type="submit" name="do_update" id="hist" value="Edit History" hidden="true"/><br>
    </h:form>
        </div>
    </body>
    <script>
        function checkstaff(){
            var ok = true;
            var alertString="";
            var dp = document.getElementById("dept").value;
            var tp = document.getElementById("type").value;
            var joinyr = document.getElementById("joinyr").value;
            if(dp==="-1"){
                ok = false;
                alertString +="Select Department \n";
            }
            if(tp==="-1"){
                ok = false;
                alertString +="Select Type \n";
            }
            if(joinyr===""){
                ok = false;
                alertString +="Select Joining year \n";
            }
            if(ok===true){
                document.getElementById("ststaf").click();
            }
            else{
                alert(alertString);
                event.preventDefault();
            } 
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
        function goPres(){
            document.getElementById("up_pres").click();
        }
        </script>
</html>
