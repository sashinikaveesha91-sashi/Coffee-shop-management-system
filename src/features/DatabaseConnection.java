package features;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Provides a shared JDBC connection for the Cafe Management System MySQL database.
 */
public class DatabaseConnection {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cafe_management_system_db";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    private static Connection connection;

    /**
     * Returns an open database connection. A new connection is created when
     * there is no active connection or the previous connection was closed.
     */
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                System.out.println("Database connection created successfully.");
            } catch (SQLException e) {
                System.err.println("Database connection failed! Error: " + e.getMessage());
                throw e;
            }
        }
        return connection;
    }

    /** Simple connection test. */
    public static void main(String[] args) {
        try {
            Connection conn = getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("TEST PASSED: Database connection is available!");
            } else {
                System.out.println("TEST FAILED: Database connection is unavailable.");
            }
            conn.close();
        } catch (SQLException e) {
            System.err.println("Connection test FAILED! " + e.getMessage());
        }
    }
}
