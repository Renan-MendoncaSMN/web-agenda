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
        try {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                Usuario usuario = new Usuario();
                usuario.setEmail(email);
                usuario.setSenha(senha);


            if(_repositorioUsuario.login(usuario) == true){

                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else {
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
}
