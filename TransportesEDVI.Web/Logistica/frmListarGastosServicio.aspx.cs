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
    public partial class frmListarGastosServicio : System.Web.UI.Page
    {
        [Dependency]
        public IServicioService ServicioService { get; set; }
        [Dependency]
        public IGuiaRemisionService GuiaRemisionService { get; set; }
        [Dependency]
        public IGastosServicioService GastosServicioService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Servicio> GetServicios([Control("txtCriterio")] string criterio,
            [Control("txtFechaIni")] DateTime? fechaIni,
            [Control("txtFechaFin")] DateTime? fechaFin)
        {
            return ServicioService.GetServicioByFechaAndCriterio(criterio, fechaIni, fechaFin);
        }
    }
}