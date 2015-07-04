<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListFacturas.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmListFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
 <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Facturas</h3>
                </div>
                <div class="col-sm-3">                    
                    <a href="frmFacturas.aspx?accion=nuevo"  class="btn btn-success" style="margin: auto; color: #ffffff;">
                        Crear Facturas </a>
                </div>
            </div>
        </div>
        <div class="panel-body">
             <label class="control-label">Criterio:</label>
             <asp:TextBox ID="txtCriterio" runat="server"/>
             <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary" runat="server"/>
        </div>
        <asp:ListView ID="lvFacturas" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Factura"
            SelectMethod="GetFacturas">
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nro Factura</th>
                            <th>Serie</th>
                            <th>Estado</th>
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
                    <td><%# Item.NroFactura %></td>
                    <td><%# Item.Serie %></td>
                    <td><%# Item.Estado %></td>
                    <td>
                        <a href="frmFacturas.aspx?id=<%#Item.Id %>">Editar</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
