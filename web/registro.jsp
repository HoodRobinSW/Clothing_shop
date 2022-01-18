<%
    ServletContext contexto = getServletContext();
    RequestDispatcher rd;
    HttpSession sesion = request.getSession();
    
    String user = (String) sesion.getAttribute("user");
    String errorUser = (String) sesion.getAttribute("errorUser");
    String errorPass = (String) sesion.getAttribute("errorPass");
    
    if (errorUser == null) 
        errorUser = "none";
    
    if (errorPass == null)
        errorPass = "none";
        
    if (user != null) {
        rd = contexto.getRequestDispatcher("/landing.jsp");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Tienda - Registro</title>
    <meta charset="UTF-8">
    <link rel="icon" href="images/shop.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #errorUser {
            display: <%=errorUser%>;
        }
        
        #errorPass {
            display: <%=errorPass%>;
        }
    </style>
  </head>
  <body style="background-color: #3C1642; height: 100%;">
    <header class="position-relative py-4">
      <div class="text-center py-2">
        <img src="images/shop.png" class="" width="100px" alt="Tienda">
      </div>
      <div class="text-center py-2">
        <h2 class="text-white">Tienda de ropa</h2>
      </div>
    </header>
    <main class="mb-4">
      <form class="form-group container border border-2 border-light rounded w-25 p-4" style="background-color: #1DD3B0; margin-bottom: 100px" action="registerController" method="post">
        <div class="row">
          <p class="text-center fs-4">Registro</p>
        </div>
        <div class="row">
          <div class="col py-2 text-center text-white bg-danger rounded mb-4" id="errorUser">
            Error, El usuario ya existe.
          </div>
        </div>          
        <div class="row">
          <div class="col py-2">
            <input type="text" class="form-control" placeholder="Usuario" name="usuario" required aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="password" class="form-control" placeholder="Contraseña" name="pass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" required aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="password" class="form-control" placeholder="Repite Contraseña" name="rePass" aria-label="First name">
          </div>
        </div>
        <div class="row">
          <div class="col py-2 text-center text-white bg-danger rounded mb-4" id="errorPass">
            Error, Las contraseñas no coinciden.
          </div>
        </div>          
        <div class="row py-2">
          <div class="col">
            <p class="text-center fs-5">Informacion de facturación</p>
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="text" class="form-control" placeholder="Nombre" name="nombre" required aria-label="First name">
          </div>
          <div class="col">
            <input type="text" class="form-control" placeholder="Apellidos" name="apellidos" required aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="text" class="form-control" placeholder="C Postal" pattern="\d{5}" name="cPostal" required aria-label="First name">
          </div>
          <div class="col">
            <input type="text" class="form-control" placeholder="Telefono" pattern="\d{9}" name="tlf" required aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="email" class="form-control" placeholder="Correo" name="correo" required aria-label="First name">
          </div>
        </div>          
        <div class="row py-2">
          <div class="col">
            <input type="text" class="form-control" placeholder="Direccion" name="direccion" required aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col text-center">
            <input type="submit" class="btn btn-secondary" value="Registrarse">
          </div>
        </div>
        <div class="row py-2">
          <div class="col text-center">
            <p>¿Ya tienes cuenta? <a href="index.jsp" class="link-light fw-bold">Inicia Sesion</a></p>
          </div>
        </div>
      </form>
    </main>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top container-fluid bg-dark">
      <p class="col-md-4 mb-0 text-muted">© 2021 Tienda de ropa</p>

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
  </body>
</html>
