package controle;


import app.Log;
import entidades.Agendamento;
import entidades.RepositorioAgendamento;

import javax.servlet.RequestDispatcher;
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

    private final RepositorioAgendamento _agendamentoRepository;

    public enum methods {
        list,
        listAll,
        getForm,
        icon,
        post,
        put
    }

    public ControleAgendamento() throws  SQLException, ClassNotFoundException {
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cmd = request.getParameter("cmd");

        try {

            if (cmd == null || cmd.equalsIgnoreCase(methods.list.toString()))
                buscarAgendamentosPendentes(request, response);

            if (cmd.equalsIgnoreCase(methods.listAll.toString()))
                buscarTodosAgendamentos(request, response);

            if (cmd.equalsIgnoreCase(methods.icon.toString()))
                buscarQuantidadeAgendamentosPendentes(request, response);

            if (cmd.equalsIgnoreCase(methods.getForm.toString()))
                buscarFormularioCadastro(request, response);

        } catch (Exception e) {
            Log.write(e.toString());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cmd = request.getParameter("cmd");

        try {
            if(cmd.equalsIgnoreCase(methods.post.toString()))
                cadastrarAgendamento(request,response);

            if(cmd.equalsIgnoreCase(methods.put.toString()))
                atualizarStatusAgendamento(request,response);

        } catch (ParseException | SQLException | ClassNotFoundException e) {
            Log.write(e.toString());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    protected void buscarTodosAgendamentos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException, ClassNotFoundException {

        byte pagina = 0;
        if (request.getParameter("pagina") != null)
            pagina = Byte.parseByte(request.getParameter("pagina"));

        List<Agendamento> agendamentos = null;
        agendamentos = _agendamentoRepository.buscarAgendamentos(147, pagina);
        request.setAttribute("agendamentos", agendamentos);
        request.setAttribute("pagina", pagina);
        request.getRequestDispatcher("agendamento/grid.jsp").forward(request, response);
    }

    protected void buscarAgendamentosPendentes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException, ClassNotFoundException {

        List<Agendamento> agendamentos = _agendamentoRepository.buscarAgendamentosPendentes(147);
        request.setAttribute("agendamentos", agendamentos);

       RequestDispatcher rd = request.getRequestDispatcher("agendamento/index.jsp");
       rd.forward(request, response);
    }

    protected void buscarQuantidadeAgendamentosPendentes(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {

        int quantidadeAgendamentos = _agendamentoRepository.buscarQuantidadeAgendamentosPendentes(147);

        request.setAttribute("quantidadeAgendamentos", quantidadeAgendamentos);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void buscarFormularioCadastro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("agendamento/form.jsp").forward(request, response);
    }

    protected void cadastrarAgendamento(HttpServletRequest request, HttpServletResponse response) throws ParseException, SQLException, ClassNotFoundException {

        String assunto = request.getParameter("assunto");
        String descricao = request.getParameter("descricao");
        String dataAgendamento = request.getParameter("dataAgendamento");
        String emailNotificacao = request.getParameter("emailNotificacao");
        String urlRedirecionamento = request.getParameter("urlRedirecionamento");

        if (assunto == null || descricao == null || dataAgendamento == null)
        {

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        Agendamento agendamento = new Agendamento(
                assunto,
                descricao,
                new SimpleDateFormat("dd/MM/yyyy").parse(dataAgendamento),
                Boolean.getBoolean(emailNotificacao),
                urlRedirecionamento);

        _agendamentoRepository.cadastrarAgendamento(agendamento);
        response.setStatus(HttpServletResponse.SC_OK);
    }

    protected void atualizarStatusAgendamento(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException {

        String idAgendamento = request.getParameter("idAgendamento");
        String idStatus = request.getParameter("idStatus");

        if(idAgendamento == null || idStatus == null)
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        _agendamentoRepository.atualizarStatusAgendamento(Integer.parseInt(idAgendamento), Byte.parseByte(idStatus));
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
