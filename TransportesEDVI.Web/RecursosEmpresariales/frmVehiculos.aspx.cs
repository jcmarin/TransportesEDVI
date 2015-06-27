using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.RecursosEmpresariales;

namespace TransportesEDVI.Web.RecursosEmpresariales
{
    public partial class frmVehiculos : System.Web.UI.Page
    {
        [Dependency]
        public IVehiculoService VehiculoService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var accion = Request.QueryString["accion"];
            var id = Request.QueryString["id"];
            if (accion != null && accion == "nuevo")
            {
                fvVehiculo.DefaultMode = FormViewMode.Insert;
            }
            else if (accion != null && id != null && accion == "delete")
            {
                Int32 idvehiculo = Int32.Parse(id);

                VehiculoService.deleteVehiculo(idvehiculo);
                Response.Redirect("frmListVehiculos.aspx");
            }
        }
        public Vehiculo GetVehiculo([QueryString("id")] Int32? id)
        {
            if (id.HasValue)
                return VehiculoService.GetFromVehiculoById(id.Value);
            return null;
        }

        public void UpdateVehiculo(Vehiculo vehiculo)
        {

            if (ModelState.IsValid)
                VehiculoService.updateVehiculo(vehiculo);
            Response.Redirect("frmListVehiculos.aspx");
        }

        public void InsertVehiculo(Vehiculo vehiculo)
        {
            if (ModelState.IsValid)
                VehiculoService.addVehiculos(vehiculo);
            Response.Redirect("frmListVehiculos.aspx");

        }

      
    }
}