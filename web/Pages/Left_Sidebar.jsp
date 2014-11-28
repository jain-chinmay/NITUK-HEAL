<%-- 
    Document   : Right_Sidebar
    Created on : 26 Sep, 2014, 11:32:25 AM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #uoio{
                margin-top: 34%;
                font-family: 'Source Sans Pro', sans-serif !important;
                font-size: 1.7em;
                color: #666;
                font-weight: 400;
                
                    }
            #uoio h1 {
                color: green;
                font-size: 2em;
                text-transform: uppercase;
                padding-bottom: 10px;
                
            }
            ul, ol {
                margin: 0 0 35px 35px;
                padding: 0;
                list-style: disc;
            }

            #uoio li {
                padding-bottom: 10px;
            }

            #uoio li ol, li ul {
                font-size: 1.0em;
                margin-bottom: 0;
                padding-top: 5px;
            }

            .sidebar {
                margin-top: 10px;
            }

            .sidebar h1 {
                font-weight: bold;
                font-size: 60px;
                padding-bottom: 0;
                padding: 6px 0;
            }

            .sidebar ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .sidebar ul li {
                margin-bottom: 20px;
                line-height: 1.9em;
                padding: 10px;
            }

            .sidebar ul li.bg {
                background-color: #f0f0f0;
            }


            .sidebar .bg h1 {
                color: #666;
            }


            .sidebar li ul {
                list-style: none outside none;
                margin: 0px;
            }

            .sidebar li ul li {
                display: block;
                border-top: none;
                padding: 7px 2px;
                margin: 0;
                line-height: 1.5em;
                font-size: 0.85em;
            }

            .sidebar li ul li ul {
                margin-top: 10px;
            }

            .sidebar li ul li li  {
                font-size: 1.0em;
                padding-left: 15px;
            }



            .sidebar li ul li.text { 
                border-bottom: none;
            }


            .sidebar li ul li a {
                color: #666;
            }

            .sidebar li ul li a:hover {
                 color: #2A5BBB;
            }


            .sidebar li ul li a.readmore {
                font-weight: bold;
            }


            .sidebar ul.blocklist {
            }

            .sidebar ul.blocklist li {
                padding: 0;
            }

            .sidebar ul.blocklist li a,
            .sidebar ul.blocklist li a:hover {
                border-bottom: 0;
                display: block;
                padding: 12px 10px;
            }

            .sidebar ul.blocklist li a.selected {
                background: linear-gradient(#2F65D0, #2C5EC1);
                background-color: #2F65D0;
                color: #FFFFFF;
                border: 1px solid #2C5EC1;
                font-weight: bold;

            }

            .sidebar li ul.blocklist li li {
                font-size: 1.0em;
            }

            .sidebar li ul.blocklist ul {
                margin-top: 0;
            }

            .sidebar li ul.blocklist li li a,
            .sidebar li ul.blocklist li li a:hover {
                padding-left: 25px;
            }

            .clear {
                clear: both;
            }

            a:hover{
                text-decoration: none !important;
            }
        </style>
    </head>
    <body>
        <div id="uoio">
            <aside class="sidebar big-sidebar right-sidebar">
                <ul>
                    <li><h1><img src="../dbms/Images/heal.png" alt="" height="80px"> HEAL</h1>
                
                <ul id="menu" class="blocklist">
                    <li><a href="/dbms/home.do">Home</a></li>
                    <li><a href="/dbms/chPass.do">Change Password</a></li>
                    <li><a href="/dbms/logout.do">Logout</a></li>
                    <li><a href="/dbms/aboutus.do">About <label style="font-size: 0.8em;">NITUK</label>HEAL</a></li>
                    </ul></li></ul>		
            </aside>
                        
        </div>
	
                  
    </body>
    
</html>
