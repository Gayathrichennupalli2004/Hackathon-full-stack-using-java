<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter job data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], select, textarea, input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <h2 align="center">Enter job data</h2>
    <form id="jobForm" action="process_job.jsp" method="post" onsubmit="return validateForm()">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>
        
        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="">Select Type</option>
            <option value="Full-time">Full-time</option>
            <option value="Part-time">Part-time</option>
            <option value="Contract">Contract</option>
        </select>
        
        <label for="department">Department:</label>
        <select id="department" name="department" required>
            <option value="">Select Department</option>
            <option value="HR">HR</option>
            <option value="Marketing">Marketing</option>
            <option value="Finance">Finance</option>
        </select>
        
        <label for="country">Country:</label>
        <select id="country" name="country" required>
            <option value="">Select Country</option>
            <option value="USA">USA</option>
            <option value="UK">UK</option>
            <option value="Canada">Canada</option>
        </select>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <label for="openingDate">Opening Date:</label>
        <input type="date" id="openingDate" name="openingDate" required>
        
        <input type="submit" value="Submit">
    </form>

    <script>
        function validateForm() {
            var title = document.getElementById('title').value;
            var type = document.getElementById('type').value;
            var department = document.getElementById('department').value;
            var country = document.getElementById('country').value;
            var description = document.getElementById('description').value;
            var openingDate = document.getElementById('openingDate').value;

            var isValid = true;
            var errorMessage = "";

            if (title.trim() === "") {
                errorMessage += "Title is required.\n";
                isValid = false;
            }

            if (type === "") {
                errorMessage += "Type is required.\n";
                isValid = false;
            }

            if (department === "") {
                errorMessage += "Department is required.\n";
                isValid = false;
            }

            if (country === "") {
                errorMessage += "Country is required.\n";
                isValid = false;
            }

            if (description.trim() === "") {
                errorMessage += "Description is required.\n";
                isValid = false;
            }

            var currentDate = new Date().toISOString().slice(0, 10);
            if (openingDate > currentDate) {
                errorMessage += "Opening date cannot be greater than current date.\n";
                isValid = false;
            }

            if (!isValid) {
                alert(errorMessage);
            }

            return isValid;
        }
    </script>
</body>
</html>