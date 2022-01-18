package Controllers;

import DAO.Bd;
import Model.Producto;
import Model.ProductoCategoria;
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

public class busquedaProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet busquedaProducto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet busquedaProducto at " + request.getContextPath() + "</h1>");
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
        
        String producto = request.getParameter("producto");
        try {
            ArrayList<ProductoCategoria> productos = Bd.getProductosConSuCategoria();
            contexto.setAttribute("productos", productos);
            rd = contexto.getRequestDispatcher("/busquedaProducto.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(busquedaProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
