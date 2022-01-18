<%@page import="Model.PedidosProducto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.ProductoCategoria"%>
<%@page import="Model.Usuario"%>
<%@page import="DAO.Bd"%>
<%@page import="Model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%
    ServletContext contexto = getServletContext();
    RequestDispatcher rd;
    HttpSession sesion = request.getSession();
    String user = (String) sesion.getAttribute("user");
    
    ArrayList<Producto> carrito = (ArrayList<Producto>) sesion.getAttribute("carrito");
    
    if (carrito == null) {
        carrito = new ArrayList<>();
        sesion.setAttribute("carrito", carrito);
    }
        

    if (user == null) {
        rd = contexto.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
    
    String id_usuario = request.getParameter("id_usuario");
    ArrayList<PedidosProducto> pedidos = Bd.getListaPedidosPorCliente(id_usuario);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tienda</title>
        <meta charset="UTF-8">
        <link rel="icon" href="images/shop.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style media="screen">
          div.scaleCol {
            transition: transform 0.5s;
          }
          div.scaleCol:hover {
            transform: scale(1.05);
          }
        </style>
    </head>
    <body>
      <header class="container-fluid" style="background-color: #086375;">
        <nav class="navbar navbar-expand-lg navbar-dark" >
          <div class="container-fluid">
            <a class="navbar-brand" href="adminDashboard.jsp"><img src="images/shop.png" width="30px"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="adminDashboard.jsp">Inicio</a>
                </li>
              </ul>
              <ul class="navbar-nav mb-2 mb-lg-0 d-flex">
                <li class="nav-item me-2"><a class="btn btn-outline-light" href="cerrarSesion">Salir</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>

      <main>
        <section class="container mt-4">
            <div>
                <table class="w-100 text-center border round">
                    <thead>
                        <tr>
                            <th class="border round">Id pedido</th>
                            <th class="border round">Usuario</th>
                            <th class="border round">Fecha del pedido</th>
                            <th class="border round">Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (PedidosProducto pedido:pedidos) {
                        %>        
                            <tr>
                                <td class="border round"><%=pedido.getId_pedido()%></td>
                                <td class="border round"><%=pedido.getNick()%></td>
                                <td class="border round"><%=pedido.getFecha_pedido()%></td>
                                <td class="border round"><%=pedido.getTotal()%></td>
                                <td class="border round"><a href="productosPorCliente.jsp?id_pedido=<%=pedido.getId_pedido()%>" class="btn btn-warning">Productos</a></td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <a href="javascript:window.history.back();" class="btn btn-primary">Volver</a>
        </section>
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top container-fluid bg-dark" style="margin-top: 28%">
          <p class="col-md-4 mb-0 text-muted">� 2021 Tienda de ropa</p>

          <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
          </a>

          <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
          </ul>
        </footer>
      </main>
    </body>
</html>
