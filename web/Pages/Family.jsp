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
    <h:javascript formName="FamilyBean"/>
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
                  
                  <a class="navbar-brand" style="color:white;" href="#"  onclick="goPres();">Edit Prescription</a>
                  <a class="active navbar-brand" style="color:white;" href="/dbms/edit_bdetails.do">Edit Basic Details</a>
                  <a class="navbar-brand" style="color:white;" href="#">Edit Family Background</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHF();">Edit Health Profile</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goHIS();">Edit History</a>
                </div>
            </div>
          
        </nav>
          <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Edit Family Background</label>
              
        <h:form action="/family" onsubmit="return validateFamilyBean(this)" method="post">
            <table class="table table-hover table-responsive">
                <tr><td style="font-weight: bold;"> Father's Name:</td><td><input type="text"  maxlength="17" style="width:100%;" class="form-control" name="f_name"/></td><td></td></tr>
                <tr><td style="font-weight: bold;"> Mother's Name:</td><td><input type="text" maxlength="17" style="width:100%;" class="form-control" name="m_name"/></td><td></td></tr>
                <tr><td style="width:40%;font-weight: bold;">Father's Occupation:</td><td style="width:30%;"><select name="f_occupation" class="form-control" id="f_occupation" onchange="openfield_F();">
                <option value="NULL">---Select One---</option>
                <option value="Agriculturist">Agriculturist</option>
                <option value="Buddhist Monk">Buddhist Monk</option>
                <option value="Business">Business</option>
                <option value="Chartered Accountant">Chartered Accountant</option>
                <option value="Consultant">Consultant</option>
                <option value="Doctor">Doctor</option>
                <option value="Engineer">Engineer</option>
                <option value="Government Undertaking">Government Undertaking</option>
                <option value="Government Service">Government Service</option>
                <option value="Household">Household</option>
                <option value="Lawyer">Lawyer</option>
                <option value="Missionary">Missionary</option>
                <option value="Private sector service">Private sector service</option>
                <option value="PSUs">PSUs</option>
                <option value="Research">Research</option>
                <option value="Retired">Retired</option>
                <option value="Retired From Service">Retired From Service</option>
                <option value="Social Service">Social Service</option>
                <option value="Social Worker">Social Worker</option>
                <option value="Student">Student</option>
                <option value="Teacher">Teacher</option>
                <option value="Other" id="other_F" >Other Professional</option>
            </select></td><td><input type="text" id="F_other" name="f_other" placeholder="Enter Occupation" onchange="savefield_F();" hidden="true"/></td></tr>
            
            <tr><td style="font-weight: bold;"> Mother's Occupation:</td><td><select name="m_occupation"  class="form-control" id="m_occupation" onchange="openfield_M();">
                <option value="NULL">---Select One---</option>
                <option value="Agriculturist">Agriculturist</option>
                <option value="Buddhist Monk">Buddhist Monk</option>
                <option value="Business">Business</option>
                <option value="Chartered Accountant">Chartered Accountant</option>
                <option value="Consultant">Consultant</option>
                <option value="Doctor">Doctor</option>
                <option value="Engineer">Engineer</option>
                <option value="Government Undertaking">Government Undertaking</option>
                <option value="Government Service">Government Service</option>
                <option value="House Wife">House Wife</option>
                <option value="Household">Household</option>
                <option value="Lawyer">Lawyer</option>
                <option value="Missionary">Missionary</option>
                <option value="Private sector service">Private sector service</option>
                <option value="PSUs">PSUs</option>
                <option value="Research">Research</option>
                <option value="Retired">Retired</option>
                <option value="Retired From Service">Retired From Service</option>
                <option value="Social Service">Social Service</option>
                <option value="Social Worker">Social Worker</option>
                <option value="Student">Student</option>
                <option value="Teacher">Teacher</option>
                <option value="Other" id="other_M" >Other Professional</option>
             </select></td><td><input type="text" id="M_other"name="m_other" placeholder="Enter Occupation" onchange="savefield_M();" hidden="true"/></td></tr>
            
            <tr><td style="font-weight: bold;">Family History:</td>
                <td colspan="2">
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_none" value="None" onchange="EnableDisableHistory();">
              </span><input type="text" value="None" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_t" value="Tuberculosis">
              </span><input type="text" value="Tuberculosis" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_h" value="High Blood Pressure">
              </span><input type="text" value="High Blood Pressure" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_o" value="Obesity"">
              </span><input type="text" value="Obesity" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_d" value="Diabetes">
              </span><input type="text" value="Diabetes" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_he" value="Heart Disease">
              </span><input type="text" value="Heart Disease" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_k" value="Kidney">
              </span><input type="text" value="Kidney" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="f_history" id="f_history_ot" value="Other" onchange="openfield_H();">
              </span><input type="text" value="Other" class="form-control" disabled="true"></div></div></div>              
                    <input type="text" id="his_other" name="his_other" style="width:47%;" hidden="true" placeholder="Enter Disease" onchange="savefield_H();"/></td></tr>
            
            <tr><td style="font-weight: bold;">Family Address:</td><td colspan="2"><textarea name="f_address" maxlength="170" class="form-control" rows="8" cols="58" ></textarea></td></tr>
            <tr><td style="font-weight: bold;">Family Contact :</td><td><input type="text" class="form-control" maxlength="10" name="f_contact" placeholder="Enter Number"/></td><td></td></tr>
            </table>
        <input type="submit" name="do_update" value="Update" class="btn btn-block btn-primary" style="width:30%;float: right;"/>
            
               <input type="submit" name="do_update" id="up_pres" value="Update Prescription" hidden="true" />
               <input type="submit" name="do_update" value="Edit Basic Details" hidden="true"/>
               <input type="submit" name="do_update" id="hf" value="Edit Health Profile" hidden="true"/>
               <input type="submit" name="do_update" id="hist" value="Edit History" hidden="true"/>
          </h:form>
        </div>
            <script>
                    function EnableDisableHistory(){
                        if((document.getElementById("f_history_none").checked===true)){
                            document.getElementById("his_other").hidden=true;
                            document.getElementById("f_history_t").disabled=true;
                            document.getElementById("f_history_h").disabled=true;
                            document.getElementById("f_history_he").disabled=true;
                            document.getElementById("f_history_o").disabled=true;
                            document.getElementById("f_history_d").disabled=true;
                            document.getElementById("f_history_k").disabled=true;
                            document.getElementById("f_history_ot").disabled=true;
                        }
                        else{
                            document.getElementById("f_history_t").disabled=false;
                            document.getElementById("f_history_h").disabled=false;
                            document.getElementById("f_history_he").disabled=false;
                            document.getElementById("f_history_o").disabled=false;
                            document.getElementById("f_history_d").disabled=false;
                            document.getElementById("f_history_k").disabled=false;
                            document.getElementById("f_history_ot").disabled=false;
                            
                        }
                    }
                
                function openfield_F(){
                    if(document.getElementById("f_occupation").value==="Other"){
                        document.getElementById("F_other").hidden=false;
                    }else{
                        document.getElementById("F_other").hidden=true;
                    }
                }
                
                function openfield_M(){
                    if(document.getElementById("m_occupation").value==="Other"){
                        document.getElementById("M_other").hidden=false;
                    }else{
                        document.getElementById("M_other").hidden=true;
                    }
                }
                
                function savefield_F(){
                    
                    if(document.getElementById("other_F").selected===true)
                        document.getElementById("other_F").value=document.getElementById("F_other").value+" (Other)";
                    
                }
                
                function savefield_M(){
                    
                    if(document.getElementById("other_M").selected===true)
                        document.getElementById("other_M").value=document.getElementById("M_other").value+" (Other)";
                    
                }
                
                function openfield_H(){
                    if(document.getElementById("f_history_ot").checked===true){
                        document.getElementById("his_other").hidden=false;
                        
                    }else{
                        document.getElementById("his_other").hidden=true;
                    }
                }
                
                function savefield_H(){
                    if(document.getElementById("f_history_ot").checked===true)
                        document.getElementById("f_history_ot").value=document.getElementById("his_other").value+" (Other)";
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
    </body>
</html>
