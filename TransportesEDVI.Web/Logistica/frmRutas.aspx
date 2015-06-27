<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRutas.aspx.cs" Inherits="TransportesEDVI.Web.Logistica.frmRutas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-sm-6">
            <asp:FormView ID="fvRuta" runat="server" Width="100%"
                DefaultMode="Edit"
                SelectMethod="GetRuta"
                UpdateMethod="UpdateRuta"
                InsertMethod="InsertRuta"
                ItemType="TransportesEDVI.BusinessEntities.Ruta">
                <InsertItemTemplate>
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Registar Ruta
                            </div>
                            <div class="panel-body">
                            <div class="form-group">
                                    <label>Origen:</label>
                                    <asp:TextBox ID="txtOri" Text="<%# BindItem.Origen %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Destino:</label>
                                    <asp:TextBox ID="txtDest" Text="<%# BindItem.Destino %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Distacia:</label>
                                    <asp:TextBox ID="txtDis" Text="<%# BindItem.Distancia %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Descripcion:</label>
                                    <asp:TextBox ID="txtDes" Text="<%# BindItem.Descripcion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="insert" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListRutas.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
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
                                Actualizar Informacion de Ruta
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>ID:</label>
                                    <asp:TextBox ID="txtId" Text="<%# BindItem.Id %>" 
                                        CssClass="form-control input-sm" Enabled="False" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Origen:</label>
                                    <asp:TextBox ID="txtOri" Text="<%# BindItem.Origen %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Destino:</label>
                                    <asp:TextBox ID="txtDest" Text="<%# BindItem.Destino %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Distacia:</label>
                                    <asp:TextBox ID="txtDis" Text="<%# BindItem.Distancia %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Descripcion:</label>
                                    <asp:TextBox ID="txtDes" Text="<%# BindItem.Descripcion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                               
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnGuardar" CommandName="update" CssClass="btn btn-success" Text="Guardar" runat="server"/>
                                <a href="frmListRutas.aspx" class="btn btn-danger" style="color:#ffffff;"> Cancelar</a>
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
