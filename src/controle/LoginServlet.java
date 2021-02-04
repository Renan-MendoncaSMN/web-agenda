package controle;

import Repositorio.RepositorioUsuario;
import entidades.Usuario;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {

    private final RepositorioUsuario _repositorioUsuario;

    public LoginServlet() {
        _repositorioUsuario = new RepositorioUsuario();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                Usuario usuario = new Usuario();
                usuario.setEmail(email);
                usuario.setSenha(senha);

        try {
            if(_repositorioUsuario.login(usuario)){
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                response.sendRedirect("index.jsp");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
