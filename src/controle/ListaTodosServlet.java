package controle;

import entidades.Agendamento;
import Repositorio.RepositorioAgendamento;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        String id = request.getParameter("IdUsuario");

        List<Agendamento> agendamentos = null;
        try {
            agendamentos = _agendamentoRepository.buscarAgendamentos(147);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        request.setAttribute("agendamentos", agendamentos);
        request.getRequestDispatcher("agendamento/listaTodos.jsp").forward(request, response);
    }
}
