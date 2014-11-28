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
            #fth{
               font-size: 2em;
                font-weight: bold;
                color:#2f65d0;
                font-family:'Source Sans Pro',sans-serif;
                margin-bottom:2% ; 
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
                  
                   <a class="navbar-brand" style="color:white;" href="#" onclick="goPres();">Edit Prescription</a>
                  <a class="active navbar-brand" style="color:white;" href="/dbms/edit_bdetails.do">Edit Basic Details</a>
                  <a class="navbar-brand"  style="color:white;" href="#" onclick="goFB();">Edit Family Background</a>
                  <a class="navbar-brand" style="color:white;"  href="#" onclick="goHF();">Edit Health Profile</a>
                  <a class="navbar-brand"  style="color:white;" href="#">Edit History</a>
              
            </div>
            </div>
        
        </nav>
         <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Medical History</label>
       <h:form action="/history" method="post">
       <fieldset>
           <label id="fth">Present and Past</label>
        <table class="table table-hover table-responsive">
            <tr><td style="font-weight: bold;"> Any health problem at present :</td><td style="font-weight: bold;">Yes&nbsp;&nbsp;&nbsp;<input type="radio"  name="h_prob" value="yes0"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No &nbsp;&nbsp;&nbsp;<input type="radio" name="h_prob" value="no0"/></td></tr>
           <tr><td style="font-weight: bold;">Any major illness/operation in the past:</td><td style="font-weight: bold;"> Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="h_ill" value="yes1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No &nbsp;&nbsp;&nbsp;<input type="radio" name="h_ill" value="no1"/></td></tr>
           <tr><td style="font-weight: bold;">Taking any medicine:</td><td style="font-weight: bold;"> Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="h_med" value="yes2"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No &nbsp;&nbsp;&nbsp;<input type="radio" name="h_med" value="no2"/></td></tr>
           <tr><td style="font-weight: bold;">Allergy to medicines, if any:</td><td style="font-weight: bold;"> Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="h_allerg" value="yes3"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No &nbsp;&nbsp;&nbsp;<input type="radio" name="h_allerg" value="no3"/></td></tr>
           <tr><td style="font-weight: bold;">Physical Activity:</td><td style="font-weight: bold;padding-right:0;"> Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="h_phy" value="yes4"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp; <input type="radio" name="h_phy" value="no4"/></td></tr>
                      </table>
           </fieldset>
       <fieldset>
            <label id="fth">Personal</label>
                   <table class="table table-hover table-responsive">
            <tr><td>
            <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
                        <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_none" value="None" onchange="EnableDisablePersonal();">
              </span><input type="text" value="None" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_s" value="Sleep is improper">
              </span><input type="text" value="Sleep is improper" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_a" value="Appetite is poor">
              </span><input type="text" value="Appetite is poor" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_f" value="Anger or Frustration">
              </span><input type="text" value="Anger or Frustration" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_i" value="Improper family support/interaction">
              </span><input type="text" value="Improper family support/interaction" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_c" value="Poor self confidence">
              </span><input type="text" value="Poor self confidence" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_l" value="Language Difficulty">
              </span><input type="text" value="Language Difficulty" class="form-control" disabled="true"></div></div></div>              
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="personal" id="personal_ot" value="Other" onchange="EnableDisablePersonal();">
              </span><input type="text" value="Other" class="form-control" disabled="true"></div></div></div>              
                    <input type="text" id="p_text" name="p_text"  hidden="true" placeholder="Enter Problem" onchange="savefield_P();"/></td></tr>
            
             </table>
            </fieldset>
       <fieldset>
           <label id="fth" style="margin-bottom: 1%;">Counseling</label><br>
          <label id="fth" style="font-weight: bolder; font-size: 1.1em; font-style:italic;color:#666;">In which of the following areas you will like to have counseling? </label>
       <table class="table table-hover table-responsive">
           <tr><td>
             <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
                <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_none" value="None" onchange="EnableDisableCounselingg();">
              </span><input type="text" value="None" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_a" value="Academic issues">
              </span><input type="text" value="Academic issues" class="form-control" disabled="true"></div></div></div>
               <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_i" value="Interpersonal relationship">
              </span><input type="text" value="Interpersonal relationship" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_s" value="Emotional/Stress related">
              </span><input type="text" value="Emotional/Stress related" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_h" value="Excellence in health">
              </span><input type="text" value="Excellence in health" class="form-control" disabled="true"></div></div></div>
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_e" value="Economic issues">
              </span><input type="text" value="Economic issues" class="form-control" disabled="true"></div></div></div>              
              <div class="row"><div class="col-lg-6"><div class="input-group" style="font-weight: bold;">
              <span class="input-group-addon"><input type="checkbox" name="counseling" id="counseling_ot" value="Other" onchange="EnableDisableCounselingg();">
              </span><input type="text" value="Other" class="form-control" disabled="true"></div></div></div>              
                <input type="text" id="c_text" name="c_text"  hidden="true" placeholder="Enter Problem" onchange="savefield_C();"/></td></tr>
              </table>
            </fieldset>
                  <input type="submit" name="do_update" value="Update" class="btn btn-block btn-primary" style="width: 30%;float: right;"/>
        <input type="submit" name="do_update" id="up_pres" value="Update Prescription" hidden="trues" /><br>
       <input type="submit" name="do_update" value="Edit Basic Details" hidden="true"/><br>
       <input type="submit" name="do_update" id="fb" value="Edit Family Background" hidden="true"/><br>
       <input type="submit" name="do_update" id="hf" value="Edit Health Profile" hidden="true"/><br>
       </h:form>
        </div>
        <script>
                    function EnableDisablePersonal(){
                        if((document.getElementById("personal_none").checked===true)){
                            document.getElementById("p_text").hidden=true;
                            document.getElementById("personal_s").disabled=true;
                            document.getElementById("personal_a").disabled=true;
                            document.getElementById("personal_f").disabled=true;
                            document.getElementById("personal_i").disabled=true;
                            document.getElementById("personal_c").disabled=true;
                            document.getElementById("personal_l").disabled=true;
                            document.getElementById("personal_ot").disabled=true;
                        }
                        else{
                            document.getElementById("p_text").hidden=true;
                            document.getElementById("personal_s").disabled=false;
                            document.getElementById("personal_a").disabled=false;
                            document.getElementById("personal_f").disabled=false;
                            document.getElementById("personal_i").disabled=false;
                            document.getElementById("personal_c").disabled=false;
                            document.getElementById("personal_l").disabled=false;
                            document.getElementById("personal_ot").disabled=false;
                            if(document.getElementById("personal_ot").checked===true){
                                document.getElementById("p_text").hidden=false;
                            }
                        }
                    }
                
                    function EnableDisableCounselingg(){
                        
                        if((document.getElementById("counseling_none").checked===true)){
                            document.getElementById("c_text").hidden=true;
                            document.getElementById("counseling_s").disabled=true;
                            document.getElementById("counseling_a").disabled=true;
                            document.getElementById("counseling_e").disabled=true;
                            document.getElementById("counseling_i").disabled=true;
                            document.getElementById("counseling_h").disabled=true;
                            document.getElementById("counseling_ot").disabled=true;
                        }
                        else{
                            document.getElementById("c_text").hidden=true;
                            document.getElementById("counseling_s").disabled=false;
                            document.getElementById("counseling_a").disabled=false;
                            document.getElementById("counseling_e").disabled=false;
                            document.getElementById("counseling_i").disabled=false;
                            document.getElementById("counseling_h").disabled=false;
                            document.getElementById("counseling_ot").disabled=false;
                            
                            if(document.getElementById("counseling_ot").checked===true){
                                document.getElementById("c_text").hidden=false;
                            }
                            
                        }
                    }
                       
                        function savefield_P(){
                            
                            if(document.getElementById("personal_ot").checked===true)
                                document.getElementById("personal_ot").value=document.getElementById("p_text").value+" (Other)";
                             
                        }
                        
                        
                
                        function savefield_C(){
                           
                            if(document.getElementById("counseling_ot").checked===true)
                                document.getElementById("counseling_ot").value=document.getElementById("c_text").value+" (Other)";
                             
                        }
                        function goFB(){
                            document.getElementById("fb").click();
                        }
                        function goHF(){
                            document.getElementById("hf").click();
                        }
                        
                        function goPres(){
                            document.getElementById("up_pres").click();
                        }
        </script>
    </body>
</html>
