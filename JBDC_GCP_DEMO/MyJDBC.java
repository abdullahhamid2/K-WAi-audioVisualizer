

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyJDBC {
    public static final String CREDENTIALS_STRING = "jdbc:mysql://google/test?cloudSqlInstance=cs370-x:us-east1:elijahchou&socketFactory=com.google.cloud.sql.mysql.SocketFactory&useSSL=false&user=test&password=password";
    static Connection connection = null;

    public static void main(String[] args) {
        try {

            Connection connection = DriverManager.getConnection(CREDENTIALS_STRING);
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("select * from testTable");

            while (resultSet.next()) {
                System.out.println(resultSet.getString("guestName"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
