package db;

import javax.swing.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static java.sql.DriverManager.getConnection;

public class Conexao {

    private Connection connection;

    public Conexao (){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionUrl = "jdbc:sqlserver://localhost;databaseName=master;user=sa;password=123;";
            connection = DriverManager.getConnection(connectionUrl);

        } catch (SQLException | ClassNotFoundException e) {

        }
    }

    public Connection getConnection() throws SQLException {
        return this.connection;
    }

    public void closeConexao(){
        try{
            connection.close();
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, "erro ao desconectar!\n Erro:" + e.getMessage());
        }
    }


}
