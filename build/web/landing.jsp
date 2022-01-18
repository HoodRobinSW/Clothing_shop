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
            <a class="navbar-brand" href="#"><img src="images/shop.png" width="30px"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Categorías
                  </a>
                  <ul class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="categorias.jsp?idCategoria=1">Camisetas</a></li>
                    <li><a class="dropdown-item" href="categorias.jsp?idCategoria=2">Pantalones</a></li>
                    <li><a class="dropdown-item" href="categorias.jsp?idCategoria=3">Sudaderas</a></li>
                    <li><a class="dropdown-item" href="categorias.jsp?idCategoria=4">Chaquetas</a></li>
                    <li><a class="dropdown-item" href="categorias.jsp?idCategoria=5">Camisas</a></li>
                  </ul>
                </li>
              </ul>
              <ul class="navbar-nav mb-2 mb-lg-0 d-flex">
                <li class="nav-item me-2"><a class="btn btn-outline-light" href="cerrarSesion">Salir</a></li>
                <li class="nav-item me-2"><a class="btn btn-outline-light" href="carrito.jsp"><img src="images/shopping-cart.png" width="20px"/></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>

      <main>
        <section class="container mt-4">
            <p class="pb-4">Bienvenido, <span class="text-info"><%=user%></span></p>
            <h3 class="text-center">Todos los productos</h3>
            <hr class="my-4">
          <div class="row row-cols-1 row-cols-md-4 g-4">
            <%
                ArrayList<Producto> productos = Bd.getProductos();
                for (Producto producto:productos) {
            %>
                <div class="col scaleCol">
                  <div class="card">
                    <a href="articulo.jsp?id=<%=producto.getId_producto()%>"><img src="images/clothes/<%=producto.getFoto()%>" class="card-img-top" alt="..."></a>
                    <div class="card-body">
                      <h5 class="card-title"><%=producto.getNombre()%></h5>
                    </div>
                  </div>
                </div>
            <%
                }
            %>
          </div>
        </section>
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top container-fluid bg-dark" style="margin-top: 20%">
          <p class="col-md-4 mb-0 text-muted">ï¿½ 2021 Tienda de ropa</p>

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
