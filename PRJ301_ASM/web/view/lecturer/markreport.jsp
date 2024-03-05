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
        <thead>
            <tr>
                <th onclick="showDetails('Fall2021')">TERM</th>
                <th>COURSE</th>
            </tr>
        </thead>
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

            // Đặt tên học kỳ
            termNameElement.textContent = term;

            // Xóa nội dung cũ
            courseDetailsElement.innerHTML = '';

            // Thêm thông tin chi tiết môn học tương ứng
            switch (term) {
                case 'Fall2021':
                    // Thêm các môn học tương ứng
                    break;
                case 'Spring2022':
                    // Thêm các môn học tương ứng
                    break;
                case 'Summer2022':
                    // Thêm các môn học tương ứng
                    break;
                // Thêm các học kỳ khác tương tự

                case 'Spring2024':
                    // Thêm thông tin môn học cho Spring2024
                    addCourseDetail('DBI202 - SE1817');
                    addCourseDetail('PRJ301 - SE1815');
                    addCourseDetail('PRJ301 - AI1234');
                    break;

                default:
                    break;
            }

            // Hiển thị chi tiết
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

