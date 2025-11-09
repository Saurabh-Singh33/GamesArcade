<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Prime Finder Game</title>
<style>
  body {
    font-family: Poppins, Arial, sans-serif;
    background: linear-gradient(135deg,#667eea,#764ba2);
    color: #fff;
    display:flex;
    align-items:center;
    justify-content:center;
    height:100vh;
    margin:0;
  }

  .card {
    background: rgba(255,255,255,0.1);
    padding:28px 24px;
    border-radius:16px;
    width:380px;
    text-align:center;
    box-shadow:0 6px 20px rgba(0,0,0,0.25);
    position:relative;
  }

  h1 {
    margin:0 0 14px 0;
    font-size:24px;
    font-weight:600;
  }

  #status {
    margin-top:8px;
    font-weight:600;
  }

  #score-display {
    margin-top:6px;
    font-size:18px;
    font-weight:600;
    color:#ffd166;
  }

  #game-area {
    display:grid;
    grid-template-columns: repeat(3, 1fr);
    gap:12px;
    margin-top:20px;
  }

  .num-btn {
    background:#fff;
    color:#333;
    border:0;
    padding:16px;
    border-radius:8px;
    font-size:20px;
    cursor:pointer;
    transition:0.2s;
  }
  .num-btn:hover { background:#f0f0f0; }
  .num-btn.correct { background:#7bed9f; color:#000; }
  .num-btn.wrong { background:#ff6b6b; color:#000; }

  .controls {
    margin-top:20px;
    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:10px;
  }

  .small-btn {
    padding:10px 18px;
    border-radius:8px;
    border:0;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
    transition:0.2s;
  }

  .start { background:#4caf50; color:white; }
  .restart { background:#ffb86b; color:#000; }
  .back-btn {
    background:#333;
    color:#fff;
    text-decoration:none;
    padding:10px 16px;
    border-radius:8px;
    font-weight:600;
    transition:0.2s;
  }
  .back-btn:hover { background:#222; }

  /* Keep back button at bottom center */
  .bottom-link {
    text-align:center;
    margin-top:20px;
  }
</style>
</head>

<body>
  <div class="card">
    <h1>🔢 Prime Finder</h1>
    <div id="status">Press Start to begin</div>
    <div id="score-display">Score: 0</div>

    <div id="game-area"></div>

    <div class="controls">
      <button id="start" class="small-btn start">▶ Start</button>
      <button id="restart" class="small-btn restart" style="display:none;">🔁 Restart</button>
    </div>

    <div class="bottom-link">
      <a href="<%= request.getContextPath() %>/mainmenu.jsp" class="back-btn">⬅ Back to Menu</a>
    </div>
  </div>

<script>
document.addEventListener("DOMContentLoaded", () => {
  const gameArea = document.getElementById("game-area");
  const statusEl = document.getElementById("status");
  const scoreDisplay = document.getElementById("score-display");
  const startBtn = document.getElementById("start");
  const restartBtn = document.getElementById("restart");

  let score = 0;
  let total = 0;
  let timer = null;
  let gameRunning = false;
  const roundTime = 1200; // 1.2 seconds per round
  const totalRounds = 15;

  function isPrime(num) {
    if (num < 2) return false;
    for (let i = 2; i <= Math.sqrt(num); i++) {
      if (num % i === 0) return false;
    }
    return true;
  }

  function startGame() {
    score = 0;
    total = 0;
    gameRunning = true;
    startBtn.style.display = "none";
    restartBtn.style.display = "none";
    statusEl.textContent = "Game started! Find all prime numbers!";
    scoreDisplay.textContent = `Score: ${score}`;
    nextRound();
  }

  function nextRound() {
    total++;
    if (total > totalRounds) {
      endGame();
      return;
    }

    gameArea.innerHTML = "";
    statusEl.textContent = `Round ${total}/${totalRounds}`;
    scoreDisplay.textContent = `Score: ${score}`;

    for (let i = 0; i < 9; i++) {
      const num = Math.floor(Math.random() * 90) + 10;
      const btn = document.createElement("button");
      btn.textContent = num;
      btn.className = "num-btn";
      btn.onclick = () => handleClick(num, btn);
      gameArea.appendChild(btn);
    }

    clearTimeout(timer);
    timer = setTimeout(() => nextRound(), roundTime);
  }

  function handleClick(num, btn) {
    if (!gameRunning) return;

    if (isPrime(num)) {
      score++;
      btn.classList.add("correct");
      statusEl.textContent = `✅ ${num} is PRIME!`;
    } else {
      btn.classList.add("wrong");
      statusEl.textContent = `❌ ${num} is NOT prime!`;
    }

    scoreDisplay.textContent = `Score: ${score}`;
  }

  function endGame() {
    clearTimeout(timer);
    gameRunning = false;
    gameArea.innerHTML = "";
    statusEl.innerHTML = `
      🎯 Game Over!<br>
      You found <strong>${score}</strong> primes out of <strong>${totalRounds}</strong> rounds! 🏆
    `;
    scoreDisplay.textContent = `Final Score: ${score}`;
    restartBtn.style.display = "inline-block";
  }

  startBtn.onclick = startGame;
  restartBtn.onclick = startGame;
});
</script>
</body>
</html>
