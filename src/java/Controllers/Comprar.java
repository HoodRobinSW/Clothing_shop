package Controllers;

import DAO.Bd;
import Model.Pedido;
import Model.Producto;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

public class Comprar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Comprar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Comprar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        //processRequest(request, response);
        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        HttpSession sesion = request.getSession();
        
        Double total = Double.parseDouble(request.getParameter("total"));
        Usuario user = (Usuario) sesion.getAttribute("userObject");
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();
        java.util.Date fecha = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        sdf.setLenient(false);
        try {
            fecha = sdf.parse(dtf.format(now));
        } catch (ParseException ex) {
            Logger.getLogger(Comprar.class.getName()).log(Level.SEVERE, null, ex);
        }
        Date fechaPedido = new Date(fecha.getTime());
        
        ArrayList<Producto> carrito = (ArrayList<Producto>) sesion.getAttribute("carrito");
        String cantidades[] = (String[]) sesion.getAttribute("cantidades");
        
        Pedido pedido = new Pedido(0, user.getId_usuario(), fechaPedido, total);
        try {
            Bd.insertPedido(pedido, carrito, cantidades);
            carrito.clear();
            rd = contexto.getRequestDispatcher("/pedidoEnviado.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
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
