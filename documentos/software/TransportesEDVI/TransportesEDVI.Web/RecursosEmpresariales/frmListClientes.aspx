<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListClientes.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmListClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Clientes</h3>
                </div>
                <div class="col-sm-3">                    
                    <a href="frmClientes.aspx?accion=nuevo"  class="btn btn-success" style="margin: auto; color: #ffffff;">
                        Crear Cliente </a>
                </div>
            </div>
        </div>
        <div class="panel-body">
             <label class="control-label">Criterio:</label>
             <asp:TextBox ID="txtCriterio" runat="server" />
             <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" runat="server" />
        </div>
        <asp:ListView ID="lvClientes" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Cliente"
            SelectMethod="GetClientes">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ruc</th>
                            <th>Razon Social</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
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
                    <td><%# Item.Id %></td>
                    <td><%# Item.Ruc %></td>
                    <td><%# Item.RazonSocial %></td>
                    <td><%# Item.Telefono %></td>
                    <td><%# Item.Direccion %></td>
                    <td>
                        <a href="frmClientes.aspx?id=<%#Item.Id %>">Editar</a>
                         | <a href="frmClientes.aspx?accion=delete&id=<%#Item.Id %>"
                            onclick="return confirm('Desea Elininar a: <%# Item.Ruc %>');" >
                               Eliminar
                           </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
