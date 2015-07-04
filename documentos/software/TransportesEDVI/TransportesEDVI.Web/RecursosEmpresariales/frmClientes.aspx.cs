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
    public partial class frmClientes : System.Web.UI.Page
    {
        [Dependency]
        public IClienteService ClienteService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var accion = Request.QueryString["accion"];
            var id = Request.QueryString["id"];
            if (accion != null && accion == "nuevo")
            {
                fvCliente.DefaultMode = FormViewMode.Insert;
            }
            else if (accion != null && id != null && accion == "delete")
            {
                Int32 idCliente = Int32.Parse(id);

                ClienteService.DeleteCliente(idCliente);
                Response.Redirect("frmListClientes.aspx");
            }

        }

        public Cliente GetCliente([QueryString("id")] Int32? id)
        {
            if (id.HasValue)
                return ClienteService.getFromClienteById(id.Value);
            return null;
        }

        public void UpdateCliente(Cliente cliente)
        {

            if (ModelState.IsValid)
                ClienteService.updateCliente(cliente);
            Response.Redirect("frmListClientes.aspx");
        }

        public void InsertCliente(Cliente cliente)
        {
           
            if (ModelState.IsValid)
                ClienteService.addCliente(cliente);
            Response.Redirect("frmListClientes.aspx");

        }
    }
}