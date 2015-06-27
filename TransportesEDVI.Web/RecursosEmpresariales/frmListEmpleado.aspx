<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListEmpleado.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmListEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Empleados</h3>
                </div>
                <div class="col-sm-3">                    
                    <a href="frmEmpleado.aspx?accion=nuevo"  class="btn btn-success" style="margin: auto; color: #ffffff;">
                        Crear Empleado </a>
                </div>
            </div>
        </div>
        <div class="panel-body">
             <label class="control-label">DNI:</label>
             <asp:TextBox ID="txtCriterio" runat="server"/>
             <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" runat="server"/>
        </div>
        <asp:ListView ID="lvEmpleado" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Empleado"
            SelectMethod="GetEmpleados">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>DNI</th>
                            <th>Nombres</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Categoria</th>
                            <th>Sueldo</th>
                            <th>Nro. Carnet</th>
                            <th>Lisencia</th>
                            <th>Estado</th>
                            <th>GuiaRemision</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server"/>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.Dni %></td>
                    <td><%# Item.ApPaterno + " "+Item.ApMaterno+" "+Item.Nombres %></td>
                    <td><%# Item.Direccion %></td>
                    <td><%# Item.Telefono %></td>
                    <td><%# Item.Categoria %></td>
                    <td><%# Item.Sueldo %></td>
                    <td><%# Item.NrCarnet %></td>
                    <td><%# Item.Licencia %></td>
                    <td><%# Item.Estado %></td>
                    <td><%# Item.GuiaRemisionId %></td>
                    <td>
                        <a href="frmEmpleado.aspx?id=<%#Item.Id %>">Editar</a>
                         | <a href="frmEmpleado.aspx?accion=delete&id=<%#Item.Id %>"
                            onclick="return confirm('Desea Elininar a: <%# Item.Dni %>');" >
                               Eliminar
                           </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div> 
</asp:Content>