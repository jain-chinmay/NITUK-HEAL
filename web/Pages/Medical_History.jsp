<%-- 
    Document   : Medical_History
    Created on : Nov 5, 2014, 12:59:40 PM
    Author     : CJ
--%>

<%@page import="java.util.List"%>
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
            #nju a{
                color: #428bca;
                font-family: 'Source Sans Pro', sans-serif !important;
            }
            #nju a:hover{
                background-color:  #2F65D0;
                color : white;
                border-radius: 15px;
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
    <%List Health =(List) session.getAttribute("Health");%>
        <%String f_history = (String) session.getAttribute("f_history");%>
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
                  <a class="active navbar-brand" style="color:white;" href="/dbms/person.do">Details</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/Select_Year.do">Medical_Examination</a>
                  <a class="navbar-brand" style="color:white;" href="#">History</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/prescript.do">Prescription</a>
                </div>
                </div>
            </div>
        </nav>
         <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%><br>
              Blood Group     : &nbsp;&nbsp;&nbsp;&nbsp;<%=Health.get(4)%></div><br>
              <label id="e">Medical History</label>
              
               
              <nav id="mynav" class="navbar" role="navigation">
                    <div id="nju" class="container-fluid" style="border:1px solid #428bca;" height: 20px;">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                   
                      <a class="active navbar-brand" id="<%=Health.get(1)%>" href="#"  onclick="update_pnp(this);">Present & Past</a>
                      <a class="navbar-brand" href="#" id="<%=f_history%>"  onclick="update_fh(this);">Family History</a>
                      <a class="navbar-brand" href="#" id="<%=Health.get(2)%>"  onclick="update_pprob(this);">Personal Problems</a>
                      <a class="navbar-brand" href="#" id="<%=Health.get(3)%>"  onclick="update_couns(this);">Counseling Areas</a>
                      <a class="navbar-brand" href="#"  id="<%=Health.get(5)%>#::#<%=Health.get(6)%>#::#<%=Health.get(7)%>
                      #::#<%=Health.get(8)%>#::#<%=Health.get(9)%>#::#<%=Health.get(10)%>" onclick="update_vac(this);">Vaccination</a>
                    </div></div></nav>
                
                      <table  id="history" class="table table-striped" cellspacing="2" cellpadding="7" hidden="true">
                    
                </table>
        </div>
                <script>
                    function update_pnp(data){
                        var pnp = data.id;
                        var table = document.getElementById("history");
                        var dataString = "Health Problem at Present,Major Illness or Operations in past,Taking any Medicine,Allergy to Medicines,Physical Activity";
                        var data = dataString.split(',');
                        var pnp_data = pnp.split('-');
                        for(i=table.rows.length -1;i>=0;i--){
                            table.deleteRow(i);
                        }
                        var count =0;
                        for(var val=0;val<data.length;val++){
                            if(pnp_data[val].search("yes")>=0){
                                var row = table.insertRow(count++);
                                var cell = row.insertCell(0);
                                cell.innerHTML = data[val];
                            }
                        }
                        table.hidden = false;
                    } 
                   function update_pprob(data){
                        var pnp = data.id;
                        var table = document.getElementById("history");
                        var pnp_data = pnp.split('-');
                        for(i=table.rows.length -1;i>=0;i--){
                            table.deleteRow(i);
                        }
                        if(pnp_data[0].search("None")===-1){
                            for(var val=0;val<pnp_data.length;val++){
                                var row = table.insertRow(val);
                                var cell = row.insertCell(0);
                                cell.innerHTML = pnp_data[val];
                             }
                        }else{
                            var row = table.insertRow(0);
                            var cell = row.insertCell(0);
                            cell.innerHTML = "No Personal Problems.....";
                        }
                        table.hidden = false;
                    }
                    
                    function update_couns(data){
                        var pnp = data.id;
                        var table = document.getElementById("history");
                        var pnp_data = pnp.split('-');
                        for(i=table.rows.length -1;i>=0;i--){
                            table.deleteRow(i);
                        }
                        if(pnp_data[0].search("None")===-1){
                            for(var val=0;val<pnp_data.length;val++){
                                var row = table.insertRow(val);
                                var cell = row.insertCell(0);
                                cell.innerHTML = pnp_data[val];
                             }
                        }else{
                            var row = table.insertRow(0);
                            var cell = row.insertCell(0);
                            cell.innerHTML = "No Counseling Required.....";
                        }
                        table.hidden = false;
                    }
                    
                    function update_vac(data){
                        var pnp = data.id;
                        var table = document.getElementById("history");
                        var pnp_data = pnp.split("#::#");
                        for(i=table.rows.length -1;i>=0;i--){
                            table.deleteRow(i);
                        }
                        var dataString = "Hepatitis-B,MMR,Tetanus,Hepatitis-A,Chicken Pox,Typhoid";
                        var d_name = dataString.split(',');
                        
                        for(var val=pnp_data.length-1;val>=0;val--){
                            var temp = pnp_data[val].split("]");
                            var row = table.insertRow(0);
                            var cel1 = row.insertCell(0);
                            cel1.innerHTML = d_name[val];
                            if(val===0 || val ===2){
                                for(var i=0;i<temp.length;i++){
                                    var celll = row.insertCell(i+1);
                                    celll.innerHTML = temp[i];
                                }
                                var celll = row.insertCell(4);
                                celll.innerHTML = "0-1-6 months";
                            }
                            else if(val===pnp_data.length-1){
                                var celll1 = row.insertCell(1);
                                celll1.innerHTML = temp[0];
                                var celll2 = row.insertCell(2);
                                celll2.innerHTML = "Single dose";
                                celll2.colSpan = "2";
                                var celll3 = row.insertCell(3);
                                celll3.innerHTML = "Every 3 years";
                                
                           }
                           else{
                               var celll1 = row.insertCell(1);
                                celll1.innerHTML = temp[0];
                                var celll2 = row.insertCell(2);
                                celll2.innerHTML = temp[1];
                                var celll3 = row.insertCell(3);
                                celll3.colSpan = "2";
                                if(val===3){
                                    celll3.innerHTML = "2 Doses 1 month apart";
                                }else{
                                    celll3.innerHTML = "2 Doses 6 months apart";
                                }
                           }
                        }
                        var t_head =  table.createTHead();
                        var row  = t_head.insertRow(0);
                        var cell5 = row.insertCell(0);
                        cell5.innerHTML  = "";
                        var cell1 = row.insertCell(1);
                        cell1.innerHTML  = "1st";
                        var cell2 = row.insertCell(2);
                        cell2.innerHTML  = "2nd";
                        var cell3 = row.insertCell(3);
                        cell3.innerHTML  = "3rd";
                        var cell4 = row.insertCell(4);
                        cell4.innerHTML  = "";
                        
                        table.hidden = false;
                    }
                    
                    function update_fh(data){
                        var f_history = data.id;
                        var table = document.getElementById("history");
                        var pnp_data = f_history.split('-');
                        for(i=table.rows.length -1;i>=0;i--){
                            table.deleteRow(i);
                        }
                        if(pnp_data[0].search("None")===-1){
                            for(var val=0;val<pnp_data.length;val++){
                                var row = table.insertRow(val);
                                var cell = row.insertCell(0);
                                cell.innerHTML = pnp_data[val];
                             }
                        }else{
                            var row = table.insertRow(0);
                            var cell = row.insertCell(0);
                            cell.innerHTML = "No Family History.....";
                        }
                        table.hidden = false;
                        
                    }
                </script>
    
    </body>
</html>
