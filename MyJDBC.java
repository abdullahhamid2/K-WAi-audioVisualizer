import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyJDBC {
    public static void main(String[] args) {

        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://IP:34.132.28.43/kwai",
            "matthew", "Kw@1v1su@l1z3r");

            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("select * from user");

            while (resultSet.next()) {
                System.out.println(resultSet.getString("firstname"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
