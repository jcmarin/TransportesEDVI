<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmVehiculos.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmVehiculos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row">
        <div class="col-sm-6">
            <asp:FormView ID="fvVehiculo" runat="server" Width="100%"
                DefaultMode="Edit"
                SelectMethod="GetVehiculo"
                UpdateMethod="UpdateVehiculo"
                InsertMethod="InsertVehiculo"
                ItemType="TransportesEDVI.BusinessEntities.Vehiculo" >
                <InsertItemTemplate>
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Registar Vehiculo
                            </div>
                            <div class="panel-body">
                                
                                <div class="form-group">
 
                                <div class="form-group">
                                    <label>Marca:</label>
                                    <asp:TextBox ID="txtMar" Text="<%# BindItem.Marca %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Modelo:</label>
                                    <asp:TextBox ID="txtMod" Text="<%# BindItem.Modelo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Placa Carreta:</label>
                                    <asp:TextBox ID="txtPlaCa" Text="<%# BindItem.PlacaCarreta %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Placa Vehiculo:</label>
                                    <asp:TextBox ID="txtPlaVe" Text="<%# BindItem.PlacaVehiculo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>RevicionTecnica:</label>
                                    <asp:TextBox ID="txtRevTec" Text="<%# BindItem.RevicionTecnica %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Soat:</label>
                                    <asp:TextBox ID="txtSo" Text="<%# BindItem.Soat %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Certificao Inscripcion:</label>
                                    <asp:TextBox ID="txtCeIn" Text="<%# BindItem.CestidicadoIncripcion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Configuracion Vehicular:</label>
                                    <asp:TextBox ID="txtConVe" Text="<%# BindItem.ConfiguracionVehicular %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>CargaBruta:</label>
                                    <asp:TextBox ID="txtCaB" Text="<%# BindItem.CargaBruta %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <asp:TextBox ID="txtEst" Text="<%# BindItem.Estado %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                    
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="insert" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListVehiculos.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
                            </div>
                        </div>
                        <div class="bg-danger">
                                <asp:ValidationSummary ID="vsInsert" runat="server" 
                            ShowModelStateErrors="True"/>
                            </div>
                        
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Actualizar Informacion de Vehiculo
                            </div>
                            <div class="panel-body">
                                
                                 <div class="form-group">
                                    <label>Id:</label>
                                    <asp:TextBox ID="txtId" Text="<%# BindItem.Id %>" 
                                        CssClass="form-control input-sm" Enabled="False" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Marca:</label>
                                    <asp:TextBox ID="txtMar" Text="<%# BindItem.Marca %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Modelo:</label>
                                    <asp:TextBox ID="txtMod" Text="<%# BindItem.Modelo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Placa Carreta:</label>
                                    <asp:TextBox ID="txtPlaCa" Text="<%# BindItem.PlacaCarreta %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Placa Vehiculo:</label>
                                    <asp:TextBox ID="txtPlaVe" Text="<%# BindItem.PlacaVehiculo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>RevicionTecnica:</label>
                                    <asp:TextBox ID="txtRevTec" Text="<%# BindItem.RevicionTecnica %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Soat:</label>
                                    <asp:TextBox ID="txtSo" Text="<%# BindItem.Soat %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Certificao Inscripcion:</label>
                                    <asp:TextBox ID="txtCeIn" Text="<%# BindItem.CestidicadoIncripcion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Configuracion Vehicular:</label>
                                    <asp:TextBox ID="txtConVe" Text="<%# BindItem.ConfiguracionVehicular %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>CargaBruta:</label>
                                    <asp:TextBox ID="txtCaB" Text="<%# BindItem.CargaBruta %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <asp:TextBox ID="txtEst" Text="<%# BindItem.Estado %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="update" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListVehiculos.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
                            </div>
                        </div>
                    
                        <div class="bg-danger">
                                <asp:ValidationSummary ID="vsInsert" runat="server" 
                            ShowModelStateErrors="True"/>
                            </div>

                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>
