package Repositorio;

import db.Conexao;
import entidades.Agendamento;


import javax.swing.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


public class RepositorioAgendamento  {

    Connection con = null;
    CallableStatement stmt = null;
    Conexao conexao = new Conexao();
    ResultSet rs;
    
    public RepositorioAgendamento() {
        super();
    }

    public int buscarQuantidadeAgendamentosPendentes(Integer idUsuario) throws SQLException {
        con = conexao.getConnection();
        stmt = con.prepareCall("{call SP_BuscarQuantidadeAgendamentosPendentes(?)}");

        stmt.setInt(1, idUsuario);
        rs = stmt.executeQuery();

        if (rs.next())
            return rs.getInt("quantidadeAgendamentos");
        return 0;
    }

    public void atualizarStatusAgendamento(int idAgendamento, byte idStatus) throws SQLException, ClassNotFoundException {
        con = conexao.getConnection();
        stmt = con.prepareCall("{call SP_AtualizarStatusAgendamento(?, ?)}");


        stmt.setInt(1, idAgendamento);
        stmt.setInt(2, idStatus);

        stmt.execute();
    }

    public List<Agendamento> buscarAgendamentos(Integer idUsuario) throws SQLException, ParseException, ClassNotFoundException {

        con = conexao.getConnection();
        stmt = con.prepareCall("{call SP_BuscarAgendamentos(?)}");

        stmt.setInt(1, idUsuario);

        rs = stmt.executeQuery();

        List<Agendamento> agendamentos = new ArrayList<Agendamento>();
        while (rs.next())
            agendamentos.add(new Agendamento(
                    rs.getInt("IdAgendamento"),
                    rs.getString("Assunto"),
                    rs.getString("Descricao"),
                    new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DataAgendamento")),
                    rs.getDate("DataCadastro"),
                    rs.getDate("DataAlteracao"),
                    rs.getBoolean("EmailNotificacao"),
                    rs.getString("UrlRedirecionamento"),
                    rs.getInt("IdUsuario"),
                    rs.getByte("IdStatus")
            ));
        return agendamentos;
    }

    public List<Agendamento> buscarAgendamentosPendentes(Integer idUsuario) throws SQLException, ParseException, ClassNotFoundException {
        con = conexao.getConnection();
        stmt = con.prepareCall("{call SP_BuscarAgendamentosPendentes(?)}");


        stmt.setInt(1, idUsuario);

        rs = stmt.executeQuery();

        List<Agendamento> agendamentos = new ArrayList<Agendamento>();
        while (rs.next())
            agendamentos.add(new Agendamento(
                    rs.getInt("IdAgendamento"),
                    rs.getString("Assunto"),
                    rs.getString("Descricao"),
                    new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("DataAgendamento")),
                    rs.getDate("DataCadastro"),
                    rs.getDate("DataAlteracao"),
                    rs.getBoolean("EmailNotificacao"),
                    rs.getString("UrlRedirecionamento"),
                    rs.getInt("IdUsuario"),
                    rs.getByte("IdStatus")
            ));
        return agendamentos;
    }

    public void cadastrarAgendamento(Agendamento agendamento) throws SQLException, ClassNotFoundException, ParseException {
        con = conexao.getConnection();
        stmt = con.prepareCall("{call SP_CadastrarAgendamento(?, ?, ?, ?, ?, ?)}");

        stmt.setString(1, agendamento.getAssunto());
        stmt.setString(2, agendamento.getDescricao());
        stmt.setDate(3, new java.sql.Date(agendamento.getDataAgendamento().getTime()));
        stmt.setInt(4, agendamento.getIdUsuario());
        stmt.setBoolean(5, agendamento.getEmailNotificacao());

        if (agendamento.getUrlRedirecionamento() != "") {
            stmt.setString(6, agendamento.getUrlRedirecionamento());
        }
        stmt.execute();
    }
}
