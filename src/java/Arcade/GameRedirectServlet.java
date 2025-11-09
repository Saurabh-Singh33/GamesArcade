package Arcade;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class GameRedirectServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String game = request.getParameter("game");
        String targetPage = "mainmenu.jsp"; // default

        switch (game) {
            case "tictactoe":
                targetPage = "games/tictactoe.jsp";
                break;
            case "guess":
                targetPage = "games/guess.jsp";
                break;
            case "memory":
                targetPage = "games/memory.jsp";
                break;
            case "puzzle":
                targetPage = "games/puzzle.jsp";
                break;
            case "flappy":
                targetPage = "games/flappy.jsp";
                break;
            case "math":
                targetPage = "games/math.jsp";
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher(targetPage);
        rd.forward(request, response);
    }
}
