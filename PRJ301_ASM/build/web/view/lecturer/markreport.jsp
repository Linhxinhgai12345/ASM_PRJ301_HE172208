<%-- 
    Document   : markreport
    Created on : Mar 5, 2024, 10:48:24 PM
    Author     : DEll
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mark Report</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            cursor: pointer;
        }

        th {
            background-color: #f2f2f2;
        }

        .hidden {
            display: none;
        }
    </style>
</head>

<body>

    <h2>Mark Report</h2>

    <table>
        
        <tbody>
            <tr>
                <td onclick="showDetails('Fall2021')">Fall2021</td>
                <td></td>
            </tr>
            <tr>
                <td onclick="showDetails('Spring2022')">Spring2022</td>
                <td></td>
            </tr>
            <tr>
                <td onclick="showDetails('Summer2022')">Summer2022</td>
                <td></td>
            </tr>
            <!-- Thêm các dòng khác tương tự cho bảng điểm -->
        </tbody>
    </table>

    <div id="details" class="hidden">
        <h3 id="termName"></h3>
        <ul id="courseDetails"></ul>
    </div>

    <script>
        function showDetails(term) {
            var termNameElement = document.getElementById('termName');
            var courseDetailsElement = document.getElementById('courseDetails');

            termNameElement.textContent = term;

            
            courseDetailsElement.innerHTML = '';
            switch (term) {
                case 'Fall2021':
                    addCourseDetail('DBI202 - SE1817');
                    addCourseDetail('PRJ301 - SE1815');
                    addCourseDetail('PRJ301 - AI1234');
                    break;
                case 'Spring2022':
                    addCourseDetail('DBI202 - SE1817');
                    addCourseDetail('PRJ301 - SE1815');
                    addCourseDetail('PRJ301 - AI1234');
                    break;
                case 'Summer2022':
                    addCourseDetail('DBI202 - SE1817');
                    addCourseDetail('PRJ301 - SE1815');
                    addCourseDetail('PRJ301 - AI1234');
                    break;
                

                case 'Spring2024':
                    
                    addCourseDetail('DBI202 - SE1817');
                    addCourseDetail('PRJ301 - SE1815');
                    addCourseDetail('PRJ301 - AI1234');
                    break;

                default:
                    break;
            }

            // show detail for term
            var detailsElement = document.getElementById('details');
            detailsElement.classList.remove('hidden');
        }

        function addCourseDetail(course) {
            var courseDetailsElement = document.getElementById('courseDetails');
            var listItem = document.createElement('li');
            listItem.textContent = course;
            courseDetailsElement.appendChild(listItem);
        }
    </script>

</body>

</html>

