package Arcade;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/game_portal", // database name
                    "root", // your MySQL username
                    ""      // your MySQL password (if any)
                );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
