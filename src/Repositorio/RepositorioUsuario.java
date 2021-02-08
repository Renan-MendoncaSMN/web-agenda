package Repositorio;

import Util.Log;
import db.Conexao;
import entidades.Usuario;

import java.sql.*;


public class RepositorioUsuario {

    Connection con = null;
    CallableStatement stmt = null;
    Conexao conexao = new Conexao();
    ResultSet rs;

    public RepositorioUsuario() {
        super();
    }

    public boolean login(Usuario usuario) throws SQLException {
        boolean status = false;
        con = conexao.getConnection();

        PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM Usuario where email = ? and senha = ?");
        preparedStatement.setString(1, usuario.getEmail());
        preparedStatement.setString(2, usuario.getSenha());

        System.out.println(preparedStatement);
        rs = preparedStatement.executeQuery();
        status = rs.next();
        return status;
    }

    public boolean insertUser(Usuario usuario) throws SQLException {
        try {
            con = conexao.getConnection();

            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO Usuario (Nome, Email, Senha) VALUES (?,?,?)");
            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getSenha());

            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            Log.write(e.toString());
            return false;
        }
    }


}
