<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - Game Portal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .signup-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            width: 320px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type=submit] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #2196F3;
            color: white;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #1976D2;
        }
        .error, .success {
            text-align: center;
        }
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>
    <div class="signup-box">
        <h2>Create Account</h2>
        <form action="SignupServlet" method="post">
            <input type="text" name="username" placeholder="Choose Username" required>
            <input type="password" name="password" placeholder="Choose Password" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="submit" value="Sign Up">
        </form>

        <p style="text-align:center;">
            <a href="login.jsp">Already have an account? Login</a>
        </p>

        <% if (request.getParameter("success") != null) { %>
            <p class="success">Signup successful! Please login.</p>
        <% } else if (request.getParameter("error") != null) { %>
            <p class="error">Username already exists. Try again.</p>
        <% } %>
    </div>
</body>
</html>
