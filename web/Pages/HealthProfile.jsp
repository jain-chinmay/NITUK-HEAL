<%-- 
    Document   : HealthProfile
    Created on : 10 Sep, 2014, 8:36:34 PM
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
            .table-hover>tr>td:first-child{
                width:60%;
            }
        </style>
    </head>
    <h:javascript formName="HealthBean"/>
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
                  
                    <a class="navbar-brand"  style="color:white;"href="#"  onclick="goPres();">Edit Prescription</a>
                  <a class="active navbar-brand"  style="color:white;"href="/dbms/edit_bdetails.do">Edit Basic Details</a>
                  <a class="navbar-brand"  style="color:white;" href="#" onclick="goFB();">Edit Family Background</a>
                  <a class="navbar-brand"  style="color:white;" href="#">Edit Health Profile</a>
                  <a class="navbar-brand"  style="color:white;" href="#" onclick="goHIS();">Edit History</a>
                </div>
           
            </div>
        </nav>
          <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Medical Examination</label>
              <h:form action="/health" onsubmit="return validateHealthBean(this)" method="post">
       <fieldset>
           <table class="table table-hover table-responsive" id="ty">
           <tr><td style="font-weight: bold;">Year :</td><td> <select name="h_year" id="yr" class="form-control">
                        <option value="-1">----Select Year----</option>
                        <option value="_1">1st Year</option>
                        <option value="_2">2nd Year</option>
                        <option value="_3">3rd Year</option>
                        <option value="_4">4th Year</option>
                        <option value="_5">5th Year</option>
                   </select></td><td></td><tr>
           <tr><td style="width:40%;font-weight: bold;">Height :</td><td style="width:20%;"><select name="foot"id="ft" class="form-control">
                        <option value="-1">----Select Foot----</option>
                        <option value="4">4'</option>
                        <option value="5">5'</option>
                        <option value="6">6'</option>
                        <option value="7">7'</option>
                   </select></td> 
                   <td style="width:20%;"><select name="inch" id="inch" class="form-control">
                        <option value="-1">--Select Inch--</option>
                        <option value="0">0"</option>
                        <option value="1">1"</option>
                        <option value="2">2"</option>
                        <option value="3">3"</option>
                        <option value="4">4"</option>
                        <option value="5">5"</option>
                        <option value="6">6"</option>
                        <option value="7">7"</option>
                        <option value="8">8"</option>
                        <option value="9">9"</option>
                        <option value="10">10"</option>
                        <option value="11">11"</option>
                   </select></td><tr>
            <tr><td style="font-weight: bold;">Blood Group :</td><td> <select name="bg" id="bg" class="form-control">
                        <option value="-1">--Select Blood Group--</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select></td><td></td><tr>
           <tr><td style="font-weight: bold;">Weight :</td><td> <div class="input-group">
                                <input type="number" min=30 max=150 name="weight" class="form-control">
                                <span class="input-group-addon">Kgs</span></div></td><td></td><tr>  
           <tr><td style="font-weight: bold;">Waist :</td><td><div class="input-group">
                                <input type="number" min=20 max=50 name="waist" class="form-control">
                                        <span class="input-group-addon">Inchs</span></div>
                  </td><td></td><tr>
           <tr><td style="font-weight: bold;">Blood Pressure :</td><td id="bp"><div class="input-group"><input type="number" class="form-control" max=200 name="bphigh" value="" /><span class="input-group-addon">/</span></div></td><td><input type="number"  class="form-control"  max=150 name="bplow" value=""/></td><tr>
           <tr><td style="font-weight: bold;">Vision :</td><td id="vsn" style="width:20%;"><div class="input-group">
                                <input type="text"  class="form-control" name="v_right" value="">
                                <span class="input-group-addon">Right</span></div></td><td tyle="width:20%;"><div class="input-group">
                                <input type="text"  class="form-control"  name="v_left" value=""/>
                                        <span class="input-group-addon">Left</span></div></td><tr>
           <tr><td style="font-weight: bold;">Dental Examination :</td><td> <input type="text" class="form-control" name="dental"/></td><td></td><tr>
           <tr><td style="font-weight: bold;">Chest :</td><td><div class="input-group">
                                <input type="text" class="form-control" name="chest">
                                <span class="input-group-addon">Cms</span></div></td><td></td><tr>
           <tr><td style="font-weight: bold;">Abdomen :</td><td><div class="input-group">
                                <input type="text" class="form-control" name="abdomen">
                                <span class="input-group-addon">Cms</span></div></td><td></td><tr> 
           <tr><td style="font-weight: bold;">Any Other :</td><td colspan="2"> <input type="text" maxlength="39" class="form-control" name="other"/></td><tr>
           <tr><td style="font-weight: bold;">Advice :</td><td colspan="2"><textarea name="advice" maxlength="97" style="float:right;" class="form-control" rows="5" cols="44"></textarea></td><tr>
           </table>   
       </fieldset>
       <fieldset>
           <label id="e">Vaccination</label>
           <table class="table table-responsive">
               <tr>
                   <th>
                   <td style="font-weight: bold;"><center>1st</center></td>
                   <td style="font-weight: bold;"><center>2nd</center></td>
                   <td style="font-weight: bold;"><center>3rd</center></td>
                   <td><center></center>   </td>
                   <td></td>
                   </th>
               </tr>
               <tr>
                   <td style="font-weight: bold;">Hepatitis-B</td>
                   <td><input type="text" class="form-control" name="hepb1" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control" name="hepb2" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control" name="hepb3" placeholder="dd-mm-yyyy"/></td>
                   <td style="font-weight: bold;color:green;">0-1-6 months</td>
               </tr>
               <tr>
                   <td style="font-weight: bold;">MMR</td>
                   <td><input type="text" class="form-control" name="mmr1" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control" name="mmr2" placeholder="dd-mm-yyyy"/></td>
                   <td colspan="2" style="font-weight: bold;color:green;">2 doses 6 months apart</td>
               </tr>
               <tr>
                   <td style="font-weight: bold;">Tetanus</td>
                   <td><input type="text" class="form-control" name="tn1" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control"name="tn2" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control"name="tn3" placeholder="dd-mm-yyyy"/></td>
                   <td style="font-weight: bold;color:green;">0-1-6 months</td>
               </tr>
               <tr>
                   <td style="font-weight: bold;">Typhoid</td>
                   <td ><input type="text" class="form-control" name="typh" placeholder="dd-mm-yyyy"/></td>
                   <td colspan="2" style="font-weight: bold;color:green;"><center>Single Dose</center></td>
                   <td style="font-weight: bold;color:green;">Every 3 years</td>
               </tr>
               <tr>
                   <td style="font-weight: bold;">Hepatitis-A</td>
                   <td><input type="text" class="form-control" name="hepa1" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control" name="hepa2" placeholder="dd-mm-yyyy"/></td>
                   <td colspan="2" style="font-weight: bold;color:green;"> 2 doses 6 months apart</td>
               </tr>
               <tr>
                   <td style="font-weight: bold;">Chicken Pox</td>
                   <td><input type="text" class="form-control" name="ch1" placeholder="dd-mm-yyyy"/></td>
                   <td><input type="text" class="form-control" name="ch2" placeholder="dd-mm-yyyy"/></td>
                   <td colspan="2" style="font-weight: bold;color:green;">2 doses 1 months apart</td>
               </tr>
           </table>
       </fieldset>
       <input type="button" id="buto" onclick="checkhp();" value="Update" class="btn btn-block btn-primary" style="width:30%;float: right;"/>
       <input type="submit" name="do_update" id="subw" value="Update" hidden="true"/>
     <input type="submit" name="do_update" id="up_pres" value="Update Prescription" hidden="true"/><br>
               <input type="submit" name="do_update" value="Edit Basic Details" hidden="true"/><br>
               <input type="submit" name="do_update" id="fb" value="Edit Family Background" hidden="true"/><br>
               <br>
               <input type="submit" name="do_update" id="hist" value="Edit History" hidden="true"/><br>
               </h:form>
        </div>
    </body>
    <script>
        function checkhp(){
            var ok = true;
            var alertString="";
            var yr = document.getElementById("yr").value;
            var bg = document.getElementById("bg").value;
            var ft = document.getElementById("ft").value;
            var inch = document.getElementById("inch").value;
            if(yr==="-1"){
                ok = false;
                alertString +="Select a year \n";
            }
            if(ft==="-1" || inch==="-1"){
                ok = false;
                alertString +="Select Height \n";
            }
            
            if(bg==="-1"){
                ok = false;
                alertString +="Select Blood group \n";
            }
            if(ok===true){
                document.getElementById("subw").click();
            }
            else{
                alert(alertString);
                event.preventDefault();
            } 
        }
        
        function goFB(){
            document.getElementById("fb").click();
        }
        function goHIS(){
            document.getElementById("hist").click();
        }
        function goPres(){
            document.getElementById("up_pres").click();
        }
        </script>
</html>
