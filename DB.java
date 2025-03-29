import java.sql.*;
public class DB {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/java-test";
        String user = "postgres";
        String password = "1234";
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            Statement statement = connection.createStatement();
            ResultSet res = statement.executeQuery("SELECT name FROM account;");
            while (res.next()) {
                System.out.println(res.getString("name"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
