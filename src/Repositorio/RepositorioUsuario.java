package Repositorio;

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
}
