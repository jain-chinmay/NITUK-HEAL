<%-- 
    Document   : Basic_Staff
    Created on : Nov 5, 2014, 12:44:05 AM
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
            #mynav{
                -webkit-box-shadow: 2px 2px 15px #1e54c0;
                -moz-box-shadow: 2px 2px 15px #1e54c0;
                box-shadow: 2px 2px 15px #1e54c0;
            }
            #nyu a:hover{
                background-color: #428bca;
                border-radius: 10px;
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
                   
                  <a class="active navbar-brand" style="color:white;" href="#">Details</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/Select_Year.do">Medical_Examination</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/med_history.do">History</a>
                  <a class="navbar-brand" style="color:white;" href="/dbms/prescript.do">Prescription</a>
                
            </div>
            </div></nav>
          <div style="color: #428bca;font-weight: bold; font-size: 1.3em; text-align: justify;float: right;">
              Name : <%=(String)session.getAttribute("name")%><br>
              ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=((String)session.getAttribute("p_id")).toUpperCase()%></div>
              <label id="e">Person Details</label>
            <table  class="table table-striped" cellspacing="2" cellpadding="7">
            <%List Person = (List)session.getAttribute("Person");%>
            
            <% Iterator itr;%>
            <%for(itr=Person.iterator(); itr.hasNext(); ){%>
            <tr><td>Person ID</td>           <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
           <tr><td>Name</td>            <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr> <td>Date of Birth</td>         <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Gender</td>         <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Age</td>            <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Contact</td>            <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr hidden="true"><td>Type</td>           <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Dept</td>           <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Year</td>           <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
            <tr><td>Address</td>         <td width ="400" style="color:green;">
                    <%String adr=(String)itr.next();
                     int len = adr.length();
                     for(int i=0;i<len;i++){
                         if(i%25==0){
                             out.print("\n");
                         }else{
                            out.print(adr.charAt(i));
                         }
                     }
                    %>
                    </td></tr>
            <tr><td>Type</td>           <td width ="400" style="color:green;"><%=itr.next()%></td></tr>
              <%}%>
              
        </table>
        </div>
        
    </body>
</html>

