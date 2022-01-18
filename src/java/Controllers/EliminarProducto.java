package Controllers;

import DAO.Bd;
import Model.Producto;
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

public class EliminarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EliminarProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EliminarProducto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        HttpSession sesion = request.getSession();
        
        String id = request.getParameter("id");
        ArrayList<Producto> carrito = (ArrayList<Producto>) sesion.getAttribute("carrito");
        try {
            Producto producto = Bd.getProducto(id);
            if (carrito.contains(producto)){
                carrito.remove(producto);
                rd = contexto.getRequestDispatcher("/carrito.jsp");
                rd.forward(request, response);
            } else {
                rd = contexto.getRequestDispatcher("/carrito.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EliminarProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
