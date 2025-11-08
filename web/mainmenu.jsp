<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
   // HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Main Menu - Game Portal</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f7971e, #ffd200);
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }
        header {
            width: 100%;
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px;
        }
        .container {
            display: grid;
            grid-template-columns: repeat(3, 200px);
            gap: 20px;
            margin-top: 40px;
        }
        .game-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
        }
        .game-card:hover {
            transform: scale(1.05);
        }
        .game-card a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        .logout {
            margin-top: 20px;
            background: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
        }
        .logout:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <header>
        <h2>Welcome, <%= username %> 🎮</h2>
    </header>

    <div class="container">
        <div class="game-card">
  <a href="games/tictactoe.jsp">Tic Tac Toe</a>
</div>
        <div class="game-card"><a href="GameRedirectServlet?game=snake">Snake Game</a></div>
        <div class="game-card"><a href="GameRedirectServlet?game=memory">Memory Game</a></div>
        <div class="game-card"><a href="GameRedirectServlet?game=puzzle">Puzzle Game</a></div>
        <div class="game-card"><a href="GameRedirectServlet?game=flappy">Flappy Bird</a></div>
        <div class="game-card"><a href="GameRedirectServlet?game=math">Math Quiz</a></div>
    </div>

    <a class="logout" href="LogoutServlet">Logout</a>
</body>
</html>
