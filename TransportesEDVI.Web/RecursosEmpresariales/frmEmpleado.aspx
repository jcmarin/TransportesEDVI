<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEmpleado.aspx.cs" Inherits="TransportesEDVI.Web.RecursosEmpresariales.frmEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row">
        <div class="col-sm-6">
            <asp:FormView ID="fvEmpleado" runat="server" Width="100%"
                DefaultMode="Edit"
                SelectMethod="GetEmpleado"
                UpdateMethod="UpdateEmpleado"
                InsertMethod="InsertEmpleado"
                ItemType="TransportesEDVI.BusinessEntities.Empleado">
                <InsertItemTemplate>
                    <div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Registar Empleado
                            </div>
                            <div class="panel-body">
                                
                                <div class="form-group">
                                    <label>Id:</label>
                                    <asp:TextBox ID="TextBox2" Text="<%# BindItem.Id %>" 
                                        CssClass="form-control input-sm" runat="server" Enabled="False"/>
                                </div>
                                <div class="form-group">
                                    <label>DNI:</label>
                                    <asp:TextBox ID="txtNombres" Text="<%# BindItem.Dni %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Nombres:</label>
                                    <asp:TextBox ID="TextBox1" Text="<%# BindItem.Nombres %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Ap. Paterno:</label>
                                    <asp:TextBox ID="TextBox11" Text="<%# BindItem.ApPaterno %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Ap. Materno:</label>
                                    <asp:TextBox ID="TextBox12" Text="<%# BindItem.ApMaterno %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion:</label>
                                    <asp:TextBox ID="TextBox3" Text="<%# BindItem.Direccion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono:</label>
                                    <asp:TextBox ID="TextBox5" Text="<%# BindItem.Telefono %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Categoria:</label>
                                    <asp:TextBox ID="TextBox4" Text="<%# BindItem.Categoria %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Sueldo:</label>
                                    <asp:TextBox ID="TextBox6" Text="<%# BindItem.Sueldo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Nro. Carnet:</label>
                                    <asp:TextBox ID="TextBox7" Text="<%# BindItem.NrCarnet %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Lisencia:</label>
                                    <asp:TextBox ID="TextBox8" Text="<%# BindItem.Licencia %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <asp:TextBox ID="TextBox9" Text="<%# BindItem.Estado %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>GuiaRemision:</label>
                                    <asp:TextBox ID="TextBox10" Text="<%# BindItem.GuiaRemisionId %>" 
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
                                Actualizar Informacion de Empleado
                            </div>
                            <div class="panel-body">
                                 <div class="form-group">
                                    <label>Id:</label>
                                    <asp:TextBox ID="TextBox2" Text="<%# BindItem.Id %>" 
                                        CssClass="form-control input-sm" runat="server" Enabled="False"/>
                                 </div>
                                 <div class="form-group">
                                    <label>DNI:</label>
                                    <asp:TextBox ID="txtNombres" Text="<%# BindItem.Dni %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Nombres:</label>
                                    <asp:TextBox ID="TextBox1" Text="<%# BindItem.Nombres %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Ap. Paterno:</label>
                                    <asp:TextBox ID="TextBox11" Text="<%# BindItem.ApPaterno %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Ap. Materno:</label>
                                    <asp:TextBox ID="TextBox12" Text="<%# BindItem.ApMaterno %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion:</label>
                                    <asp:TextBox ID="TextBox3" Text="<%# BindItem.Direccion %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono:</label>
                                    <asp:TextBox ID="TextBox5" Text="<%# BindItem.Telefono %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Categoria:</label>
                                    <asp:TextBox ID="TextBox4" Text="<%# BindItem.Categoria %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Sueldo:</label>
                                    <asp:TextBox ID="TextBox6" Text="<%# BindItem.Sueldo %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Nro. Carnet:</label>
                                    <asp:TextBox ID="TextBox7" Text="<%# BindItem.NrCarnet %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Lisencia:</label>
                                    <asp:TextBox ID="TextBox8" Text="<%# BindItem.Licencia %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>Estado:</label>
                                    <asp:TextBox ID="TextBox9" Text="<%# BindItem.Estado %>" 
                                        CssClass="form-control input-sm" runat="server"/>
                                </div>
                                <div class="form-group">
                                    <label>GuiaRemision:</label>
                                    <asp:TextBox ID="TextBox10" Text="<%# BindItem.GuiaRemisionId %>" 
                                        CssClass="form-control input-sm" runat="server" />
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

