package Model;

public class Producto {
    private int id_producto;
    private String nombre;
    private double precio;
    private int id_categoria;
    private String foto;
    private double descuento;
    private String descripcion;

    public Producto(int id_producto, String nombre, double precio, int id_categoria, String foto, double descuento, String descripcion) {
        setId_producto(id_producto);
        setNombre(nombre);
        setPrecio(precio);
        setId_categoria(id_categoria);
        setFoto(foto);
        setDescuento(descuento);
        setDescripcion(descripcion);
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + this.id_producto;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Producto other = (Producto) obj;
        if (this.id_producto != other.id_producto) {
            return false;
        }
        return true;
    }
    
    
    
}
