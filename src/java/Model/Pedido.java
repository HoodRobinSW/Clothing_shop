package Model;

import java.sql.Date;

public class Pedido {
    private int id_pedido;
    private int id_usuario;
    private Date fechaPedido;
    private double totalPedido;

    public Pedido(int id_pedido, int id_usuario, Date fechaPedido, double totalPedido) {
        setId_pedido(id_pedido);
        setId_usuario(id_usuario);
        setFechaPedido(fechaPedido);
        setTotalPedido(totalPedido);
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public double getTotalPedido() {
        return totalPedido;
    }

    public void setTotalPedido(double totalPedido) {
        this.totalPedido = totalPedido;
    }
    
    
}
