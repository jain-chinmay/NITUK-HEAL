<%-- 
    Document   : Admin
    Created on : 24 Sep, 2014, 2:42:47 PM
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
            #mynav{
                -webkit-box-shadow: 2px 2px 15px #1e54c0;
                -moz-box-shadow: 2px 2px 15px #1e54c0;
                box-shadow: 2px 2px 15px #1e54c0;
            }
            #search_field{
                padding-top: 2%;
                font-family: 'Source Sans Pro', sans-serif !important;
                color: #666;
            }
            #search_leg{
                margin-top: 5%;
                font-family: 'Source Sans Pro', sans-serif !important;
                font-size: 2.5em;
                color: #666;
                font-weight: 400;
            }
           .search_select {
                padding:3px;
                margin-right: 20px;
                background: #fff;
                border-radius: 4px;
                font-weight: bold;
                color:#428bca;
                border:none;
                outline:none;
                display: inline-block;
                -webkit-appearance:none;
                -moz-appearance:none;
                appearance:none;
                cursor:pointer;
            }
            .search_select:hover{
                border: 1px solid #428bca;
            }
            #admin1 {
                color:green;
            }
            #admin {
                color:red;
            }
            
            #nyu a{
               color: white; 
            }
            #nyu a:hover{
                background-color: #428bca;
            }
            
        </style>
    </head>
   
    <body><br>
         
        <div style="padding-bottom: 30%;font-family: 'Source Sans Pro', sans-serif !important;">
        <nav id="mynav" class="navbar navbar-default" role="navigation" >
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
                   
                    <a class="navbar-brand" style="color:white;" href="#">Search</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goAdd();">Add Person</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goEdit();">Edit Person</a>
                  <a class="navbar-brand" style="color:white;" href="#" onclick="goDel();">Delete</a>
                </div>
            </div>
            </div>
        </nav>
        <input type="text" id="ade" value="<%=(String)request.getAttribute("adminmsg")%>" hidden="true"/>
        <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.adminmsg}</div>
        <input type="text" id="suca" value="<%=(String)request.getAttribute("adminmsg1")%>" hidden="true"/>
        <div class="alert alert-success" id="suc" role="alert" hidden="true"><strong>Success! </strong>${requestScope.adminmsg1}</div>
        <h:form action="/admin" onsubmit="return validateAdminBean(this)">
            <fieldset id="search_field">
                <legend id="search_leg"><center>Search</center></legend>
                <div id="searchdiv" style="margin-left: 10%; margin-top: 5%; font-size: 1.2em;">
                   <select name="primary_query" class="search_select" id="primary_query" onchange="update_secondary();">
                       <option class="opt" value="-1" >---Select an Option---</option>
                        <option value="person" >Personal Details</option>
                        <option value="health">Medical Details</option>
                       </select>
                    <select name="secondary_query" id="secondary_query" onchange="update_query();" hidden="true">
                        <option value="-1">---Select an Option---</option>
                        </select>
                    <input type="text" name="query" id="query" hidden="true" value="" maxlength="10" min="10" placeholder="Enter Query"/>
                    <select name="drop" id="drop" hidden="true" value=""></select><br><br>
                    <input type="submit" name="do_admin" id="search" class="btn btn-info" style="margin-bottom: 0%;margin-right:10%; float: right;" value="Search"/> 
                </div>
        </fieldset>
            <input type="submit" id="add" name="do_admin" value="Add" hidden="true"/>    
            <input type="submit" id="edit" name="do_admin" value="Edit"  hidden="true"/>
            <input type="submit" id="del" name="do_admin" value="Delete"  hidden="true"/>
        </h:form>
        </div>
            <script>
                document.getElementById("menu").children[0].children[0].className="selected";
                document.getElementById("menu").children[1].children[0].className="";
                document.getElementById("menu").children[2].children[0].className="";
                document.getElementById("menu").children[3].children[0].className="";
                checkad();
                function checkad(){
                    document.getElementById("err").hidden = true;
                    document.getElementById("suc").hidden = true;
                    var eds = document.getElementById("ade").value;
                    var suc = document.getElementById("suca").value;
                    if(suc==="" && eds===""){
                        document.getElementById("suc").hidden = true;
                        document.getElementById("err").hidden = true;
                    }
                    else if(!(suc==="null")){
                        document.getElementById("suc").hidden =false;
                        document.getElementById("err").hidden = true;
                    }
                    else if(!(eds==="null")){
                        document.getElementById("suc").hidden = true;
                        document.getElementById("err").hidden = false;
                    }
                    document.getElementById("ade").value = null;
                    document.getElementById("suca").value = null;
                }
                
                
                function update_secondary(){
                    document.getElementById("drop").hidden = true;
                    document.getElementById("query").hidden = true;
                    document.getElementById("secondary_query").className= "search_select";
                    document.getElementById("drop").className="";
                    if(document.getElementById("primary_query").value==="person"){
                        update_person();
                    }else if(document.getElementById("primary_query").value==="health"){
                        update_health();
                    }
                    else{
                        document.getElementById("secondary_query").className="";
                        document.getElementById("secondary_query").hidden=true;
                    }
                }
                
                function update_person(){
                    document.getElementById("secondary_query").hidden=false;
                    var opt = document.createElement("option");
                    opt.value="-1";
                    opt.innerHTML = "---Select an Option---";
                    var opt1 = document.createElement("option");
                    opt1.value="p_id";
                    opt1.innerHTML = "ID";
                    var opt2 = document.createElement("option");
                    opt2.value="name";
                    opt2.innerHTML = "Name";
                    var select = document.getElementById("secondary_query");
                    for(i=select.options.length -1;i>=0;i--){
                        select.remove(i);
                    }
                    select.appendChild(opt);
                    select.appendChild(opt1);
                    select.appendChild(opt2);
                }
                
                function update_health(){
                     document.getElementById("secondary_query").hidden=false;
                    var opt = document.createElement("option");
                    opt.value="-1";
                    opt.innerHTML = "---Select an Option---";
                    var opt1 = document.createElement("option");
                    opt1.value="Blood_group";
                    opt1.innerHTML = "Blood Group";
                    var opt2 = document.createElement("option");
                    opt2.value="Personal";
                    opt2.innerHTML = "Personal Problems";
                    var opt3 = document.createElement("option");
                    opt3.value="Present_n_Past";
                    opt3.innerHTML = "Past Problems";
                    var opt4 = document.createElement("option");
                    opt4.value="Counselling";
                    opt4.innerHTML = "Counseling";
                    var opt5 = document.createElement("option");
                    opt5.value="Vaccination";
                    opt5.innerHTML = "Vaccination";
                    var select = document.getElementById("secondary_query");
                    for(i=select.options.length -1;i>=0;i--){
                        select.remove(i);
                    }
                    select.appendChild(opt);
                    select.appendChild(opt1);
                    select.appendChild(opt2);
                    select.appendChild(opt3);
                    select.appendChild(opt4);
                    select.appendChild(opt5);
                }
                
                function update_query(){
                    document.getElementById("drop").className="";
                    if(document.getElementById("secondary_query").value==="-1"){
                        document.getElementById("drop").hidden = true;
                        document.getElementById("query").hidden = true;
                    }
                    else if(document.getElementById("primary_query").value==="person"){
                        update_personquery();
                    }else if(document.getElementById("primary_query").value==="health"){
                        update_healthquery();
                    }
                    else{
                        document.getElementById("drop").hidden = true;
                        document.getElementById("query").hidden = true;
                    }
                }
                
                function update_personquery(){
                    document.getElementById("drop").hidden = true;
                    document.getElementById("query").hidden = false;
                    
                }
                
                function update_healthquery(){
                    document.getElementById("drop").className="search_select";
                    if(document.getElementById("secondary_query").value==="Blood_group"){
                        update_bg();
                    }
                    if(document.getElementById("secondary_query").value==="Personal"){
                        update_personal();
                    }
                    if(document.getElementById("secondary_query").value==="Present_n_Past"){
                        update_presentpast();
                    }
                    if(document.getElementById("secondary_query").value==="Counselling"){
                        update_counseling();
                    }
                    if(document.getElementById("secondary_query").value==="Vaccination"){
                        update_vaccination();
                    }
                }
                
                function update_bg(){
                    document.getElementById("query").hidden = true;
                    document.getElementById("drop").hidden = false;
                    var dataString = "A+,A-,B+,B-,O+,O-,AB+,AB-";
                    var data = dataString.split(',');
                    var s = document.getElementById("drop");
                    var opt1 = document.createElement("option");
                    opt1.value="-1";
                    opt1.innerHTML = "---Select an Option---";
                    for(i=s.options.length -1;i>=0;i--){
                        s.remove(i);
                    }
                    s.appendChild(opt1);
                    for(var val=0;val<data.length;val++){
                        var opt = document.createElement("option");
                        if(data[val].indexOf("+") >=0){
                            opt.value= data[val].replace("+","plus",-1);
                        }else if(data[val].indexOf("-") >=0){
                            opt.value= data[val].replace("-","minus",-1);
                        }
                        else{
                            opt.value= data[val];
                        }
                        opt.innerHTML = data[val];
                        s.appendChild(opt);
                    }
                   //var field = document.getElementById("search");
                    //field.appendChild(s);
                }
                
                function update_personal(){
                    document.getElementById("query").hidden = true;
                    document.getElementById("drop").hidden = false;
                    var dataString = "Improper Sleep,Poor Appetite,Anger or Frustration,Improper Family support,\n\
                                        Poor Self confidence,Language Difficulty";
                    var data = dataString.split(',');
                    var s = document.getElementById("drop");
                    var opt1 = document.createElement("option");
                    opt1.value="-1";
                    opt1.innerHTML = "---Select an Option---";
                    for(i=s.options.length -1;i>=0;i--){
                        s.remove(i);
                    }
                    s.appendChild(opt1);
                    for(var val=0;val<data.length;val++){
                        var opt = document.createElement("option");
                        var result= data[val].split(" ");
                        opt.value = result[result.length-1];
                        opt.innerHTML = data[val];
                        s.appendChild(opt);
                    }
                    //var field = document.getElementById("search");
                    //field.appendChild(s);
                }
                
                function update_counseling(){
                    document.getElementById("query").hidden = true;
                    document.getElementById("drop").hidden = false;
                    var dataString = "Academic issues,Interpersonal relationship,Emotional or Stress related,Excellence in health, \n\
                                        Economic issues,Other";
                    var data = dataString.split(',');
                    var s = document.getElementById("drop");
                    var opt1 = document.createElement("option");
                    opt1.value="-1";
                    opt1.innerHTML = "---Select an Option---";
                    for(i=s.options.length -1;i>=0;i--){
                        s.remove(i);
                    }
                    s.appendChild(opt1);
                    for(var val=0;val<data.length;val++){
                        var opt = document.createElement("option");
                        var result= data[val].split(" ");
                        opt.value = result[0];
                        opt.innerHTML = data[val];
                        s.appendChild(opt);
                    }
                    //var field = document.getElementById("search");
                    //field.appendChild(s);
                }
                
                function update_presentpast(){
                    document.getElementById("query").hidden = true;
                    document.getElementById("drop").hidden = false;
                    var dataString = "Health Problem at Present,Major Illness or Operations in past,Taking any Medicine,Allergy to Medicines,Physical Activity";
                    var data = dataString.split(',');
                    var s = document.getElementById("drop");
                    var opt1 = document.createElement("option");
                    opt1.value="-1";
                    opt1.innerHTML = "---Select an Option---";
                    for(i=s.options.length -1;i>=0;i--){
                        s.remove(i);
                    }
                    s.appendChild(opt1);
                    for(var val=0;val<data.length;val++){
                        var opt = document.createElement("option");
                        opt.value= val;
                        opt.innerHTML = data[val];
                        s.appendChild(opt);
                    }
                    
                }
                
               function update_vaccination(){
                   document.getElementById("query").hidden = true;
                    document.getElementById("drop").hidden = false;
                    var dataString = "HepatitisB,MMR,Tetanus,HepatitisA,Chickenpox,Typhoid";
                    var data = dataString.split(',');
                    var s = document.getElementById("drop");
                    var opt1 = document.createElement("option");
                    opt1.value="-1";
                    opt1.innerHTML = "---Select an Option---";
                    for(i=s.options.length -1;i>=0;i--){
                        s.remove(i);
                    }
                    s.appendChild(opt1);
                    for(var val=0;val<data.length;val++){
                        var opt = document.createElement("option");
                        opt.value= data[val];
                        opt.innerHTML = data[val];
                        s.appendChild(opt);
                    }
               }
               
               function goAdd(){
                    document.getElementById("add").click();
                }
                function goDel(){
                    document.getElementById("del").click();
                }
                function goEdit(){
                    document.getElementById("edit").click();
                }
                
            </script>
    </body>
  
</html>
