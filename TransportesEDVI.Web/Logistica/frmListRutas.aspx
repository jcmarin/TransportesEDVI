<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListRutas.aspx.cs" Inherits="TransportesEDVI.Web.Logistica.frmListRutas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Rutas</h3>
                </div>
                <div class="col-sm-3">                    
                    <a href="frmRutas.aspx?accion=nuevo"  class="btn btn-success" style="margin: auto; color: #ffffff;">
                        Crear Rutas </a>
                </div>
            </div>
        </div>
        <div class="panel-body">
             <label class="control-label">Criterio:</label>
             <asp:TextBox ID="txtCriterio" runat="server"/>
             <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" runat="server"/>
        </div>
        <asp:ListView ID="lvRepartidores" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Ruta"
            SelectMethod="GetRutas">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Origen</th>
                            <th>Destino</th>
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
                    <td><%# Item.Origen %></td>
                    <td><%# Item.Destino %></td>
                    <td>
                        <a href="frmRutas.aspx?id=<%#Item.Id %>">Editar</a>
                         | <a href="frmRutas.aspx?accion=delete&id=<%#Item.Id %>"
                            onclick="return confirm('Desea Elininar a: <%# Item.Origen %>');" >
                               Eliminar
                           </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
