<%-- 
    Document   : presentreport
    Created on : Mar 13, 2024, 10:12:51 PM
    Author     : DEll
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Present</title>
    <link rel="stylesheet" href="viewpresent.css">
    <style>
        * {
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.container {
    max-width: 1200px;
    margin: 40px 40px;
    padding: 2rem;
    background-color: #c8ced2;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 2);
    border-radius: 4px;
}

h1 {
    text-align: center;
    margin-bottom: 2rem;
    color: #070606;
    font-size: 40px;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    background-color: rgba(62, 75, 178, 0.685);
    color: rgb(11, 10, 10);
    margin-top: 10px;
    border-radius: 10px;
    padding: 10px;
}

form {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 10px;
    width: 800px;
    align-items: end;
    font-weight: 600;
}

form input {
    width: 200px;
}

form div {
    width: 100%;
}

form button {
    float: right;
    margin-top: 15px;
    margin-right: 90px;
    font-weight: 600;
    background-color: rgba(24, 15, 7, 0.329);
    color: rgb(11, 10, 10);
}

label {
    flex-basis: 18%;
    margin-bottom: 0.5rem;
    color: #4a4a4a;
}

select,
button {
    flex-basis: 70%;
    padding: 10px;
    margin-bottom: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f2f2f2;
    color: #000000;
    cursor: pointer;

}

select:focus,
button:focus {
    outline: none;
    background-color: #e6e6e6;
}

select:hover,
button:hover {
    background-color: #e6e6e6;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    width: 5% 20% 15% 10% 15% 10% 15% 10%;
    text-align: left;
    padding: 0.5rem;
    border-bottom: 1px solid #e0e0e0;
}

th {
    background-color: #f2f2f2;
    color: #4a4a4a;
    font-weight: bold;
}

td {
    color: #4a4a4a;
}
    </style>
</head>

<body>
    <div class="container">
        <h1>View Attendance</h1>
        <form>
            <label for="term">Select a term:</label>
            <select id="term">
                <option value="fall2023">Fall 2023</option>
                <option value="spring2024">Spring 2024</option>
                <!-- Add more terms here -->
            </select> <br />
            <label for="course">Select a course:</label>
            <select id="course">
                <option value="jpd123">Elementary Japanese 1-A1.2 (JPD123)</option>
                <option value="mas291">Statistics and Probability (MAS291)</option>
                <option value="mas291">Statistics and Probability (MAS291)</option>
                <option value="mas291">Statistics and Probability (MAS291)</option>
                <!-- Add more courses here -->
            </select> <br />
            <div>
                <button type="button" id="submit">See Report</button>
            </div>
        </form>
        <table id="gradeReport">
            <thead>
                <tr>
                    <th>N0</th>				
                    <th>DATE</th>
                    <th>SLOT</th>
                    <th>ROOM</th>
                    <th>LECTURER</th>
                    <th>GROUP NAME</th>
                    <th>ATTEDANCE STATUS</th>
                    <th>COMMENT</th>
                  
                </tr>
                <tr>
                   <td>1</td>
                   <td>monday 10/03/2024</td>
                   <td>1_(7h30-9h50)</td>
                   <td>BE101</td>
                   <td>DungVT41</td>
                   <td>de1223</td>
                   <td>present</td>
                   <td>aaaaa</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>monday 10/03/2024</td>
                    <td>1_(7h30-9h50)</td>
                    <td>BE101</td>
                    <td>DungVT41</td>
                    <td>de1223</td>
                    <td>present</td>
                    <td>aaaaa</td>
                 </tr>
                 <tr>
                    <td>1</td>
                    <td>monday 10/03/2024</td>
                    <td>1_(7h30-9h50)</td>
                    <td>BE101</td>
                    <td>DungVT41</td>
                    <td>de1223</td>
                    <td>present</td>
                    <td>aaaaa</td>
                 </tr>
                 <tr>
                    <td>1</td>
                    <td>monday 10/03/2024</td>
                    <td>1_(7h30-9h50)</td>
                    <td>BE101</td>
                    <td>DungVT41</td>
                    <td>de1223</td>
                    <td>present</td>
                    <td>aaaaa</td>
                 </tr>
                 <tr>
                    <td>1</td>
                    <td>monday 10/03/2024</td>
                    <td>1_(7h30-9h50)</td>
                    <td>BE101</td>
                    <td>DungVT41</td>
                    <td>de1223</td>
                    <td>present</td>
                    <td>aaaaa</td>
                 </tr>
            </thead>
        </table>
        <h4>ABSENT: 10% ABSENT SO FAR (2 ABSENT ON 20 TOTAL).</h4>
        
    </div>
</body>

</html>
