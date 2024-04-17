<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" 
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" 
                crossorigin="anonymous">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Habla Luisa</title>
    </head>
    <body>
        <%
            // ingresar sus datos para conexion a su base de datos
            String driver = "com.mysql.cj.jdbc.Driver";
            String username = "root"; // por defecto normalmente es "root"
            String password = ""; // la asignada para ingresar a su db
            String hostname = "localhost"; // por defecto normalmente es "localhost" o "127.0.0.1"
            String port = "3306"; // por defecto normalmente es "3306"
            String database = "hlf"; // el el archivo Script_db_hlf.sql está el codigo para que lo ejecute
            String url = "jdbc:mysql://" + hostname + ":" + port + "/" + database;

            Connection conn;
            Statement statement;
            ResultSet rs;

            HttpSession sesion = request.getSession();
        %>
        <header>
            <div class="container mt-2 nav justify-content-center">
                <div class="d-grid gap-2 d-md-block mt-3">
                    <button class="btn btn-outline-primary border-0 text-dark" 
                            name="btnIniciar"
                            onclick="irInicicarSesion()"
                            type="button" 
                            onmouseover="this.classList.remove('text-dark'); this.classList.add('text-white')" 
                            onmouseout="this.classList.remove('text-white'); this.classList.add('text-dark')">Iniciar Sesión</button>
                    <button class="btn btn-outline-primary border-0 text-dark" 
                            name="btnRegistrar"
                            onclick="irARegistro()"
                            type="button" 
                            onmouseover="this.classList.remove('text-dark'); this.classList.add('text-white')" 
                            onmouseout="this.classList.remove('text-white'); this.classList.add('text-dark')">Registrarse</button>
                    <button class="btn btn-outline-primary border-0 text-dark" 
                            name="btnNosotros"
                            onclick="irNosotros()"
                            type="button" 
                            onmouseover="this.classList.remove('text-dark'); this.classList.add('text-white')" 
                            onmouseout="this.classList.remove('text-white'); this.classList.add('text-dark')">Sobre Nosotros</button>
                    <button class="btn btn-outline-primary border-0 text-dark" 
                            name="btnServicios"
                            onclick="irServicios()"
                            type="button" 
                            onmouseover="this.classList.remove('text-dark'); this.classList.add('text-white')" 
                            onmouseout="this.classList.remove('text-white'); this.classList.add('text-dark')">Nuestros Servicios</button>
                </div>
            </div>
            <script>
                function irIniciarSesion() {
                    window.location.href = 'indexpb.jsp';
                }
                function irARegistro() {
                    window.location.href = 'RecoverPassword';
                }
                function irNosotros() {
                    window.location.href = 'RecoverPassword';
                }
                function irServicios() {
                    window.location.href = 'RecoverPassword';
                }
            </script>
        </header>
        <div class="container mt-5">
            <div class="d-grid gap-2 col-6 mx-auto mb-3 text-center">
                <h3><strong>Iniciar Sesión</strong></h3>
            </div>
            <form method="post">
                <div class="d-grid gap-0 col-3 mx-auto mb-3">
                    <label for="exampleInputEmail1" class="form-label">Correo electrónico</label>
                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="d-grid gap-0 col-3 mx-auto mb-4">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <input type="password" name="pass" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="d-grid gap-0 col-3 mx-auto mb-3">
                    <button type="button" name="linkRecover" class="btn btn-link"
                            onclick="window.location.href='RecoverPassword'">¿Olvidaste tu contraseña?</button>
                </div>
                <div class="d-grid gap-0 col-3 mx-auto mb-3">
                    <button type="submit" name="btnLogin" class="btn btn-primary">Ingresar</button>
                </div>                
            </form>
        </div>
        <%      
            if (request.getParameter("btnLogin") != null) {
                String getEmail = request.getParameter("email");
                String getPass = request.getParameter("pass");
                try {
                    Class.forName(driver);
                    conn = DriverManager.getConnection(url, username, password);
                    statement = conn.createStatement();
                    rs = statement.executeQuery("select * from usuarios where email = '" + getEmail + "' and password = '" + getPass + "'");
                    while (rs.next()) {
                        sesion.setAttribute("logueado", "1");
                        sesion.setAttribute("email", rs.getString("email"));
                        sesion.setAttribute("pass", rs.getString("password"));
                        sesion.setAttribute("id", rs.getString("id"));
                        // para redireccionar al ser logueado
                        response.sendRedirect("RecibeDatos");
                    }
        %>
        <div class="container mt-4 d-grid col-5 mx-auto text-center">
            <%out.print("<div class=\"alert alert-danger\" role=\"alert\">Correo o contraseña erroneos</div>");%>
        </div>
        <%
                } catch (SQLException ex) {
                    System.err.println("Error, " + ex);
                }
            }
        %>             
    </body>
</html>
