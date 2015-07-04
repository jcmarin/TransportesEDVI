<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListarGastosServicio.aspx.cs" Inherits="TransportesEDVI.Web.Logistica.frmListarGastosServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="panel panel-default">
        <div class="panel-heading">
            Gastos de Servicio
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <label>Nro de Guia de Remisión:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCriterio" CssClass="form-control" Width="100%" runat="server"/>
                    </td>
                    <td>
                        <label>Fecha Inicio:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaIni" CssClass="form-control" Width="100px" runat="server"/>
                        <ajaxToolkit:CalendarExtender ID="txtFechaIni_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaIni" Format="dd/MM/yyyy">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td>
                        <label>Fecha Fin:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaFin" CssClass="form-control" Width="100px" runat="server"/>
                        <ajaxToolkit:CalendarExtender ID="txtFechaFin_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaFin" Format="dd/MM/yyyy">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td>
                        <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-success" runat="server"/>
                        <a href="frmGastosServicio.aspx?opc=nuevo" class="btn btn-info">Registrar Gasto de Servicio</a>
                    </td>
                </tr>
            </table>
        </div>
        
        <asp:ListView ID="lvPedidos" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Servicio"
            SelectMethod="GetServicios">
            <LayoutTemplate>
                <table class="table table-hover">
                    <tr>
                        <th>Nro Guia Remision</th>
                        <th>Gastos Totales</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server"/>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Item.GuiaRemision.NroGuias %></td>
                    <td><%# Item.TotalGastosServicio %></td>
                    <td><%# Item.FechaTraslado %></td>
                    <td>
                        <a href="frmGastosServicio.aspx?Id=<%# Item.Id  %>&opc=editar" >
                            Editar
                        </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
