<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmClientes.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-sm-6">
            <asp:FormView ID="fvCliente" runat="server" Width="100%"
                DefaultMode="Edit"
                SelectMethod="GetCliente"
                UpdateMethod="UpdateCliente"
                InsertMethod="InsertCliente"
                ItemType="TransportesEDVI.BusinessEntities.Cliente">
                <InsertItemTemplate>
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Registar Cliente
                            </div>
                            <div class="panel-body">
                                
                                <div class="form-group">
                                    <label>Ruc:</label>
                                    <asp:TextBox ID="txtRuc" Text="<%# BindItem.Ruc %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>RazonSocial:</label>
                                    <asp:TextBox ID="txtRazSocial" Text="<%# BindItem.RazonSocial %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion:</label>
                                    <asp:TextBox ID="txtDir" Text="<%# BindItem.Direccion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono:</label>
                                    <asp:TextBox ID="txtTelf" Text="<%# BindItem.Telefono %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="insert" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListClientes.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
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
                                Actualizar Informacion de Cliente
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Id:</label>
                                    <asp:TextBox ID="txtId" Text="<%# BindItem.Id %>" 
                                        CssClass="form-control input-sm" Enabled="False" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Ruc:</label>
                                    <asp:TextBox ID="txtRuc" Text="<%# BindItem.Ruc %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>RazonSocial:</label>
                                    <asp:TextBox ID="TextRazSocial" Text="<%# BindItem.RazonSocial %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion:</label>
                                    <asp:TextBox ID="TtxtDir" Text="<%# BindItem.Direccion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono:</label>
                                    <asp:TextBox ID="txtTelf" Text="<%# BindItem.Telefono %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                            
                               
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="update" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListClientes.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
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
