package Model;

public class Usuario {
    private String nick;
    private String pass;
    private String nombre;
    private String apellidos;
    private String tipo;
    private String codigo_postal;
    private String telefono;
    private String correo;
    private String direccion;
    private int id_usuario;

    public Usuario(String nick, String pass, String nombre, String apellidos, String tipo, String codigo_postal, String telefono, String correo, String direccion, int id_usuario) {
        setNick(nick);
        setPass(pass);
        setNombre(nombre);
        setApellidos(apellidos);
        setTipo(tipo);
        setCodigo_postal(codigo_postal);
        setTelefono(telefono);
        setCorreo(correo);
        setDireccion(direccion);
        setId_usuario(id_usuario);
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCodigo_postal() {
        return codigo_postal;
    }

    public void setCodigo_postal(String codigo_postal) {
        this.codigo_postal = codigo_postal;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    
}
