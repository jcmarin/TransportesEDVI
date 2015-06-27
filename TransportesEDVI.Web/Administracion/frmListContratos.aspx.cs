using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.Administracion;
using System.Web.ModelBinding;

namespace TransportesEDVI.Web.Administracion
{
    public partial class frmListContratos : System.Web.UI.Page
    {
        [Dependency]
        public IContratoService ContratoService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Contrato> GetContratos([Control("txtCriterio")]string criterio, [Control("txtFechaIni")]DateTime? fechaIni,
                       [Control("txtFechaFin")]DateTime? fechaFin)
        {
            return ContratoService.GetContratoByCriterio(criterio, fechaIni, fechaFin);
        }
    }
}