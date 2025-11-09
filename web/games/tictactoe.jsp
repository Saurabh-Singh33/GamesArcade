<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tic Tac Toe ❌⭕</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .board {
            display: grid;
            grid-template-columns: repeat(3, 100px);
            grid-gap: 10px;
        }

        .cell {
            width: 100px;
            height: 100px;
            background-color: white;
            border-radius: 10px;
            font-size: 2.5em;
            color: #34495e;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background 0.3s;
        }

        .cell:hover {
            background-color: #ecf0f1;
        }

        #status {
            margin-top: 20px;
            font-size: 1.3em;
            color: #2c3e50;
        }

        .buttons {
            margin-top: 20px;
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

<h1>Tic Tac Toe ❌⭕</h1>
<div class="board" id="board"></div>
<p id="status">Player X's turn</p>

<div class="buttons">
    <a href="../mainmenu.jsp" class="back">⬅ Back to Menu</a>
    <button onclick="restartGame()" class="btn">🔄 Restart</button>
</div>

<script>
    const board = document.getElementById('board');
    const statusText = document.getElementById('status');
    let currentPlayer = 'X';
    let cells = Array(9).fill(null);
    let gameActive = true;

    function createBoard() {
        board.innerHTML = '';
        for (let i = 0; i < 9; i++) {
            const cell = document.createElement('div');
            cell.classList.add('cell');
            cell.addEventListener('click', () => makeMove(i));
            board.appendChild(cell);
        }
    }

    function makeMove(i) {
        if (!gameActive || cells[i]) return;
        cells[i] = currentPlayer;
        board.children[i].textContent = currentPlayer;

        if (checkWin()) {
            statusText.textContent = `🎉 Player ${currentPlayer} wins!`;
            gameActive = false;
            return;
        }

        if (cells.every(cell => cell)) {
            statusText.textContent = "It's a Draw! 🤝";
            gameActive = false;
            return;
        }

        currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
        statusText.textContent = `Player ${currentPlayer}'s turn`;
    }

    function checkWin() {
        const winPatterns = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ];
        return winPatterns.some(pattern => {
            const [a, b, c] = pattern;
            return cells[a] && cells[a] === cells[b] && cells[a] === cells[c];
        });
    }

    function restartGame() {
        cells.fill(null);
        currentPlayer = 'X';
        gameActive = true;
        statusText.textContent = `Player X's turn`;
        createBoard();
    }

    createBoard();
</script>


</body>
</html>
