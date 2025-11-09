<%-- 
    Document   : memory
    Created on : 8 Nov, 2025, 3:39:47 PM
    Author     : SAURABH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Memory Match Game 🧠</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .game-container {
            display: grid;
            grid-template-columns: repeat(4, 100px);
            grid-gap: 10px;
        }
        .card {
            width: 100px;
            height: 100px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2em;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
        }
        .flipped {
            background-color: #1abc9c;
            transform: rotateY(180deg);
        }
        .matched {
            background-color: #2ecc71;
            cursor: default;
        }
        .buttons {
            margin-top: 20px;
        }
        .back {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            margin: 0 10px;
        }
        .back:hover {
            background-color: #c0392b;
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

<h1>Memory Match Game 🧠</h1>
<div class="game-container" id="gameBoard"></div>

<div class="buttons">
     
    <button onclick="restartGame()" id="restartBtn">🔄 Restart</button>
</div>

<script>
    const emojis = ['🍎', '🍌', '🍇', '🍒', '🍉', '🍍', '🥝', '🍓'];
    let cards = [...emojis, ...emojis]; // duplicate for pairs
    let firstCard = null;
    let lockBoard = false;

    // Shuffle cards
    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
    }

    const gameBoard = document.getElementById('gameBoard');

    function createBoard() {
        gameBoard.innerHTML = '';
        shuffle(cards).forEach(symbol => {
            const card = document.createElement('div');
            card.classList.add('card');
            card.dataset.symbol = symbol;
            card.onclick = () => flipCard(card);
            gameBoard.appendChild(card);
        });
    }

    function flipCard(card) {
        if (lockBoard || card.classList.contains('flipped') || card.classList.contains('matched')) return;

        card.classList.add('flipped');
        card.textContent = card.dataset.symbol;

        if (!firstCard) {
            firstCard = card;
        } else {
            if (firstCard.dataset.symbol === card.dataset.symbol) {
                firstCard.classList.add('matched');
                card.classList.add('matched');
                firstCard = null;
            } else {
                lockBoard = true;
                setTimeout(() => {
                    firstCard.classList.remove('flipped');
                    card.classList.remove('flipped');
                    firstCard.textContent = '';
                    card.textContent = '';
                    firstCard = null;
                    lockBoard = false;
                }, 800);
            }
        }
    }

    function restartGame() {
        firstCard = null;
        lockBoard = false;
        createBoard();
    }

    createBoard();
</script>
  <a href="<%= request.getContextPath() %>/mainmenu.jsp" class="back">⬅ Back to Menu</a>

</body>
</html>

