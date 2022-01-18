package Controllers;

import DAO.Bd;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        HttpSession sesion = request.getSession();
        
        String username = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        
        try {
            ArrayList<Usuario> usuarios = Bd.getUsuarios();
            boolean okay = false;
            
            Usuario us = null;
            for (Usuario usuario:usuarios) {
                if (username.equals(usuario.getNick()) && pass.equals(usuario.getPass())){
                    okay = true;
                    us = usuario;
                    sesion.setAttribute("userObject", usuario);
                }
            }
            
            if (okay) {
                sesion.setAttribute("error", "none");
                sesion.setAttribute("user", username);
                if (us.getTipo().equals("admin")) {
                    rd = contexto.getRequestDispatcher("/adminDashboard.jsp");
                    rd.forward(request, response);
                } else {
                    rd = contexto.getRequestDispatcher("/landing.jsp");
                    rd.forward(request, response);
                }
            } else {
                sesion.setAttribute("error", "block");
                sesion.setAttribute("info", "none");
                rd = contexto.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
            
        } catch (SQLException ex) {
            System.out.println("SQLException thrown");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
