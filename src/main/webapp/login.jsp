<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Scheduler - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #e0e0e0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(18, 18, 18, 0.9);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.6);
            width: 900px;
        }
        .left-panel {
            flex: 1;
            padding-right: 30px;
            color: #cfd8dc;
        }
        .left-panel h2 {
            color: #4dd0e1;
        }
        .right-panel {
            flex: 1;
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
        }
        .btn-custom {
            background-color: #00bcd4;
            color: #fff;
            font-weight: 600;
        }
        .btn-custom:hover {
            background-color: #0097a7;
        }
        .credentials-box {
            margin-top: 20px;
            padding: 15px;
            border-radius: 8px;
            background-color: #2b2b2b;
            font-size: 0.9rem;
        }
        .error-msg {
            color: #ff5252;
            font-weight: bold;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <!-- Left Info Panel -->
    <div class="left-panel">
        <h2>Smart Scheduler System</h2>
        <p>Efficiently manage your timetable with an intuitive platform.<br>
           Empowering Institutions with Smart Scheduling.</p>
        <p><small>Mumbai, India</small></p>
    </div>

    <!-- Right Login Panel -->
    <div class="right-panel">
        <h4 class="text-center mb-4">Login to Continue</h4>
        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Login As</label>
                <select name="role" class="form-select" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="admin">Admin</option>
                    <option value="student">Student</option>
                </select>
            </div>
            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>

        <!-- Error message -->
        <div class="error-msg">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </div>

        <!-- Demo Credentials -->
        <div class="credentials-box mt-3">
            <strong>Demo Credentials:</strong><br>
            Admin → <code>admin / admin123</code><br>
            Student → <code>student1 / stud123</code>
        </div>
    </div>
</div>
</body>
</html>
