package entidades;

import app.Log;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;



public class ControleAgendamento extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final RepositorioAgendamento _repositorioAgendamento;

    public enum metodos {
        list, listAll, getForm, icon, post, put
    }

    public ControleAgendamento() throws SQLException, ClassNotFoundException {
        this._repositorioAgendamento = new RepositorioAgendamento();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    	Log.write("Chegou no get");
    	
        String cmd = request.getParameter("cmd");

        try {

            if (cmd == null || cmd.equalsIgnoreCase(metodos.list.toString()))
                buscarAgendamentosPendentes(request, response);

            if (cmd.equalsIgnoreCase(metodos.listAll.toString()))
                buscarTodosAgendamentos(request, response);

            if (cmd.equalsIgnoreCase(metodos.icon.toString()))
                buscarQuantidadeAgendamentosPendentes(request, response);

            if (cmd.equalsIgnoreCase(metodos.getForm.toString()))
                buscarFormularioCadastro(request, response);

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	Log.write("Chegou no post");

        String cmd = request.getParameter("cmd");

        try {
            if (cmd.equalsIgnoreCase(metodos.post.toString()))
                cadastrarAgendamento(request, response);

            if (cmd.equalsIgnoreCase(metodos.put.toString()))
                atualizarStatusAgendamento(request, response);

        } catch (ParseException | SQLException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    protected void buscarTodosAgendamentos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {

        byte pagina = 0;
        if (request.getParameter("pagina") != null)
            pagina = Byte.parseByte(request.getParameter("pagina"));

        List<Agendamento> agendamentos = null;
        agendamentos = _repositorioAgendamento.buscarAgendamentos(147, pagina);
        request.setAttribute("agendamentos", agendamentos);
        request.setAttribute("pagina", pagina);
        request.getRequestDispatcher("agendamento/grid.jsp").forward(request, response);
    }

    protected void buscarAgendamentosPendentes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {

        List<Agendamento> agendamentos = _repositorioAgendamento.buscarAgendamentosPendentes(147);

        request.setAttribute("agendamentos", agendamentos);
        request.getRequestDispatcher("agendamento/list.jsp").forward(request, response);
    }

    protected void buscarQuantidadeAgendamentosPendentes(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int quantidadeAgendamentos = _repositorioAgendamento.buscarQuantidadeAgendamentosPendentes(147);
        request.setAttribute("quantidadeAgendamentos", quantidadeAgendamentos);
        request.getRequestDispatcher("agendamento/index.jsp").forward(request, response);
    }

    protected void buscarFormularioCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("agendamento/form.jsp").forward(request, response);
    }

    protected void cadastrarAgendamento(HttpServletRequest request, HttpServletResponse response)
            throws ParseException, SQLException, ServletException, IOException {

        String assunto = request.getParameter("assunto");
        String descricao = request.getParameter("descricao");
        String dataAgendamento = request.getParameter("dataAgendamento");
        String emailNotificacao = request.getParameter("emailNotificacao");
        String urlRedirecionamento = request.getParameter("urlRedirecionamento");

        if (assunto == null || descricao == null || dataAgendamento == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        Agendamento agendamento = new Agendamento(assunto, descricao,
                new SimpleDateFormat("dd/MM/yyyy hh:mm").parse(dataAgendamento), Boolean.getBoolean(emailNotificacao),
                urlRedirecionamento);

        _repositorioAgendamento.cadastrarAgendamento(agendamento);
        response.setStatus(HttpServletResponse.SC_OK);
        request.getRequestDispatcher("Agendamento/form.jsp").forward(request, response);
    }

    protected void atualizarStatusAgendamento(HttpServletRequest request, HttpServletResponse response)
            throws SQLException {

        String idAgendamento = request.getParameter("idAgendamento");
        String idStatus = request.getParameter("idStatus");

        if (idAgendamento == null || idStatus == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        _repositorioAgendamento.atualizarStatusAgendamento(Integer.parseInt(idAgendamento), Byte.parseByte(idStatus));
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
