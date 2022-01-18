package DAO;

import Model.Pedido;
import Model.PedidosProducto;
import Model.Producto;
import Model.ProductoCategoria;
import Model.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Bd {
        private static String usuario="alejdnxu";
        private static String password="hFWucoCz1K26";
        private static String servidor="localhost:3306";
        private static String basedatos="tienda";
        
    public static Connection CrearConexion() {
        Connection cnn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); //invocamos al driver
            String url = "jdbc:mysql://" + servidor + "/" + basedatos;
            cnn = DriverManager.getConnection(url, usuario, password); //nos conectamos a la BD
        } catch (ClassNotFoundException c) {
            System.out.println("Controlador JDBC no encontrado"+c.toString());   
        } catch (SQLException ex) {
            System.out.println("Fallo en la conexion"+ex.toString()); 
        }
        return cnn;
    }
    
    public static ArrayList<Usuario> getUsuarios() throws SQLException {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario;";
        Connection conn = CrearConexion();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Usuario usuario = new Usuario(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
                    rs.getString(9), rs.getInt(10));
            usuarios.add(usuario);
        }
        
        return usuarios;
    } 
    
    public static void insertUsuario(Usuario usuario) throws SQLException {
        Connection conn = CrearConexion();
        String sql = "INSERT INTO usuario VALUES(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, usuario.getNick());
        ps.setString(2, usuario.getPass());
        ps.setString(3, usuario.getNombre());
        ps.setString(4, usuario.getApellidos());
        ps.setString(5, usuario.getTipo());
        ps.setString(6, usuario.getCodigo_postal());
        ps.setString(7, usuario.getTelefono());
        ps.setString(8, usuario.getCorreo());
        ps.setString(9, usuario.getDireccion());
        ps.setInt(10, usuario.getId_usuario());
        ps.executeUpdate();
    }
    
    public static ArrayList<Producto> getProductos() throws SQLException {
        ArrayList<Producto> productos = new ArrayList<>();
        Connection conn = CrearConexion();
        String sql = "SELECT * FROM producto;";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Producto producto = new Producto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getDouble(6), rs.getString(7));
            productos.add(producto);
        }
        
        return productos;
    }
    
    public static Producto getProducto(String id) throws SQLException {
        Producto producto = null;
        Connection conn = CrearConexion();
        String sql = "SELECT * from producto WHERE id_producto = '"+id+"';";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        producto = new Producto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getDouble(6), rs.getString(7));
        
        return producto;
    }
    
    public static void insertPedido(Pedido pedido, ArrayList<Producto> productos, String[] cantidades) throws SQLException {
        Connection conn = CrearConexion();
        String sql = "INSERT INTO pedido VALUES(?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, pedido.getId_pedido());
        ps.setInt(2, pedido.getId_usuario());
        ps.setDate(3, pedido.getFechaPedido());
        ps.setDouble(4, pedido.getTotalPedido());
        ps.executeUpdate();
        
        ps = null;
        sql = "SELECT id_pedido FROM pedido ORDER BY id_pedido DESC LIMIT 1";
        ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int id_pedido = rs.getInt(1);
        
        for (int x=0; x<productos.size();x++) {
            ps = null;
            sql = "INSERT INTO detalle_pedido VALUES(?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ps.setInt(2, 0);
            ps.setInt(3, Integer.parseInt(cantidades[x]));
            ps.setInt(4, productos.get(x).getId_producto());
            ps.executeUpdate();
        }
    }
    
    public static ArrayList<ProductoCategoria> getProductosConSuCategoria() throws SQLException {
        Connection conn = CrearConexion();
        ArrayList<ProductoCategoria> productos = new ArrayList<>();
        String slq = "SELECT producto.id_producto, producto.nombre, precio, categoria.nombre, foto, descuento, descripcion\n" +
            "FROM producto\n" +
            "INNER JOIN categoria \n" +
            "ON producto.id_categoria =  categoria.id_categoria";
        PreparedStatement ps = conn.prepareStatement(slq);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            ProductoCategoria producto = new ProductoCategoria(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), 
                    rs.getString(5), rs.getDouble(6), rs.getString(7));
            productos.add(producto);
        }
        
        return productos;
    }
    
    public static ArrayList<PedidosProducto> getPedidosProductos(String id_producto) throws SQLException {
        Connection conn = Bd.CrearConexion();
        ArrayList<PedidosProducto> pedidos = new ArrayList<>();
        String sql = "SELECT pedido.id_pedido, usuario.nick, fecha_pedido, total_pedido "+
            "FROM pedido "+
            "INNER JOIN usuario "+
            "ON pedido.id_usuario = usuario.id_usuario "+
            "INNER JOIN detalle_pedido "+
            "ON pedido.id_pedido = detalle_pedido.id_pedido "+
            "INNER JOIN producto "+
            "ON producto.id_producto = detalle_pedido.id_producto "+
            "WHERE producto.id_producto = "+id_producto;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            PedidosProducto pedido = new PedidosProducto(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4));
            pedidos.add(pedido);
        }
        
        return pedidos;
    }
    
    public static ArrayList<PedidosProducto> getListaPedidosPorFecha(String fecha1, String fecha2) throws SQLException {
        Connection conn = Bd.CrearConexion();
        ArrayList<PedidosProducto> pedidos = new ArrayList<>();
        String sql = "SELECT pedido.id_pedido, usuario.nick, fecha_pedido, total_pedido "+
            "FROM pedido "+
            "INNER JOIN usuario "+
            "ON pedido.id_usuario = usuario.id_usuario "+
            "WHERE fecha_pedido BETWEEN '"+fecha1+"' AND '"+fecha2+"';";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            PedidosProducto pedido = new PedidosProducto(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4));
            pedidos.add(pedido);
        }
        
        return pedidos;
    }
    
    public static ArrayList<ProductoCategoria> getProductosConSuCategoria(String id_pedido) throws SQLException {
        Connection conn = CrearConexion();
        ArrayList<ProductoCategoria> productos = new ArrayList<>();
        String slq = "SELECT producto.id_producto, producto.nombre, precio, categoria.nombre, foto, descuento, descripcion\n" +
            "FROM producto\n" +
            "INNER JOIN categoria\n" +
            "ON producto.id_categoria =  categoria.id_categoria\n" +
            "INNER JOIN detalle_pedido\n" +
            "ON detalle_pedido.id_producto = producto.id_producto\n" +
            "WHERE id_pedido = "+id_pedido;
        PreparedStatement ps = conn.prepareStatement(slq);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            ProductoCategoria producto = new ProductoCategoria(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), 
                    rs.getString(5), rs.getDouble(6), rs.getString(7));
            productos.add(producto);
        }
        
        return productos;
    }
    
    public static ArrayList<PedidosProducto> getListaPedidosPorCliente(String id_cliente) throws SQLException {
        Connection conn = Bd.CrearConexion();
        ArrayList<PedidosProducto> pedidos = new ArrayList<>();
        String sql = "SELECT pedido.id_pedido, usuario.nick, fecha_pedido, total_pedido "+
            "FROM pedido "+
            "INNER JOIN usuario "+
            "ON pedido.id_usuario = usuario.id_usuario "+
            "WHERE usuario.id_usuario = "+id_cliente+";";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            PedidosProducto pedido = new PedidosProducto(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDouble(4));
            pedidos.add(pedido);
        }
        
        return pedidos;
    }
    
    public static ArrayList<Producto> getProductosPorCategoria(String idCategoria) throws SQLException {
        ArrayList<Producto> productos = new ArrayList<>();
        Connection conn = CrearConexion();
        String sql = "SELECT * FROM producto WHERE id_categoria = "+idCategoria+";";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Producto producto = new Producto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5), rs.getDouble(6), rs.getString(7));
            productos.add(producto);
        }
        
        return productos;
    }
    
    public static String getCategoria(String idCategoria) throws SQLException {
        Connection conn = CrearConexion();
        String sql = "SELECT nombre FROM categoria WHERE id_categoria = "+idCategoria+";";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
        String nombre = rs.getString(1);
        
        return nombre;
    }

}