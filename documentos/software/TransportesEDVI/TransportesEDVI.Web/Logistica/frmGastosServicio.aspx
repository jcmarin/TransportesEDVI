<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmGastosServicio.aspx.cs" Inherits="TransportesEDVI.Web.Logistica.frmGastosServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
     <div class="panel panel-primary">
        <div class="panel-heading">
            Registrar Gasto de Servicio
        </div>
        <div class="panel panel-body">
            <div class="row">
                <div class="col-lg-12">
                    <asp:HiddenField ID="hfIdPedido" runat="server"/>
                    <table class="table table-bordered">
                        <tr>
                            <td><b>Nro Guia:</b></td>
                            <td>
                                <asp:TextBox ID="txtNroGuia" runat="server" Width="252px"/>
                                <asp:Button ID="txtBuscarNroGuia" Text="..." CssClass="btn btn-default" runat="server" OnClick="txtBuscarClienteDNI_Click"/>
                                <b><asp:Label ID="lblMensajeCliente" ForeColor="red" runat="server"/></b>
                       </td>

                       <td><b>Estado del Servicio:</b></td>
                       <td>
                           <asp:TextBox id="txtEstado" runat="server" Enabled="False"/>         
                       </td>
                        </tr>
                        <tr>
                            <%--<td><b>Empleado:</b></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtEmpleado" runat="server"/>
                            </td>--%>
                        </tr>
                        <tr>
                             <td><b>Fecha:</b></td>
                            <td >
                                <asp:TextBox ID="txtFecha" runat="server" Enabled="False"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <label>Criterio</label>
                                <asp:TextBox ID="txtCriterio" runat="server"/>
                                <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-danger" runat="server"/>

                                  <%--refresh de pagina por regiones update panel--%>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                         <asp:ListView ID="lvProductos" runat="server"
                                    ItemType="TransportesEDVI.BusinessEntities.GastosDeServicio"
                                    SelectMethod="GetGastos" OnItemCommand="lvProductos_ItemCommand" OnSelectedIndexChanged="lvProductos_SelectedIndexChanged">
                                    <LayoutTemplate>
                                        <table class="table table-hover">
                                            <thead>
                                                <th>Descripcion</th>
                                                <th>Precio</th>
                                                <th>Acciones</th>
                                            </thead>
                                            <tbody>
                                                <tr id="itemPlaceholder" runat="server"/>
                                            </tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Item.Descripcion %></td>
                                            <td><%# Item.Precio %></td>
                                            <td>
                                                <asp:Button ID="btnAgregar"
                                                     CommandName="addProducto" 
                                                     CommandArgument="<%# Item.Id %>"
                                                     Text="Agregar"
                                                     CssClass="btn btn-default"
                                                     runat="server"/>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="3"><b>No hay resultado que mostar..</b></td>
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
                                <asp:UpdatePanel ID="upItemsPedido" runat="server">
                                    <ContentTemplate>
                                        <asp:ListView ID="lvDetallePedido" runat="server" OnItemCommand="lvDetallePedido_ItemCommand">
                                    <LayoutTemplate>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Descripcion</th>
                                                    <th>Observaciones</th>
                                                    <th>Cantidad</th>
                                                    <th>Precio</th>
                                                    <th>Monto</th>
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
                                                           Text="Actualizar items Pedido"
                                                           CommandName="updateItems"
                                                           CssClass="btn btn-info"/> 
                                                    </td>
                                                    <td><b>Total S/.</b></td>
                                                    <td><b><asp:Label ID="lblTotal" runat="server"/></b></td>

                                                </tr>
                                            </tfoot>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                               <%# Eval("GastosDeServicio.Descripcion") %> 
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtObservaciones" Text="<%# Bind('Observaciones') %>" runat="server"/>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCantidad" Text="<%# Bind('Cantidad') %>" Width="50px" runat="server"/>
                                            </td>
                                            <td>
                                                <%# Eval("Costo") %> 
                                            </td>
                                             <td>
                                                <%# Eval("Total") %> 
                                            </td>
                                            <td>
                                                <asp:Button ID="btnQuitarDetalle" runat="server"
                                                            Text="Quitar"
                                                            CommandName="QuitarDetalle"
                                                            CommandArgument='<%# Eval("IdGastosServicio") %>'
                                                            CssClass="btn btn-danger"/>
                                            </td>
                                          </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                    </ContentTemplate>
                                 <%--agregar disparador de eventos--%>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="lvProductos" EventName="ItemCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="lvDetallePedido" EventName="ItemCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="btn btn-danger" runat="server"/>
        </div>
    </div>

</asp:Content>
