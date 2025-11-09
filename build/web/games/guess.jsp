<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🎯 Guess the Number Game</title>
    <style>
        body {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            font-family: 'Poppins', sans-serif;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .game-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            text-align: center;
            width: 300px;
        }

        h1 {
            font-size: 1.6em;
            margin-bottom: 10px;
        }

        input {
            width: 80%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            outline: none;
            margin-bottom: 15px;
            text-align: center;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px;
            transition: 0.2s;
        }

        #guessBtn {
            background: #2ecc71;
            color: white;
        }

        #guessBtn:hover {
            background: #27ae60;
        }

        #resetBtn {
            background: #f1c40f;
            color: black;
        }

        #resetBtn:hover {
            background: #d4ac0d;
        }

        #message {
            font-size: 1.1em;
            margin-top: 10px;
        }

        #attempts {
            margin-top: 8px;
            font-size: 0.95em;
        }

        a.back {
            display: inline-block;
            margin-top: 20px;
            background: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s;
        }

        a.back:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <div class="game-container">
        <h1>🎯 Guess the Number</h1>
        <p>I'm thinking of a number between <b>1 and 100</b>.</p>
        <input type="number" id="guessInput" placeholder="Enter your guess" />
        <br>
        <button id="guessBtn">Guess</button>
        <button id="resetBtn">Restart</button>
        <p id="message">Start guessing!</p>
        <p id="attempts">Attempts: 0</p>
    </div>
     <a href="<%= request.getContextPath() %>/mainmenu.jsp" class="back">⬅ Back to Menu</a>

    <script>
        let randomNumber = Math.floor(Math.random() * 100) + 1;
        let attempts = 0;

        const guessInput = document.getElementById("guessInput");
        const message = document.getElementById("message");
        const attemptsDisplay = document.getElementById("attempts");

        document.getElementById("guessBtn").addEventListener("click", () => {
            const guess = Number(guessInput.value);
            if (!guess || guess < 1 || guess > 100) {
                message.textContent = "⚠️ Please enter a number between 1 and 100!";
                return;
            }

            attempts++;
            attemptsDisplay.textContent = `Attempts: ${attempts}`;

            if (guess < randomNumber) {
                message.textContent = "Too low! Try again 🔽";
            } else if (guess > randomNumber) {
                message.textContent = "Too high! Try again 🔼";
            } else {
                message.textContent = `🎉 Correct! The number was ${randomNumber}`;
                alert(`You guessed it in ${attempts} attempts!`);
            }
        });

        document.getElementById("resetBtn").addEventListener("click", () => {
            randomNumber = Math.floor(Math.random() * 100) + 1;
            attempts = 0;
            message.textContent = "Game restarted! Try again 🎲";
            attemptsDisplay.textContent = "Attempts: 0";
            guessInput.value = "";
        });
    </script>

</body>
</html>
