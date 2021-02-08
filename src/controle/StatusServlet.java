package controle;

import Repositorio.RepositorioAgendamento;
import Util.Log;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

public class StatusServlet extends HttpServlet {

    private final RepositorioAgendamento _agendamentoRepository;

    public StatusServlet() throws SQLException, ClassNotFoundException {
        super();
        _agendamentoRepository = new RepositorioAgendamento();
    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {

        String idAgendamento = request.getParameter("idAgendamento");
        String idStatus = request.getParameter("idStatus");

        if(idAgendamento == null || idStatus == null)
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            _agendamentoRepository.atualizarStatusAgendamento(Integer.parseInt(idAgendamento), Byte.parseByte(idStatus));
        } catch (Exception e) {
            Log.write(e.toString());
        }
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
