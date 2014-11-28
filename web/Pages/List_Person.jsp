<%-- 
    Document   : List_Person
    Created on : Nov 4, 2014, 12:54:44 AM
    Author     : CJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page import="java.util.*"%>
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
        <div style="padding-bottom: 50%;font-family: 'Source Sans Pro', sans-serif !important;">
        <%String Person = (String) request.getAttribute("Person_list");
        String[] personrow = Person.split(":##:");
        int n = personrow.length;%>
        <label id="e">Total Results : <%=n%> </label>
       <table class="table table-hover" id="listPerson"    cellspacing="2" cellpadding="8">
        </table><br><br>
        
        <h:form action="/getPID">
        <input type="text" id="pid" name="pid" hidden="true"/>
            <input type="submit" id="submit_b" name="submit" hidden="true" />
        </h:form>
            <input type="number" id="k" value=0 hidden="true"/>
            <button  id="prev" value="<%=Person%>"  onclick="prev(this);" hidden="true" style="width: 30%;float:left;">Previous</button>
            <button  id="next" value="<%=Person%>"  onclick="init();" style="width: 30%;float:right;">Next</button>
        
        </div>
    <script>
         var pres_d =[];
         init();
         function init(){
             pres_d =document.getElementById("prev").value.split(":##:");
             next();
         }
         
        function next(){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("listPerson");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var count=0,j;
            if(k+10<pres_d.length-1){
                j=k+10;
            }
            else
                j=pres_d.length-1;
            var temp = "<tr><th>Person ID</th><th>Name</th><th>Date of Birth</th><th>Gender</th></tr>";
            for(var i=k;i<j;i++){
                temp+='<tr onclick="getDetails(this)">';
                var rowcell = pres_d[i].split(":!!:");
                for(var n=0;n<4;n++){
                    temp += "<td>"+rowcell[n]+"</td>";
                }
                temp +="</tr>";
            }
            table.innerHTML = temp;
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
         }
        
         
        function prev(pres){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("presc");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var count=0;
            var temp = "<tr><th>Person ID</th><th>Name</th><th>Date of Birth</th><th>Gender</th></tr>";
            for(var i=k-(k%10)-10;i<k-(k%10);i++){
                temp+='<tr onclick="getDetails(this)">';
                var rowcell = pres_d[i].split(":!!:");
                for(var n=0;n<4;n++){
                   temp += "<td>"+rowcell[n]+"</td>";
                }
                temp +="</tr>";
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