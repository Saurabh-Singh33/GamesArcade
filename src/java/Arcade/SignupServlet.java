package Arcade;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try (Connection con = DBConnection.getConnection()) {
            // Check if username already exists
            String checkQuery = "SELECT * FROM users WHERE username = ?";
            PreparedStatement checkStmt = con.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                response.sendRedirect("signup.jsp?error=1");
            } else {
                String insertQuery = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(insertQuery);
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, email);
                ps.executeUpdate();
                response.sendRedirect("signup.jsp?success=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
