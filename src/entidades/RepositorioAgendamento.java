package entidades;

import db.RepositorioBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class RepositorioAgendamento extends RepositorioBase {

    private enum procedures {
        SP_AtualizarStatusAgendamento, SP_BuscarAgendamentos, SP_BuscarAgendamentosPendentes,
        SP_BuscarQuantidadeAgendamentosPendentes, SP_CadastrarAgendamento
    }

    public RepositorioAgendamento() throws SQLException, ClassNotFoundException {
        super();
    }

    public int buscarQuantidadeAgendamentosPendentes(Integer idUsuario) throws SQLException {

        setProcedure(procedures.SP_BuscarQuantidadeAgendamentosPendentes);
        addParameter(1, idUsuario);
        ResultSet retorno = executeQuery();

        if (retorno.next())
            return retorno.getInt("QuantidadeAgendamentos");

        return 0;
    }

    public void atualizarStatusAgendamento(int idAgendamento, byte idStatus) throws SQLException {
        setProcedure(procedures.SP_AtualizarStatusAgendamento);

        addParameter(1, idAgendamento);
        addParameter(2, idStatus);

        executeVoidQuery();
    }

    public List<Agendamento> buscarAgendamentos(Integer idUsuario, byte pagina) throws SQLException, ParseException {

        setProcedure(procedures.SP_BuscarAgendamentos);

        addParameter(1, idUsuario);
        addParameter(2, pagina);

        ResultSet result = executeQuery();

        List<Agendamento> agendamentos = new ArrayList<Agendamento>();
        while (result.next())
            agendamentos.add(new Agendamento(
                    result.getInt("IdAgendamento"),
                    result.getString("Assunto"),
                    result.getString("Descricao"),
                    new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(result.getString("DataAgendamento")),
                    result.getDate("DataCadastro"),
                    result.getDate("DataAlteracao"),
                    result.getBoolean("EmailNotificacao"),
                    result.getString("UrlRedirecionamento"),
                    result.getInt("IdUsuario"),
                    result.getByte("IdStatus")
            ));

        return agendamentos;
    }

    public List<Agendamento> buscarAgendamentosPendentes(Integer idUsuario) throws SQLException, ParseException {
        setProcedure(procedures.SP_BuscarAgendamentosPendentes);

        addParameter(1, idUsuario);

        ResultSet result = executeQuery();

        List<Agendamento> agendamentos = new ArrayList<Agendamento>();
        while (result.next())
            agendamentos.add(new Agendamento(
                    result.getInt("IdAgendamento"),
                    result.getString("Assunto"),
                    result.getString("Descricao"),
                    new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(result.getString("DataAgendamento")),
                    result.getDate("DataCadastro"),
                    result.getDate("DataAlteracao"),
                    result.getBoolean("EmailNotificao"),
                    result.getString("UrlRedirecionamento"),
                    result.getInt("IdUsuario"),
                    result.getByte("IdStatus")
            ));
        return agendamentos;
    }

    public void cadastrarAgendamento(Agendamento agendamento) throws SQLException {

        setProcedure(procedures.SP_CadastrarAgendamento);

        addParameter(1, agendamento.getAssunto());
        addParameter(2, agendamento.getDescricao());
        addParameter(3, agendamento.getDataAgendamento());
        addParameter(4, agendamento.getIdUsuario());

        if (agendamento.getEmailNotificacao() == true) {
            addParameter(5, agendamento.getEmailNotificacao());
        }

        if (agendamento.getUrlRedirecionamento() != "") {
            addParameter(6, agendamento.getUrlRedirecionamento());
        }
        executeVoidQuery();
    }
}
