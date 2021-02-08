package controle;

import Repositorio.RepositorioUsuario;
import entidades.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class PrimeiroAcessoServlet extends HttpServlet {

    private final RepositorioUsuario _repositorioUsuario;

    public PrimeiroAcessoServlet() {
        _repositorioUsuario = new RepositorioUsuario();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            if (nome == null || email == null || senha == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            Usuario usuario = new Usuario(nome, email, senha);

            if (_repositorioUsuario.insertUser(usuario)) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException throwables) {
            response.sendRedirect("primeiroAcesso.jsp");
        }
    }
}
