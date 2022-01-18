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

public class registerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerController at " + request.getContextPath() + "</h1>");
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
        
        String nick = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        String rePass = request.getParameter("rePass");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String cPostal = request.getParameter("cPostal");
        String tlf = request.getParameter("tlf");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        
        try {
            ArrayList<Usuario> usuarios = Bd.getUsuarios();
            boolean userOkay = true;
            for (Usuario usuario: usuarios) {
                if (nick.equals(usuario.getNick())) {
                    userOkay = false;
                    break;
                }
            }
            
            boolean passOkay = false;
            if (pass.equals(rePass))
                passOkay = true;
            
            if (passOkay) {
                if (userOkay) {
                    sesion.setAttribute("errorUser", "none");
                    sesion.setAttribute("errorPass", "none");
                    sesion.setAttribute("error", "none");
                    sesion.setAttribute("info", "block");
                    Usuario usuario = new Usuario(nick, pass, nombre, apellidos, "cliente", cPostal, tlf, correo, direccion, 0);
                    Bd.insertUsuario(usuario);
                    rd = contexto.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                } else {
                    sesion.setAttribute("errorUser", "block");
                    sesion.setAttribute("errorPass", "none");
                    rd = contexto.getRequestDispatcher("/registro.jsp");
                    rd.forward(request, response);
                }                
            } else {
                sesion.setAttribute("errorUser", "none");
                sesion.setAttribute("errorPass", "block");
                rd = contexto.getRequestDispatcher("/registro.jsp");
                rd.forward(request, response);
            }
            

        } catch (SQLException ex) {
            Logger.getLogger(registerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
