<%-- 
    Document   : Select_year
    Created on : Nov 4, 2014, 1:08:07 AM
    Author     : CJ
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
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
            #yr{
                font-weight: bolder;
                font-size: 1.2em;
            }
           #sl select {
                padding:3px;
                margin-left: 30px;
                margin-right: 20px;
                background: #fff;
                border-radius: 4px;
                font-weight: bold;
                color:#428bca;
                border:1px solid blue;
                outline:none;
                display: inline-block;
                -webkit-appearance:none;
                -moz-appearance:none;
                appearance:none;
                cursor:pointer;
                width:20%;
            }
           #sl select:hover{
                border: 1px solid #428bca;
            }
            
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
            .table-striped{
                font-family: 'Source Sans Pro', sans-serif !important;
                font-size:1.1em;
                color: #666;
                font-weight: bold;
                text-align: left !important;
            }
        </style>
    </head>
    <%String p_id=(String) session.getAttribute("p_id");%>
    <body><br>
        <div style="padding-bottom: 30%;" id="sl">
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
                  <a class="navbar-brand" style="color:white;" href="/dbms/person.do">Details</a>
                  <a class="navbar-brand active" style="color:white;" href="#">Medical_Examination</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/med_history.do">History</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/prescript.do">Prescription</a>
                </div>
                </div>
            </div>
        </nav>
         <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Medical Details</label><br>
               
              <input type="text" id="p_id" value="<%=p_id%>" hidden="true">
        <label id="yr">Select Year:</label> <select name="h_year" id="h_year" onchange="update_medical();">
                        <option value="-1">------Select Year------</option>
                        <option value="_1">1st Year</option>
                        <option value="_2">2nd Year</option>
                        <option value="_3">3rd Year</option>
                        <option value="_4">4th Year</option>
                        <option value="_5">5th Year</option>
                   </select><br><br>
             <div class="alert alert-danger" id="err" role="alert" hidden="true" >
               <strong>Error! </strong> Data Not Found !</div>      
             
            <table class="table table-striped" id="medTable" cellspacing="2" cellpadding="7" hidden="true">
           <tr><td>Person ID</td>           <td  id="1" width ="400" style="color: green;" ></td></tr>
           <tr><td>Height</td>              <td id="2" width ="400" style="color: green;" ></td></tr>
            <tr><td>Weight</td>         <td id="3" width ="400" style="color: green;"  ></td></tr>
            <tr><td>Waist</td>          <td id="4" width ="400" style="color: green;" ></td></tr>
            <tr><td>Blood Pressure</td>         <td id="5" width ="400" style="color: green;" ></td></tr>
            <tr><td>Vision</td>         <td id="6" width ="400" style="color: green;" ></td></tr>
            <tr><td>Dental</td>         <td id="7" width ="400" style="color: green;" ></td></tr>
            <tr><td>Chest</td>          <td id="8" width ="400" style="color: green;" ></td></tr>
            <tr><td>Abdomen</td>            <td id="9" width ="400" style="color: green;" ></td></tr>
            <tr><td>Other</td>          <td id="10" width ="400" style="color: green;" ></td></tr>
            <tr><td>Advice</td>         <td id="11" width ="400" style="color: green;" ></td></tr>
             </table>
        </div>
                   
                   <script>
                       var xmlHttpObject = new XMLHttpRequest();
                       function update_medical(){
                           var yr = document.getElementById("h_year").value;
                           var p_id = document.getElementById("p_id").value;
                           if(yr!=="-1"){
                           xmlHttpObject.open("Get","/dbms/Personal_MedicalServlet?h_year="+yr+"&p_id="+p_id,true);
                           xmlHttpObject.onreadystatechange = processMedical;
                           xmlHttpObject.send(null);
                           }
                           else{
                               document.getElementById("err").hidden = true;
                              document.getElementById("medTable").hidden = true;
                           }
                       }
                       
                       function processMedical(){
                           //alert(xmlHttpObject.responseText);
                           if(xmlHttpObject.readyState===4 && xmlHttpObject.status===200){
                               var med_text = xmlHttpObject.responseText;
                           }
                          if(med_text!==""){
                              document.getElementById("err").hidden = true;
                              document.getElementById("medTable").hidden = false;
                              var med =  med_text.split("012345"); 
                              var i;
                              if(med.length>2){
                              for(i=1;i<med.length;i++){
                                if(i===1)
                                    document.getElementById(1).innerHTML = med[1];
                                if(i===2){
                                    if(med[2]!==""){
                                        var ht = med[2];
                                        var htsplt = ht.split('-');
                                        document.getElementById(2).innerHTML = htsplt[0]+"'"+htsplt[1]+'"';
                                    }else{
                                        document.getElementById(2).innerHTML = '-';
                                    }
                                }
                                else if(i===3){
                                    if(med[3]!=='0')
                                        document.getElementById(3).innerHTML = med[3];
                                    else
                                        document.getElementById(3).innerHTML = '-';
                                }
                                else if(i===4){
                                    if(med[4]!=='0')
                                        document.getElementById(4).innerHTML = med[4];
                                    else
                                        document.getElementById(4).innerHTML = '-';
                                }
                                if(i===5){
                                    if(med[5]!=="0-0"){
                                        var bpt = med[5];
                                        var btsp = bpt.split('-');
                                        var one;
                                        var two;
                                        if(btsp[0]==="0"){
                                            one = "";
                                        }else
                                            one=btsp[0];
                                        if(btsp[1]==="0")
                                            two = "";
                                        else
                                            two = btsp[1];
                                        document.getElementById(5).innerHTML = one+"-"+two;
                                    }else{
                                        document.getElementById(5).innerHTML = "-";
                                    }
                                }
                                else if(i>5){
                                    if(med[i]==="")
                                        document.getElementById(i).innerHTML ="-";
                                    else
                                        document.getElementById(i).innerHTML = med[i];
                                }
                              }
                              document.getElementById("medTable").hidden=false;
                              document.getElementById("null").hidden=true;
                           }else{
                               document.getElementById("null").hidden=false;
                               document.getElementById("medTable").hidden=true;
                           }
                      }else{
                           document.getElementById("medTable").hidden = true;
                            document.getElementById("err").hidden = false;
                           
                      }
                       }
                   </script>
    </body>
</html>
