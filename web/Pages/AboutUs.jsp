<%-- 
    Document   : AboutUs
    Created on : Nov 12, 2014, 5:29:31 PM
    Author     : CJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../dbms/JavaScript/jquery-1.11.1.min.js"></script>
        <style>
            #abouth p{
                color: #666;
                font-family:'Source Sans Pro',sans-serif;
                font-size: 1.4em;
                line-height: 1.7;
            }
        </style>
    </head>
    <body><br>
       <div id="abouth" style="padding-bottom: 60%;">
           <h1 style="font-weight: bolder;color: #2F65D0;"><img src="../dbms/Images/heal.png" alt="" height="80px"> <label style="font-size: 0.8em;"> NITUK</label>HEAL</h1><br>
        <p >NITUK-HEAL aims to bring the medical details handy. It is a true web solution with centralized 
            database where the personal and medical details of each person in the college can be maintained in a database. 
            This system is accessible to only to the Medical Officers of our institute. It allows admin to login through 
            a valid username and password and undertake various functionalities such as registering a new person & filling 
            his details, editing & updating his details, maintaining records of prescriptions provided to him, deleting an 
            existing person and searching for a person by attributes such as ID, name, blood group, health problems, 
            vaccination, counselling areas, etc. The main objective of NITUK-HEAL is to automate some of the activities 
            regarding maintaining the medical records of every person in the college. The main advantage of NITUK-HEAL is
            time saving eliminating the necessity to maintain a hardcopy of personal & medical data of each person, 
            as all this can be done through NITUK-HEAL’s interface very easily.</p>
        </div>
    </body>
    <script>
        document.getElementById("menu").children[0].children[0].className="";
        document.getElementById("menu").children[1].children[0].className="";
        document.getElementById("menu").children[2].children[0].className="";
        document.getElementById("menu").children[3].children[0].className="selected";
    </script>
</html>
