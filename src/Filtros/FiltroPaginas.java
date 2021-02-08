package Filtros;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class FiltroPaginas implements Filter {

    public FiltroPaginas(){
    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }


    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String url = httpServletRequest.getRequestURI();
        HttpSession session = httpServletRequest.getSession();

        if(session.getAttribute("usuarioAutenticado") != null || url.lastIndexOf("login.jsp")>-1 || url.lastIndexOf("LoginServlet")>-1){
                chain.doFilter(request, response);
        }else {
            ((HttpServletResponse)response).sendRedirect("login.jsp");
        }

    }

    public void destroy() {

    }
}
