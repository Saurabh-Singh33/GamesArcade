package Arcade;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ If user exists, create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // ✅ Redirect to main menu
                response.sendRedirect("mainmenu.jsp");
            } else {
                // ❌ Invalid credentials
                request.setAttribute("error", "Invalid username or password!");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
