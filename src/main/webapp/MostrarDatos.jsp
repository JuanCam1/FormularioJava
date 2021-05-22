<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/mostrarDatos.css">
<title>Lista de Libros</title>
</head>
<body>
<% 
Connection conexion=null;
Statement  sentencia=null;
ResultSet rs=null;
try  {
	
	
	Class.forName("com.mysql.jdbc.Driver");

	conexion = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/formulario_netbeans", "root",
				"");
	 sentencia= conexion.createStatement();

	 String consultaSQL=  "select Nombre,Apellido,Fecha_nacimiento,sexo,Email,Semestre,Universidad,Carrera,Sugerencias,Opcion1,Opcion2 from netbeans";

	 rs=sentencia.executeQuery(consultaSQL);
	 
	 while(rs.next()) { %>
		
		<table class="default">
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Fecha_nacimiento</th>
				<th>Sexo</th>
				<th>Email</th>
				<th>Semestre</th>
				<th>Universidad</th>
				<th>Carrera</th>
				<th>Sugerencia</th>
				<th>Opcion1</th>
				<th>Opcion2</th>
			</tr>
		  
			<tr>
				<td><%=rs.getString("Nombre")%></td>
				<td><%=rs.getString("Apellido")%></td>
				<td><%=rs.getString("Fecha_nacimiento")%></td>
				<td><%=rs.getString("Sexo")%></td>
				<td><%=rs.getString("Email")%></td>
				<td><%=rs.getString("Semestre")%></td>
				<td><%=rs.getString("Universidad")%></td>
				<td><%=rs.getString("Carrera")%></td>
				<td><%=rs.getString("Sugerencias")%></td>
				<td><%=rs.getString("Opcion1")%></td>
				<td><%=rs.getString("Opcion2")%></td>
			</tr>
		</table>
		<br>
	<% }

}catch (ClassNotFoundException e) {
	
	System.out.println("Error en la carga del driver" 
						+ e.getMessage());
	
}catch (SQLException e) {
	
	System.out.println("Error accediendo a la base de datos" 
						+ e.getMessage());
	
}
 finally {
	

	if (rs != null) {

		try {rs.close();} catch (SQLException e)
		{System.out.println("Error cerrando el resultset" + e.getMessage());}
		
	}
	
	if (sentencia != null) {

		try {sentencia.close();} catch (SQLException e) 
		{System.out.println("Error cerrando la sentencia" + e.getMessage());}
		
	}
	if (conexion != null) {

		try {conexion.close();} catch (SQLException e) 
		{System.out.println("Error cerrando la conexion" + e.getMessage());}
	}
 }
%>
<a href="index.html">
	<input type="submit" value="Insertar Datos">
</a>
</body>
</html>