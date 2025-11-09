<%-- 
    Document   : puzzle
    Created on : 8 Nov, 2025, 3:39:05 PM
    Author     : SAURABH
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Puzzle Game</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #f7971e, #ffd200);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }
            h1 {
                margin-bottom: 20px;
            }
            .puzzle {
                display: grid;
                grid-template-columns: repeat(3, 100px);
                grid-gap: 5px;
            }
            .tile {
                width: 100px;
                height: 100px;
                background: white;
                font-size: 2em;
                text-align: center;
                line-height: 100px;
                cursor: pointer;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            }
            .empty {
                background: transparent;
                box-shadow: none;
            }
            .back-btn {
                background-color: #333;
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 10px;
                font-weight: bold;
                transition: background 0.3s;
            }
            .back-btn:hover {
                background-color: #555;
            }

        </style>
    </head>
    <body>
        <h1>Sliding Puzzle</h1>
        <div class="puzzle" id="puzzle"></div>
           <script>
        const puzzle = document.getElementById('puzzle');
        let tiles = [1, 2, 3, 4, 5, 6, 7, 8, null];

        function render() {
            puzzle.innerHTML = '';
            tiles.forEach((val, i) => {
                const div = document.createElement('div');
                div.className = val ? 'tile' : 'tile empty';
                div.textContent = val || '';
                div.onclick = () => move(i);
                puzzle.appendChild(div);
            });
        }

        function move(i) {
            const emptyIndex = tiles.indexOf(null);
            const validMoves = [i - 1, i + 1, i - 3, i + 3];
            if (validMoves.includes(emptyIndex) &&
                !(i % 3 === 0 && emptyIndex === i - 1) &&
                !(i % 3 === 2 && emptyIndex === i + 1)) {
                [tiles[i], tiles[emptyIndex]] = [tiles[emptyIndex], tiles[i]];
                render();
            }
        }

        render();
    </script>

    <br>
    <a href="<%= request.getContextPath() %>/mainmenu.jsp" class="back-btn">⬅ Back to Menu</a>
</body>
</html>

    </body>
</html>
