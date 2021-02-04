package controle;

import entidades.Agendamento;
import Repositorio.RepositorioAgendamento;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class FormularioServlet extends HttpServlet {

    private final RepositorioAgendamento _agendamentoRepository;

    public FormularioServlet() throws SQLException, ClassNotFoundException {
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String assunto = request.getParameter("assunto");
            String descricao = request.getParameter("descricao");
            String dataAgendamento = request.getParameter("dataAgendamento");
            String emailNotificacao = request.getParameter("emailNotificacao");
            String urlRedirecionamento = request.getParameter("urlRedirecionamento");

            if (assunto == null || descricao == null || dataAgendamento == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            Agendamento agendamento = null;
                agendamento = new Agendamento(
                        assunto,
                        descricao,
                        new SimpleDateFormat("yyyy/MM/dd").parse(dataAgendamento),
                        Boolean.getBoolean(emailNotificacao),
                        urlRedirecionamento);

            _agendamentoRepository.cadastrarAgendamento(agendamento);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            // gravar log
            // e.getMessage();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
