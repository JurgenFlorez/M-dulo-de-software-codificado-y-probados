package servelets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RecibeDatos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String msg)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RecoverPassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + msg + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response, "Bienvenido, se realizo la conexion con la base de datos");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response, "Bienvenido, se realizó la conexión con la base de datos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
