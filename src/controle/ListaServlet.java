package controle;

import Util.Log;
import entidades.Agendamento;
import Repositorio.RepositorioAgendamento;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public class ListaServlet extends HttpServlet {

    private final RepositorioAgendamento _agendamentoRepository;

    public ListaServlet() throws SQLException, ClassNotFoundException {
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Agendamento> agendamentosPendentes = null;
        try {
            agendamentosPendentes = _agendamentoRepository.buscarAgendamentosPendentes(Integer.valueOf(request.getSession().getAttribute("id").toString()));
        } catch (Exception e) {
            Log.write(e.toString());
        }
        request.setAttribute("agendamentosPendentes", agendamentosPendentes);
        RequestDispatcher rd = request.getRequestDispatcher("agendamento/index.jsp");
        rd.forward(request, response);
    }


}
