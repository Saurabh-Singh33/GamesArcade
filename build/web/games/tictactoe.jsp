<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tic Tac Toe</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        .board {
            display: grid;
            grid-template-columns: repeat(3, 100px);
            gap: 15px;
        }

        .cell {
            width: 100px;
            height: 100px;
            background-color: white;
            border-radius: 12px;
            font-size: 2.5em;
            text-align: center;
            line-height: 100px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            transition: transform 0.2s ease, background-color 0.2s ease;
        }

        .cell:hover {
            transform: scale(1.05);
            background-color: #f0f0f0;
        }

        #status {
            margin-top: 20px;
            font-size: 1.2em;
            color: #444;
        }

        .reset {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .reset:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h1>Tic Tac Toe</h1>
    <div class="board" id="board"></div>
    <div id="status">Player X's turn</div>
    <button class="reset" onclick="resetGame()">Reset Game</button>

    <script>
        const board = document.getElementById('board');
        const status = document.getElementById('status');
        let currentPlayer = 'X';
        let cells = Array(9).fill(null);

        function checkWinner() {
            const winPatterns = [
                [0,1,2], [3,4,5], [6,7,8],
                [0,3,6], [1,4,7], [2,5,8],
                [0,4,8], [2,4,6]
            ];
            for (let pattern of winPatterns) {
                const [a, b, c] = pattern;
                if (cells[a] && cells[a] === cells[b] && cells[a] === cells[c]) {
                    return cells[a];
                }
            }
            return cells.includes(null) ? null : 'Draw';
        }

        function handleClick(index) {
            if (cells[index] || checkWinner()) return;
            cells[index] = currentPlayer;
            renderBoard();
            const winner = checkWinner();
            if (winner) {
                status.textContent = winner === 'Draw' ? "It's a draw!" : `Player ${winner} wins!`;
            } else {
                currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
                status.textContent = `Player ${currentPlayer}'s turn`;
            }
        }

        function renderBoard() {
            board.innerHTML = '';
            cells.forEach((cell, index) => {
                const div = document.createElement('div');
                div.className = 'cell';
                div.textContent = cell;
                div.onclick = () => handleClick(index);
                board.appendChild(div);
            });
        }

        function resetGame() {
            cells = Array(9).fill(null);
            currentPlayer = 'X';
            status.textContent = "Player X's turn";
            renderBoard();
        }

        renderBoard();
    </script>
</body>
</html>