<%
    ServletContext contexto = getServletContext();
    RequestDispatcher rd;
    HttpSession sesion = request.getSession();
    String error = (String) sesion.getAttribute("error");
    String user = (String) sesion.getAttribute("user");
    String info = (String) sesion.getAttribute("info");
    
    if (error == null)
        error = "none";
    
    if (info == null) 
        info = "none";
   
    
    if (user != null) {
        rd = contexto.getRequestDispatcher("/landing.jsp");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <title>Tienda - Login</title>
    <meta charset="UTF-8">
    <link rel="icon" href="images/shop.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style media="screen">
      #error {
        display: <%=error%>;
      }
      
      #info {
          display: <%=info%>;
      }
    </style>
  </head>
  <body style="background-color: #3C1642;">
    <header class="position-relative py-4">
      <div class="text-center py-2">
        <img src="images/shop.png" class="" width="100px" alt="Tienda">
      </div>
      <div class="text-center py-2">
        <h2 class="text-white">Tienda de ropa</h2>
      </div>
    </header>
    <main>
      <form action="LoginController" method="post" class="form-group container border border-2 border-light rounded w-25 p-4" style="background-color: #1DD3B0; margin-bottom: 100px" action="#">
        <div class="row">
          <p class="text-center fs-4">Login</p>
        </div>
        <div class="row">
          <div class="col py-2 text-center text-white bg-danger rounded mb-4" id="error">
            Error, Usuario o Contraseña incorrectos.
          </div>
        </div>
        <div class="row">
          <div class="col py-2 text-center bg-warning rounded mb-4" id="info">
            El usuario se registró correctamente.
          </div>
        </div>          
        <div class="row">
          <div class="col py-2">
            <input type="text" class="form-control" placeholder="Usuario" name="usuario" aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col">
            <input type="password" class="form-control" placeholder="Contraseña" name="pass" aria-label="First name">
          </div>
        </div>
        <div class="row py-2">
          <div class="col text-center">
            <input type="submit" class="btn btn-secondary" value="Entrar">
          </div>
        </div>
        <div class="row py-2">
          <div class="col text-center">
            <p>¿No tienes cuenta? <a href="registro.jsp" class="link-light fw-bold">Registrarse</a></p>
          </div>
        </div>
      </form>
    </main>

    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top container-fluid bg-dark" style="margin-top: 20%">
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
