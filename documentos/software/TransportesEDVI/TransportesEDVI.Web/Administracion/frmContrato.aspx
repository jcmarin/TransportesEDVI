<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmContrato.aspx.cs" Inherits="TransportesEDVI.Web.Administracion.frmContrato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   
      <div class="panel panel-primary">
        <div class="panel-heading">
            Registrar Contrato
        </div>
        <div class="panel panel-body">
            <div class="row">
                <div class="col-lg-12">
             
                    <table class="table table-bordered">
                          <tr>
                              <td><b>RUC:</b></td>
                            <td>
                                <asp:TextBox ID="txtRUC" runat="server" Width="252px"/>
                                <asp:Button ID="txtBuscarCliente" Text="..." CssClass="btn btn-default" runat="server" OnClick="txtBuscarCliente_Click" />
                                <b><asp:Label ID="lblMensajeCliente" ForeColor="red" runat="server"/></b>
                            </td>
                           </tr>
                        <tr>
                            <td><b>Razon Social:</b></td>
                            <td >
                                <asp:TextBox ID="txtRazon" runat="server" ReadOnly="true" />
                            </td>
                            <td><b>Numero:</b></td>
                            <td>
                                <asp:TextBox ID="TextNumero" runat="server" ReadOnly="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Fecha Ini:</b></td>
                            <td >
                                <asp:TextBox ID="txtFechaIni" runat="server"/>
                            </td>
                            <td><b>Fecha Fin:</b></td>
                            <td>
                                <asp:TextBox ID="txtFechaFin" runat="server"/>
                            </td>
                        </tr>

                      <tr>
                            <td colspan="4">
                                <label>Criterio Rutas</label>
                                <asp:TextBox ID="txtCriterio" runat="server"/>
                                <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-danger" runat="server"/>

                                  <%--refresh de pagina por regiones update panel--%>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                         <asp:ListView ID="lvContratos" runat="server"
                                    ItemType="TransportesEDVI.BusinessEntities.Ruta"
                                    SelectMethod="GetRutas" OnItemCommand="lvContratos_OnItemCommand">
                                    <LayoutTemplate>
                                        <table class="table table-hover">
                                            <thead>
                                                <th>ID</th>
                                                <th>Origen</th>
                                                <th>Destino</th>
                                                <th>Distancia</th>
                                                <th>Acciones</th>
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
                                             <td><%# Item.Distancia %></td>
                                            <td>
                                                <asp:Button ID="btnAgregar"
                                                     CommandName="addRuta" 
                                                     CommandArgument="<%# Item.Id %>"
                                                     Text="Agregar"
                                                     CssClass="btn btn-default"
                                                     runat="server"/>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="3"><b>No hay datos que mostar...</b></td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                                    </ContentTemplate>
                                  <%--agregar disparador de eventos--%>
                                    <Triggers>
                                       <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click"/> 
                                    </Triggers>
                                 </asp:UpdatePanel>
                                </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <%--refresh de pagina por regiones update panel--%>
                                <asp:UpdatePanel ID="upItemsContrato" runat="server">
                                    <ContentTemplate>
                                        <asp:ListView ID="lvDetalleContrato" runat="server" 
                                            ItemType="TransportesEDVI.BusinessEntities.DetalleContrato"
                                            OnItemCommand="lvDetalleContrato_OnItemCommand">
                                    <LayoutTemplate>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Ruta</th>
                                                    <th>MontoXTonelada</th>
                                                     <th>Total</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="itemPlaceholder" runat="server"/>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3">
                                                       <asp:Button ID="btnActualizarItems"  runat="server"
                                                           Text="Actualizar Items Contrato"
                                                           CommandName="updateItems"
                                                           CssClass="btn btn-info"/> 
                                                    </td>
                                                    

                                                </tr>
                                            </tfoot>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                               <%# Item.ContratoId%> 
                                            </td>
                                          <td>
                                                <%# Item.RutaId%>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnQuitarDetalle" runat="server"
                                                            Text="Quitar"
                                                            CommandName="QuitarDetalle"
                                                            CommandArgument='<%# Eval("contratoId") %>'
                                                            CssClass="btn btn-danger"/>
                                            </td>
                                          </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                    </ContentTemplate>
                                 <%--agregar disparador de eventos--%>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="lvContratos" EventName="ItemCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="lvDetalleContrato" EventName="ItemCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>


                    </table>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardar_Click"/>
            <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="btn btn-danger" runat="server"/>
        </div>
    </div>
</asp:Content>

