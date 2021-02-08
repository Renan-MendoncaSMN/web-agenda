package controle;

import Util.Log;
import entidades.Agendamento;
import Repositorio.RepositorioAgendamento;
import entidades.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

public class ListaTodosServlet extends HttpServlet {

    private final RepositorioAgendamento _agendamentoRepository;

    public ListaTodosServlet() throws SQLException, ClassNotFoundException {
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Agendamento> agendamentos = null;
        try {
            agendamentos = _agendamentoRepository.buscarAgendamentos(Integer.valueOf(request.getSession().getAttribute("id").toString()));
        } catch (Exception e) {
            Log.write(e.toString());
        }

        request.setAttribute("agendamentos", agendamentos);
        request.getRequestDispatcher("agendamento/listaTodos.jsp").forward(request, response);
    }
}
