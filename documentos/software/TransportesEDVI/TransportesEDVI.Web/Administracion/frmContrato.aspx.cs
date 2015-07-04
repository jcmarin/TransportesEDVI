using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.Administracion;
using TransportesEDVI.Service.Logistica;
using TransportesEDVI.Service.RecursosEmpresariales;
using System.Web.ModelBinding;

namespace TransportesEDVI.Web.Administracion
{
    public partial class frmContrato : System.Web.UI.Page
    {

    #region "Dependencias"
        [Dependency]
        public IRutaService RutaService { get; set; }

        [Dependency]
        public IClienteService ClienteService { get; set; }

        [Dependency]
        public IContratoService ContratoService { get; set; }

    #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            var idContrato = Request.QueryString["idContrato"];
            var opc = Request.QueryString["opc"];

            //me sacas los datos solo la primera ves por URL
            if (!Page.IsPostBack)
            {
                if (idContrato != null && opc.Equals("editar"))
                {
                    //preguntar si es editar o nuevo
                    ViewState["opc"] = "editar";

                    var id = Int32.Parse(idContrato);

                    var contrato = ContratoService.GetContratoById(id);

                    //Que no se edite por URL
                    //if (contrato.Estado != "E")
                    //    Response.Redirect("frmListContratos.aspx");

                    // trabajar con cache nombre a recuperar e insertar  
                    Cache.Insert("contrato", contrato);

                    //refactorizado
                    BindContrato(contrato);

                }
                else if (opc != null && opc.Equals("nuevo"))
                {
                    ViewState["opc"] = "nuevo";

                    var contrato = new Contrato();

                    BindContrato(contrato);

                    Cache.Insert("contrato", contrato);

                }
            }  
        }

        private void BindContrato(Contrato contrato)
        {

          
            if (contrato.Cliente != null)
            {
                txtRazon.Text = contrato.Cliente.RazonSocial;
            }

            txtFechaIni.Text = contrato.FechIniContrato.ToShortDateString();
            txtFechaFin.Text = contrato.FechFinContrato.ToShortDateString();
           
        }

        public IEnumerable<Ruta> GetRutas([Control("txtCriterio")]string criterio)
        {
            return RutaService.GetRutaByCriterio(criterio);
        }

        protected void txtBuscarCliente_Click(object sender, EventArgs e)
        {
            var ruc = txtRUC.Text;

            var cliente = ClienteService.getFromClienteByRuc(ruc);

            
            if (cliente != null && cliente.Ruc != null)
            {
                lblMensajeCliente.Text = " ";
               // var contrato = Cache.Get("contrato") as Contrato;
                txtRazon.Text = cliente.RazonSocial;
                txtFechaIni.Text = DateTime.Now.ToString("yyyy/MM/dd");
                var fecha=DateTime.Now;
                txtFechaFin.Text = fecha.AddYears(1).ToString("yyyy/MM/dd");
                TextNumero.Text = "00032";
                //contrato.Cliente = cliente;
           

                //chancamos el pedido
               // BindContrato(contrato);

              //  Cache.Insert("contrato", contrato);
            }
            else
            {
                txtRazon.Text =" ";
                lblMensajeCliente.Text = "El cliente no existe!!!";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ViewState["opc"].ToString() == "editar")
            {
                var contrato = Cache.Get("contrato") as Contrato;

                ContratoService.UpdateContrato(contrato);
            }
            else if (ViewState["opc"].ToString() == "nuevo")
            {
                var contrato = Cache.Get("contrato") as Contrato;

                ContratoService.AddContrato(contrato);

                Response.Redirect("frmListContratos.aspx");
            }
        }


        protected void lvDetalleContrato_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "QuitarDetalle")
            {
                var contratoId = Int32.Parse(e.CommandArgument.ToString());

                //recuperar pedido del cache
                var contrato = Cache.Get("contrato") as Contrato;

                BindContrato(contrato);

                Cache.Insert("contrato", contrato);
            }
            else if (e.CommandName == "updateItems")
            {
                //recuperar pedido del cache
                var contrato = Cache.Get("contrato") as Contrato;


                BindContrato(contrato);
                Cache.Insert("contrato", contrato);

            }
        }

        protected void lvContratos_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            //si es el add producto agrego
            if (e.CommandName == "addContrato")
            {
                //recuperar ID
                var contratoId = Int32.Parse(e.CommandArgument.ToString());

                var contrato = ContratoService.GetContratoById(contratoId);

                //transformar a pedido
                var contrato1 = Cache.Get("contrato") as Contrato;

                var existe = contrato1.DetalleContratoes.SingleOrDefault(i => i.ContratoId.Equals(contratoId));

                if (existe == null)
                {

                    var itemContrato = new DetalleContrato()
                    {
                        RutaId = 1,
                        ContratoId = 1,
                        CostoRuta = 100,
                        
                        
                    };

                    //agregar un nuevo item
                    contrato1.DetalleContratoes.Add(itemContrato);
                }
              
                //del refactirizado
                BindContrato(contrato1);

                //insertar pedido del cache 
                Cache.Insert("contrato", contrato1);
            }
        }
    }
}