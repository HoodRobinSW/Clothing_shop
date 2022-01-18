package Model;

import java.sql.Date;

public class PedidosProducto {
   private int id_pedido;
   private String nick;
   private Date fecha_pedido;
   private Double total;

    public PedidosProducto(int id_pedido, String nick, Date fecha_pedido, Double total) {
        this.id_pedido = id_pedido;
        this.nick = nick;
        this.fecha_pedido = fecha_pedido;
        this.total = total;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public Date getFecha_pedido() {
        return fecha_pedido;
    }

    public void setFecha_pedido(Date fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
   
   
}
