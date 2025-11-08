<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Portal Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
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
        input[type=text], input[type=password] {
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
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login to Game Portal</h2>
       <form action="LoginServlet" method="post">
    <input type="text" name="username" placeholder="Enter Username" required><br><br>
    <input type="password" name="password" placeholder="Enter Password" required><br><br>
    <button type="submit">Login</button>
</form>


        <p style="text-align:center;">
            <a href="signup.jsp">Don't have an account? Sign Up</a>
        </p>

        <% if (request.getParameter("error") != null) { %>
            <p class="error">Invalid username or password!</p>
        <% } %>
    </div>
</body>
</html>
