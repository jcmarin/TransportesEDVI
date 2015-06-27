using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.Logistica;
using  System.Web.ModelBinding;

namespace TransportesEDVI.Web.Logistica
{
    public partial class frmListRutas : System.Web.UI.Page
    {
        [Dependency]
        public IRutaService RutaService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<Ruta> GetRutas([Control("txtCriterio")]string criterio)

        {
            return RutaService.GetRutaByCriterio(criterio);
        }
    }
}