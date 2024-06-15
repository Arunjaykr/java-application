import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewRegisterServlet extends HttpServlet {

    private static Connection connection;
    private static String URL = "jdbc:mysql://localhost:3306/registers";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading JDBC driver");
        }
    }

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "Arunjay@123");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error connecting to the database");
        }
        return connection;
    }

    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error closing the database connection");
        }
    }

    private void createTable(Connection connection) throws SQLException {
        String CreateTable = "CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50), email VARCHAR(100), password VARCHAR(100), gender VARCHAR(10), country VARCHAR(50))";
        try (PreparedStatement preparedStatement = connection.prepareStatement(CreateTable)) {
            preparedStatement.executeUpdate();
        }
    }

    private void insertData(Connection connection, String name, String email, String password, String gender, String country) throws SQLException {
        String InsertData = "INSERT INTO users (name, email, password, gender, country) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(InsertData)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, gender);
            preparedStatement.setString(5, country);
            preparedStatement.executeUpdate();
        }
    }
     private void deleteAllData(Connection connection) throws SQLException {
        String deleteData = "DELETE FROM users";
        try (PreparedStatement preparedStatement = connection.prepareStatement(deleteData)) {
            preparedStatement.executeUpdate();
        }
    }
     private void deleteColumnData(Connection connection, String columnName) throws SQLException {
    String deleteData = "UPDATE users SET " + columnName + " = NULL"; // Assuming you want to set the column to NULL
    try (PreparedStatement preparedStatement = connection.prepareStatement(deleteData)) {
        preparedStatement.executeUpdate();
    }
}
private void deleteRow(Connection connection, String columnName, String columnValue) throws SQLException {
    String deleteData = "DELETE FROM users WHERE " + columnName + " = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(deleteData)) {
        preparedStatement.setString(1, columnValue);
        preparedStatement.executeUpdate();
    }
}


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    response.setContentType("text/html;charset=UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String country = request.getParameter("country");
    try {
        Connection connection = getConnection();
        createTable(connection);
        insertData(connection, name, email, password, gender, country);
        //deleteAllData(connection);
        //deleteRow(connection, "name", "Alok kumar"); 
        //deleteColumnData(connection, "columnName");
        closeConnection();
         response.sendRedirect("welcome.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>Servlet NewServletCon</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>Data inserted successfully</h1>");
    out.println("</body>");
    out.println("</html>");
}
}