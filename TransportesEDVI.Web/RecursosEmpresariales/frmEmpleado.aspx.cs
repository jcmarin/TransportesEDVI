using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.RecursosEmpresariales;

namespace TransportesEDVI.Web.RecursosEmpresariales
{
    public partial class frmEmpleado : System.Web.UI.Page
    {
        [Dependency]
        public IEmpleadoService EmpleadoService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var accion = Request.QueryString["accion"];
            var id = Request.QueryString["id"];
            if (accion != null && accion == "nuevo")
            {
                fvEmpleado.DefaultMode = FormViewMode.Insert;
            }
            else if (accion != null && id != null && accion == "delete")
            {
                Int32 idEmpleado = Int32.Parse(id);

                EmpleadoService.DeleteEmpleado(idEmpleado);
                Response.Redirect("frmListEmpleado.aspx");
            }
        }

        public Empleado GetEmpleado([QueryString("id")] Int32? id)
        {
            if (id.HasValue)
                return EmpleadoService.GetEmpleadoById(id.Value);
            return null;
        }

        public void UpdateEmpleado(Empleado empleado)
        {

            if (ModelState.IsValid)
                EmpleadoService.UpdateEmpleado(empleado);
            Response.Redirect("frmListEmpleado.aspx");
        }

        public void InsertEmpleado(Empleado empleado)
        {
            if (ModelState.IsValid)
                EmpleadoService.AddEmpleado(empleado);
            Response.Redirect("frmListEmpleado.aspx");
        }
    }
}