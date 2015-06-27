using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.RecursosEmpresariales;
using System.Web.ModelBinding;
namespace TransportesEDVI.Web.RecursosEmpresariales
{
    public partial class frmListVehiculos : System.Web.UI.Page
    {
        [Dependency]
        public IVehiculoService VehiculoService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<Vehiculo> GetVehiculos([Control("txtCriterio")]string criterio)
        {
            return VehiculoService.GetFromVehiculosByPlaca(criterio);
        }
    }
}