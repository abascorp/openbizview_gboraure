<!-- 
     Copyright (C) 2011 - 2016  DVCONSULTORES

    Este programa es software libre: usted puede redistribuirlo y/o modificarlo 
    bajo los t�rminos de la Licencia P�blica General GNU publicada 
    por la Fundaci�n para el Software Libre, ya sea la versi�n 3 
    de la Licencia, o (a su elecci�n) cualquier versi�n posterior.

    Este programa se distribuye con la esperanza de que sea �til, pero 
    SIN GARANT�A ALGUNA; ni siquiera la garant�a impl�cita 
    MERCANTIL o de APTITUD PARA UN PROP�SITO DETERMINADO. 
    Consulte los detalles de la Licencia P�blica General GNU para obtener 
    una informaci�n m�s detallada. 

    Deber�a haber recibido una copia de la Licencia P�blica General GNU 
    junto a este programa. 
    En caso contrario, consulte <http://www.gnu.org/licenses/>.
 -->
<%@ page session="true" language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/birt.tld" prefix="birt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-----------------------------------------------------------------------------
    Expected java beans
-----------------------------------------------------------------------------%>

<%-------------------------------------------------------------------------------------------
  Define variables de session.
--------------------------------------------------------------------------------------------%>
<%
boolean sesion = false;
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	sesion = false;
response.sendRedirect("/openbizview/login.xhtml");

}//Fin valida que usuario no sea nulo
%>
<html>
    <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
        <jsp:useBean id="log" class="org.openbizview.util.LogReportesImpresos" scope="session"/>
        <title></title>
    </head>
    <body>

       <%   
       //El viejo jsp me ayud� a insertar el log, ya que por la p�gina xhtml, cuando el datatable es lazy nada que ver
       //Ni idea porqu� no deja. 01/09/2014      
   
        // Recoge par�metros para pasar a reportes BIRT
       String rep= null;
       String captura = request.getParameter("reporte");
       String replog = request.getParameter("replog");
       String usuario = request.getParameter("usuario");
       String descripcion = request.getParameter("descripcion");
       String hora = request.getParameter("hora");
       String rol = request.getParameter("rol");
       String instancia = request.getParameter("instancia");
        if (captura!=null){
         rep =  captura;
        }
      
       log.insertBvt006(replog, descripcion,  usuario, hora, instancia);
        %>
        <birt:viewer id='birtViewer' reportDesign= "<%=rep%>"  isHostPage="true">
            <birt:param  name="ROL" value="<%=rol%>"  ></birt:param>
            <birt:param  name="USUARIO" value="<%=usuario%>"  ></birt:param>
            <birt:param  name="INSTANCIA" value="<%=instancia%>"  ></birt:param>
        </birt:viewer>
    </body>
</html>
