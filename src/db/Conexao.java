package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import static java.sql.DriverManager.getConnection;

public class Conexao {

    private Connection connection;

    public Conexao() throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost;databaseName=tempdb;user=sa;password=123;";
            connection = getConnection(connectionUrl);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Connection getConexao() {
        return connection;
    }


    public CallableStatement prepareCall(String procedure) throws SQLException {
        return connection.prepareCall(procedure);
    }
}
