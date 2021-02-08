package controle;

import Repositorio.RepositorioAgendamento;
import Util.Log;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class IconServlet extends HttpServlet {

    private final RepositorioAgendamento _agendamentoRepository;

    public IconServlet(){
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantidadeAgendamentos = 0;
        try {
        quantidadeAgendamentos = _agendamentoRepository.buscarQuantidadeAgendamentosPendentes(Integer.valueOf(request.getSession().getAttribute("id").toString()));
        } catch (SQLException throwables) {
            Log.write(throwables.toString());
        }
        request.setAttribute("quantidadeAgendamentos", quantidadeAgendamentos);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}

