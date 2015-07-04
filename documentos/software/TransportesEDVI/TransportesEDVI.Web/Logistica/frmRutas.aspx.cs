using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Service.Logistica;

namespace TransportesEDVI.Web.Logistica
{
    public partial class frmRutas : System.Web.UI.Page
    {
        [Dependency]
        public IRutaService RutaService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var accion = Request.QueryString["accion"];
            var id = Request.QueryString["id"];
            if (accion!=null&& accion=="nuevo")
            {
                fvRuta.DefaultMode = FormViewMode.Insert;
            }
            else if (accion != null && id != null && accion=="delete")
            {
                Int32 idRuta = Int32.Parse(id);

                RutaService.RemoveRuta(idRuta);
                Response.Redirect("frmListRutas.aspx");
            }
        }

        public Ruta  GetRuta([QueryString("id")] Int32? id)
        {
            if (id.HasValue)
                return RutaService.GetRutaById(id.Value);

            return null;
        }

        public void UpdateRuta(Ruta ruta)
        {
            if (ModelState.IsValid)
                RutaService.UpdateRuta(ruta);
            Response.Redirect("frmListRutas.aspx");
        }

        public void InsertRuta(Ruta   ruta)
        {
            if (ModelState.IsValid)
                RutaService.AddRuta(ruta);
            Response.Redirect("frmListRutas.aspx");
            
        }
    }
}