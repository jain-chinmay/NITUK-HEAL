<%--
    Document   : Prescription
    Created on : Nov 6, 2014, 12:22:54 PM
    Author     : CJ
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.Iterator"%>
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
            .data{
                color: #428bca;
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
                   
                  <a class="active navbar-brand" style="color:white;" href="/dbms/person.do">Details</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/Select_Year.do">Medical_Examination</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/med_history.do">History</a>
                  <a class="navbar-brand" style="color:white;"href="#">Prescription</a>
                </div>
                </div>
            </div></nav>
         <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Prescription Detail</label>
              <%String pres_data = (String) session.getAttribute("Pres_data");%>
        <table id="presc" class="table table-striped">
            
           </table>
            <input type="text" id="ade" value="<%=(String)request.getAttribute("presmsg")%>" hidden="true"/>
            <div class="alert alert-danger" id="err" role="alert" hidden="true"><strong>Error! </strong>${requestScope.presmsg}</div>
            <input type="number" id="k" value=0 hidden="true"/>
            <button  id="prev" value="<%=pres_data%>"  onclick="prev(this);" hidden="true" style="width: 30%;float:left;">Previous</button>
            <button  id="next" value="<%=pres_data%>"  onclick="init();" style="width: 30%;float:right;" hidden="true">Next</button>
        </div>
    </body>
    <script>
        var pres_d =[];
        checknopres();
        function checknopres(){
            document.getElementById("err").hidden = true;
            var eds = document.getElementById("ade").value;
            if(eds==="" || eds==="null"){
                document.getElementById("err").hidden = true;
                init();
            }
            else if(!(eds==="null")){
                document.getElementById("err").hidden = false;
            }
            document.getElementById("ade").value = null;
        }

    function init(){
             pres_d =document.getElementById("prev").value.split(":##:");
             next();
         }
         
        function next(){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("presc");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var count=0,j;
            if(k+10<pres_d.length-1){
                j=k+10;
            }
            else
                j=pres_d.length-1;
            for(var i=k;i<j;i++){
                    var row = table.insertRow(count++);
                    var rowcell = pres_d[i].split(":!!:");
                    for(var n=0;n<5;n++){
                        var cell = row.insertCell(n);
                        if(n===0){
                            cell.innerHTML = i+1;
                            
                        }else{
                            cell.innerHTML = rowcell[n-1];
                            cell.className = "data";
                        }
                    }
                }
                document.getElementById("k").value=j;

                if(j>=pres_d.length-2){
                    document.getElementById("next").className = "";
                    document.getElementById("next").hidden=true;
                }
                else{
                    document.getElementById("next").hidden=false;
                    document.getElementById("next").className = "btn btn-block btn-primary";
                }
                if(j<11){
                    document.getElementById("prev").className = "";
                    document.getElementById("prev").hidden=true;
                }
                else{
                    document.getElementById("prev").className = "btn btn-block btn-primary";
                    document.getElementById("prev").hidden=false;
                }
                var t_head =  table.createTHead();
                var row  = t_head.insertRow(0);
                var cell8 = row.insertCell(0);
                cell8.innerHTML = "#";
                var cell5 = row.insertCell(1);
                cell5.innerHTML  = "Age";
                var cell1 = row.insertCell(2);
                cell1.innerHTML  = "Date";
                var cell2 = row.insertCell(3);
                cell2.innerHTML  = "Prescription";
                var cell3 = row.insertCell(4);
                cell3.innerHTML  = "Advice";
               
        }
        
         
        function prev(pres){
                var k =parseInt(document.getElementById("k").value);
                var table = document.getElementById("presc");
                for(var i=table.rows.length-1;i>=0;i--){
                    table.deleteRow(i);
                }
                var count=0;
                for(var i=k-(k%10)-10;i<k-(k%10);i++){
                    var row = table.insertRow(count++);
                    var rowcell = pres_d[i].split(":!!:");
                    for(var n=0;n<5;n++){
                        var cell = row.insertCell(n);
                        if(n===0){
                            cell.innerHTML = i+1;
                        }else{
                            cell.innerHTML = rowcell[n-1];
                            cell.className = "data";
                        }
                    }
                }
                document.getElementById("k").value=k-(k%10)-10;
                if((k-(k%10)-10)<10){
                    document.getElementById("prev").className = "";
                    document.getElementById("prev").hidden=true;
                }
                else{
                    document.getElementById("prev").className = "btn btn-block btn-primary";
                    document.getElementById("prev").hidden=false;
                }
                if(k-(k%10)-10>=pres_d.length-2){
                    document.getElementById("next").className = "";
                    document.getElementById("next").hidden=true;
                }
                else{
                    document.getElementById("next").className = "btn btn-block btn-primary";
                    document.getElementById("next").hidden=false;
                }
                var t_head =  table.createTHead();
                var row  = t_head.insertRow(0);
                var cell8 = row.insertCell(0);
                cell8.innerHTML = "#";
                var cell5 = row.insertCell(1);
                cell5.innerHTML  = "Age";
                var cell1 = row.insertCell(2);
                cell1.innerHTML  = "Date";
                var cell2 = row.insertCell(3);
                cell2.innerHTML  = "Prescription";
                var cell3 = row.insertCell(4);
                cell3.innerHTML  = "Advice";
               
        }
          
    </script>
</html>

