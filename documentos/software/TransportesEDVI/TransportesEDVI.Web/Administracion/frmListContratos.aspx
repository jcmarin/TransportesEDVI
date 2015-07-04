<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="frmListContratos.aspx.cs" Inherits="TransportesEDVI.Web.Administracion.frmListContratos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
  </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-9">
                   <h3> Contratos</h3>
                </div>
                <div class="col-sm-3">
                     <a href="frmContrato.aspx?opc=nuevo" class="btn btn-info">Registar Contrato</a>                    
                 </div>
            </div>
        </div>
        <div class="panel-body">
             <table>
                <tr>
                    <td>
                        <label>Criterio:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCriterio" CssClass="form-control" Width="100%" runat="server"/>
                    </td>
                    <td>
                        <label>Fecha Inicio:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaIni" CssClass="form-control" Width="100px" runat="server"/>
                        <ajaxToolkit:CalendarExtender ID="txtFechaIni_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaIni">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td>
                        <label>Fecha Fin:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFechaFin" CssClass="form-control" Width="100px" runat="server"/>
                        <ajaxToolkit:CalendarExtender ID="txtFechaFin_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaFin">
                        </ajaxToolkit:CalendarExtender>
                    </td>
                    <td>
                        <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-success" runat="server"/>
                       
                    </td>
                </tr>
            </table>
        </div>
        <asp:ListView ID="lvRepartidores" runat="server"
            ItemType="TransportesEDVI.BusinessEntities.Contrato"
            SelectMethod="GetContratos"
            >
            <LayoutTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>FechaIni</th>
                            <th>FechaFin</th>
                            <th>Empresa</th>
                            <th>Numero</th>
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
                    <td><%# Item.FechIniContrato %></td>
                    <td><%# Item.FechFinContrato %></td>
                    <td><%# Item.Cliente%></td>
                     <td><%# Item.Numero %></td>
                    <td>
                        <a href="frmContrato.aspx?id=<%#Item.Id %>">Editar</a>
                         | <a href="frmContrato.aspx?accion=delete&id=<%#Item.Id %>"
                            onclick="return confirm('Desea Elininar a: <%# Item.Numero %>');" >
                               Eliminar
                           </a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
   
</asp:Content>