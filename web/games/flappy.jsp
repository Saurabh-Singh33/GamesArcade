<%-- 
    Document   : flappy
    Created on : 9 Nov, 2025
    Author     : SAURABH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flappy Bird 🐦</title>
    <style>
        body {
            background: linear-gradient(to bottom, #70c5ce, #ffffff);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            font-family: 'Poppins', sans-serif;
        }

        h2 {
            margin-bottom: 10px;
        }

        canvas {
            background: #70c5ce;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            border-radius: 10px;
        }

        a.back {
            margin-top: 15px;
            background: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
        }

        a.back:hover {
            background: #c0392b;
        }

        #restartBtn {
            display: none;
            margin-top: 15px;
            background: #27ae60;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        #restartBtn:hover {
            background: #1e8449;
        }
    </style>
</head>
<body>
    <h2>Flappy Bird 🐦</h2>
    <canvas id="gameCanvas" width="320" height="480"></canvas>
    <button id="restartBtn">🔁 Restart</button>
   <a href="<%= request.getContextPath() %>/mainmenu.jsp" class="back">⬅ Back to Menu</a>

    <script>
        const canvas = document.getElementById("gameCanvas");
        const ctx = canvas.getContext("2d");
        const restartBtn = document.getElementById("restartBtn");

        let bird, pipes, score, frame, gameOver;

        function resetGame() {
            // 🐤 slower fall (less gravity) and stronger lift
            bird = { x: 50, y: 150, width: 20, height: 20, gravity: 0.4, lift: -9, velocity: 0 };
            pipes = [];
            score = 0;
            frame = 0;
            gameOver = false;
            restartBtn.style.display = "none";
            update();
        }

        function drawBird() {
            ctx.fillStyle = "#ffeb3b";
            ctx.fillRect(bird.x, bird.y, bird.width, bird.height);
        }

        function drawPipes() {
            ctx.fillStyle = "#4CAF50";
            pipes.forEach(pipe => {
                ctx.fillRect(pipe.x, 0, pipe.width, pipe.top);
                ctx.fillRect(pipe.x, canvas.height - pipe.bottom, pipe.width, pipe.bottom);
            });
        }

        function drawScore() {
            ctx.fillStyle = "black";
            ctx.font = "20px Arial";
            ctx.fillText("Score: " + score, 10, 25);
        }

        function update() {
            if (gameOver) return;
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            bird.velocity += bird.gravity;
            bird.y += bird.velocity;

            // create new pipes
            if (frame % 90 === 0) {
                let gap = 130;
                let top = Math.random() * (canvas.height / 2);
                pipes.push({ x: canvas.width, width: 40, top: top, bottom: canvas.height - top - gap });
            }

            pipes.forEach(pipe => {
                pipe.x -= 2;
                if (pipe.x + pipe.width < 0) pipes.shift();
                if (pipe.x === Math.floor(bird.x)) score++;
                if (
                    bird.x < pipe.x + pipe.width &&
                    bird.x + bird.width > pipe.x &&
                    (bird.y < pipe.top || bird.y + bird.height > canvas.height - pipe.bottom)
                ) {
                    gameOver = true;
                }
            });

            if (bird.y + bird.height > canvas.height || bird.y < 0) gameOver = true;

            drawBird();
            drawPipes();
            drawScore();

            if (!gameOver) {
                frame++;
                requestAnimationFrame(update);
            } else {
                ctx.fillStyle = "red";
                ctx.font = "30px Arial";
                ctx.fillText("Game Over!", 80, canvas.height / 2);
                restartBtn.style.display = "block"; // show restart button
            }
        }

        // Jump on key press or mouse click
        document.addEventListener("keydown", () => { bird.velocity = bird.lift; });
        document.addEventListener("mousedown", () => { bird.velocity = bird.lift; });

        restartBtn.addEventListener("click", resetGame);

        resetGame();
    </script>
     

</body>
</html>
