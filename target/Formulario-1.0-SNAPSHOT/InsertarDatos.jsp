<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.mysql.jdbc.Driver"%>


<%
	
// recojo los datos del formulario 
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String fechanac = request.getParameter("fechanac");
String sexo = request.getParameter("sexo");
String email = request.getParameter("email");
String semestre = request.getParameter("semestre");
String universidad = request.getParameter("universidad");
String carrera = request.getParameter("carrera");
String sugerencia = request.getParameter("texto");
String opcion1=null;
opcion1=request.getParameter("opcion1");
String opcion2=null;
opcion2 = request.getParameter("opcion2");

Connection conexion = null;
Statement sentencia = null;

int filas=0;
try {

    Class.forName("com.mysql.jdbc.Driver");

    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/formulario_netbeans", "root","");

    sentencia = conexion.createStatement();

    String consultaSQL = "insert into netbeans (Nombre,Apellido,Fecha_nacimiento,Sexo,Email,Semestre,Universidad,Carrera,Sugerencias,Opcion1,Opcion2) values ";
    consultaSQL += "('" + nombre + "','" + apellido + "','" + fechanac + "','" + sexo + "','" + email + "','" + semestre +"','" + universidad +"','" + carrera +"','" + sugerencia +"','" + opcion1 +"','" + opcion2 + "')";

     filas = sentencia.executeUpdate(consultaSQL);

     response.sendRedirect("MostrarDatos.jsp");

} catch (ClassNotFoundException e) {

        System.out.println("Error en la carga del driver "+ e.getMessage());

} catch (SQLException e) {

        System.out.println("Error accediendo a la base de datos "+ e.getMessage());

} finally {

        if (sentencia != null) {

            try {sentencia.close();} 
            catch (SQLException e) 
            {System.out.println("Error cerrando la sentencia " +e.getMessage());}

        }
        if (conexion != null) {

            try {conexion.close();}
            catch (SQLException e) 
            {System.out.println("Error cerrando la conexion " +e.getMessage());}
        }
}
%>

