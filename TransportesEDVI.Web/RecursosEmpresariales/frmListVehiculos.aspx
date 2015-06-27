<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListVehiculos.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmListVehiculos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Vehiculos</h3>
                </div>
                <div class="col-sm-3">                    
                    <a href="frmVehiculos.aspx?accion=nuevo"  class="btn btn-success" style="margin: auto; color: #ffffff;">
                        Crear Vehiculo </a>
                </div>
            </div>
        </div>
        <div class="panel-body">
             <label class="control-label">Criterio:</label>
             <asp:TextBox ID="txtCriterio" runat="server"/>
             <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" runat="server"/>
        </div>
        <asp:ListView ID="lvVehiculos" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Vehiculo"
            SelectMethod="GetVehiculos">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Placa Vehiculo</th>
                            <th>Placa Carreta</th>
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
                    <td><%# Item.Marca %></td>
                    <td><%# Item.Modelo %></td>
                    <td><%# Item.PlacaVehiculo %></td>
                    <td><%# Item.PlacaCarreta %></td>
                    <td>
                        <a href="frmVehiculos.aspx?id=<%#Item.Id %>">Editar</a>
                         | <a href="frmVehiculos.aspx?accion=delete&id=<%#Item.Id %>"
                            onclick="return confirm('Desea Elininar a: <%# Item.PlacaVehiculo %>');" >
                               Eliminar
                           </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
