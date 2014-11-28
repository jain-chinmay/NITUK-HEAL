<%-- 
    Document   : Result_Medical
    Created on : Oct 5, 2014, 5:36:59 PM
    Author     : CJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page import="java.util.*"%>
<%String secondary_query =(String) request.getAttribute("secondary_query");%>
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
                    .table-hover{
                        font-size: 1.4em;
                        font-family: 'Source Sans Pro', sans-serif ;
                    }
                    .table-hover > tbody > tr > td{
                        color: #447fc8;
                    }
                    .table-hover > tbody > tr:hover > td{
                        cursor: pointer;
                       
                    }
                    #e{
                        font-size: 2.7em;
                        font-weight: bold;
                        color:#2f65d0;
                        font-family:'Source Sans Pro',sans-serif;
                        margin-bottom:5% ;
                    }

        </style>
    </head>
    <body><br>
        <div style="padding-bottom: 30%;font-family: 'Source Sans Pro', sans-serif !important;">
         <%String Medical_c = (String) request.getAttribute("Medical_c");
         String[] medicalrow  = Medical_c.split(":##:");
         int n = medicalrow.length;
         %>
          <input type="text" id="second_q" value="<%=secondary_query%>" hidden="true"/>
         <label id="e">Total Results : <%=n%> </label>
        <table class="table table-hover" id="medicalTable" cellspacing="2" cellpadding="8">
            
            <%HashMap<String,String> map = new HashMap<String, String>();
                if(secondary_query.equals("Present_n_Past")){
                        map.put("yes0","Health Problem at Present");
                        map.put("yes1","Major Illness or Operations in past");
                        map.put("yes2","Taking any Medicine");
                        map.put("yes3","Allergy to Medicines");
                        map.put("yes4","Physical Activity");
                    }%>
           
        </table><br><br>
        <h:form action="/getPID">
            <input type="text" id="pid" name="pid" hidden="true"/>
            <input type="submit" id="submit_b" name="submit" hidden="true" />
        </h:form>
            <input type="number" id="k" value=0 hidden="true"/>
            <button  id="prev" value="<%=Medical_c%>"  onclick="prev();" hidden="true" style="width: 30%;float:left;">Previous</button>
            <button  id="next" value="<%=Medical_c%>"  onclick="init();" style="width: 30%;float:right;">Next</button>
        </div>
        <script>
            var pres_d =[];
            var map1 = ["Health Problem at Present","Major Illness or Operations in past","Taking any Medicine","Allergy to Medicines","Physical Activity"];
            var secondary_query = document.getElementById("second_q").value;
         init();
         function init(){
             pres_d =document.getElementById("prev").value.split(":##:");
             next();
         }
         
        function next(){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("medicalTable");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var count=0,j;
            if(k+10<pres_d.length-1){
                j=k+10;
            }
            else
                j=pres_d.length-1;
            var temp = "<tr><th>Person ID</th><th>Name</th><th>Age</th><th>Type</th><th>"+secondary_query+"</th><th></th></tr>";
            for(var i=k;i<j;i++){
                    temp+='<tr onclick="getDetails(this)">';
                    var rowcell = pres_d[i].split(":!!:");
                    for(var n=0;n<5;n++){
                        temp += "<td>";
                        if(n===4){
                            var result = rowcell[4];
                            var result_array ="";
                             if(result.search("]")>=0){
                                 result_array = result.split("]");
                                 for(var c=0;c<result_array.length;c++){
                                    var s = result_array[c];
                                    if(s!==""){
                                        temp += (c+1)+".  "+s ;
                                    }
                                 }
                                 temp+="</td>";
                               }
                            else{
                                if(!(secondary_query==="Blood_group")){
                                    if(result.search("-")>=0){
                                        result = result.replace(/-/g,",");
                                    }
                                    result_array = (result.split(",")).slice(0,result.split(",").length-1);
                                    if(secondary_query==="Present_n_Past"){
                                        var temp_array = result_array;
                                        result_array = [];
                                        var ck=0;
                                        for(var x=0;x<temp_array.length;x++){
                                            if(temp_array[x]!==null && temp_array[x].search("no")===-1){
                                                result_array[ck] = map1[temp_array[x].charAt(temp_array[x].length -1)];
                                                ck =ck+1;
                                            }
                                        } 
                                   }
                                    temp+="<ul>";
                                    for(var x=0;x<result_array.length;x++){
                                        if(result_array[x]!==null){
                                            temp += "<li>"+result_array[x]+"</li>";
                                        }
                                    }
                                    temp+="</ul></td>";
                                }else{
                                    temp += rowcell[n]+"</td>";
                                }
                            }
                        }else{
                            temp += rowcell[n]+"</td>";
                        }
                    }
                    temp+="</tr>";
                }
                table.innerHTML = temp;
                document.getElementById("k").value=j;
                if(j>=pres_d.length-1){
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
        }
        
         
        function prev(){
                var k =parseInt(document.getElementById("k").value);
                var table = document.getElementById("medicalTable");
                for(var i=table.rows.length-1;i>=0;i--){
                    table.deleteRow(i);
                }
                var count=0;
                var temp = "<tr><th>Person ID</th><th>Name</th><th>Age</th><th>Type</th><th>"+secondary_query+"</th><th></th></tr>";
                for(var i=k-(k%10)-10;i<k-(k%10);i++){
                    temp+='<tr onclick="getDetails(this)">';
                    var rowcell = pres_d[i].split(":!!:");
                    for(var n=0;n<5;n++){
                        temp += "<td>";
                        if(n===4){
                            var result = rowcell[4];
                            var result_array ="";
                             if(result.search("]")>=0){
                                 result_array = result.split("]");
                                 for(var c=0;c<result_array.length;c++){
                                    var s = result_array[c];
                                    if(s!==""){
                                        temp += (c+1)+".  "+s ;
                                    }
                                 }
                                 temp+="</td>";
                               }
                            else{
                                if(!(secondary_query==="Blood_group")){
                                    if(result.search("-")>=0){
                                        result = result.replace(/-/g,",");
                                    }
                                    result_array = (result.split(",")).slice(0,result.split(",").length-1);
                                    if(secondary_query==="Present_n_Past"){
                                        var temp_array = result_array;
                                        result_array = [];
                                        var ck=0;
                                        for(var x=0;x<temp_array.length;x++){
                                            if(temp_array[x]!==null && temp_array[x].search("no")===-1){
                                                result_array[ck] = map1[temp_array[x].charAt(temp_array[x].length -1)];
                                                ck =ck+1;
                                            }
                                        } 
                                   }
                                    temp+="<ul>";
                                    for(var x=0;x<result_array.length;x++){
                                        if(result_array[x]!==null){
                                            temp += "<li>"+result_array[x]+"</li>";
                                        }
                                    }
                                    temp+="</ul></td>";
                                }else{
                                    temp += rowcell[n]+"</td>";
                                }
                            }
                        }else{
                            temp += rowcell[n]+"</td>";
                        }
                    }
                    temp+="</tr>";
                }
                table.innerHTML = temp;
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
                
        }
         
            function getDetails(rs){
                var p_id = rs.cells[0].textContent;
                document.getElementById("pid").value=p_id;
                document.getElementById("submit_b").click();
            }
        </script>
    </body>
</html>
