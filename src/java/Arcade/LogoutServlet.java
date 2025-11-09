package Arcade;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // invalidate session if exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // redirect to login page
        response.sendRedirect("login.jsp");
    }

    // Optional: also handle POST if you use a form logout
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
