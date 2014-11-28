<%-- 
    Document   : Footer
    Created on : 26 Sep, 2014, 11:31:48 AM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="<h:rewrite page='/CSS/Footer.css'/>" type="text/css" media="screen" />
        <style>
            #foot{
                
            }
            #hj{
                
                opacity: 0.9;
            }
            
            #f{
               padding-left: 25%;
                padding-top: 1%;
                color:white;
                font-size: 0.8em;
                font-weight: bolder;
            }
            #hj .col-md-2{
               color:white; 
            }
            
            #hj a{
                color:white;
            }
            
            #hj a:active{
                color: #ffffff;
            }
            #hj a:hover{
                color: black;
                text-decoration: none;
            }
            
        </style>
    </head>
    <body>
        <div id="foot">
        <div id="hj" style="height: 50px; opacity: 0.7;">
            <div class="row" id="f" style="opacity: 0.7; width: 80%;">
    <div class="col-md-2">This © 2015</div>
    <div class="col-md-2"><a href="#" onclick="goDev();">Developers</a></div>
    <div class="col-md-2">  <a href="#" onclick="goTerms();">Terms</a></div>
    <div class="col-md-2">   <a href="http://www.nituk.ac.in" onclick="goNit();">About NIT UK</a></div>
    <div class="col-md-2" ><a href="#" onclick="goDev();">Contact Us</a></div>
        </div>
        </div>
        <div id="cl" hidden="true">
            <h:link action="/developers"></h:link>
            <h:link action="/terms"></h:link>
             <form action="http://www.nituk.ac.in">
             <input type="submit" id="do">
              </form>
        </div>
        </div>
    </body>
    <script>
        function goDev(){
            window.location = document.getElementById("cl").children[0];   
        }
        function goTerms(){
            window.location = document.getElementById("cl").children[1];
        }
        function goNit(){
             document.getElementById("do").click();
        }
    </script>
</html>
