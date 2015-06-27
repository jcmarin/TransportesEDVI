using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.Logistica;
using TransportesEDVI.Service.RecursosEmpresariales;
using System.Web.ModelBinding;
namespace TransportesEDVI.Web.Logistica
{
    public partial class frmGastosServicio : System.Web.UI.Page
    {
        [Dependency]
        public IServicioService ServicioService { get; set; }
        [Dependency]
        public IGuiaRemisionService GuiaRemisionService { get; set; }
        [Dependency]
        public IGastosServicioService GastosServicioService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var idServicio = Request.QueryString["id"];
            var opc = Request.QueryString["opc"];

            if (!Page.IsPostBack)
            {
                if (idServicio != null && opc.Equals("editar"))
                {
                    ViewState["opc"] = "editar";

                    var id = Int32.Parse(idServicio);

                    var servicio = ServicioService.GetFromServicioById(id);

                    // trabajar con cache nombre a recuperar e insertar  
                    Cache.Insert("servicio", servicio);

                    //refactorizado
                    BindServicio(servicio);
                }
                else if (opc != null && opc.Equals("nuevo"))
                {
                    ViewState["opc"] = "nuevo";

                    var servicio = new Servicio();

                    BindServicio(servicio);

                    Cache.Insert("servicio", servicio);
                }
            }
        }

        private void BindServicio(Servicio servicio)
        {
            hfIdPedido.Value = servicio.Id.ToString();
            if (servicio.GuiaRemision != null)
            {
                //txtEmpleado.Text = servicio.Empleado.Nombres;
                txtEstado.Text = servicio.Estado;
            }
            txtFecha.Text = servicio.FechaTraslado.ToShortTimeString();

            servicio.TotalGastosServicio = servicio.DetalleGastosServicios.Sum(i => i.Total);

            lvDetallePedido.DataSource = servicio.DetalleGastosServicios;
            lvDetallePedido.DataBind();

            if (servicio.DetalleGastosServicios.Count > 0)
            {
                //parsear a label
                var lblTotal = lvDetallePedido.FindControl("lblTotal") as Label;
                lblTotal.Text = servicio.TotalGastosServicio.ToString();
            }

        }

        public IEnumerable<GastosDeServicio> GetGastos([Control("txtCriterio")] string criterio)
        {
            return GastosServicioService.GetGastosServicioByCriterio(criterio);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ViewState["opc"].ToString() == "editar")
            {
                var servicio = Cache.Get("servicio") as Servicio;
                ServicioService.UpdateServicio(servicio);
            }
            else if (ViewState["opc"].ToString() == "nuevo")
            {
                var servicio = Cache.Get("servicio") as Servicio;
                ServicioService.AddServicio(servicio);

                Response.Redirect("frmListarGastosServicio.aspx");
            }
        }

        protected void lvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lvProductos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "addProducto")
            {
                var gastosServicioId = Int32.Parse(e.CommandArgument.ToString());

                var gastosServicio = GastosServicioService.GetGastosServicioById(gastosServicioId);

                var servicio = Cache.Get("servicio") as Servicio;

                var existe =
                    servicio.DetalleGastosServicios.SingleOrDefault(i => i.IdGastosServicio.Equals(gastosServicioId));

                if (existe == null)
                {

                    var detalleGastos = new DetalleGastosServicio()
                    {
                        Cantidad = 1,
                        GastosDeServicio = gastosServicio,
                        IdGastosServicio = gastosServicioId,
                        IdServicio = servicio.Id,
                        Costo = gastosServicio.Precio
                    };

                    //agregar un nuevo item
                    servicio.DetalleGastosServicios.Add(detalleGastos);

                }
                else
                {
                    existe.Cantidad += 1;
                }

                BindServicio(servicio);

                Cache.Insert("servicio", servicio);

            }
        }

        protected void txtBuscarClienteDNI_Click(object sender, EventArgs e)
        {


        }

        protected void lvDetallePedido_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "QuitarDetalle")
            {
                var gastosServicioId = Int32.Parse(e.CommandArgument.ToString());

                var servicio = Cache.Get("servicio") as Servicio;

                var detalleGasto =
                    servicio.DetalleGastosServicios.SingleOrDefault(i => i.IdGastosServicio.Equals(gastosServicioId));

                servicio.DetalleGastosServicios.Remove(detalleGasto);

                BindServicio(servicio);

                Cache.Insert("servicio", servicio);
            }
            else if (e.CommandName == "updateItems")
            {
                var servicio = Cache.Get("servicio") as Servicio;
                foreach (var row in lvDetallePedido.Items)
                {
                    var txtCantidad = row.FindControl("txtCantidad") as TextBox;
                    var txtObs = row.FindControl("txtObservaciones") as TextBox;

                    servicio.DetalleGastosServicios[row.DisplayIndex].Cantidad = Int32.Parse(txtCantidad.Text);
                    servicio.DetalleGastosServicios[row.DisplayIndex].Observaciones = txtObs.Text;
                }
            }

        }
    }
}