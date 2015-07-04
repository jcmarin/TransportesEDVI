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
    public partial class frmListClientes : System.Web.UI.Page
    {
        [Dependency]
        public IClienteService ClienteService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

            public IEnumerable<Cliente> GetClientes([Control("txtCriterio")]string criterio)

            {
                return ClienteService.GetAllClientesByDniRuc(criterio);
            }
    }
}