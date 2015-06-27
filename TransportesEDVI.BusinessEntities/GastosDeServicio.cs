using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class GastosDeServicio
    {
        public GastosDeServicio()
        {
            this.DetalleGastosServicios = new List<DetalleGastosServicio>();
        }

        public int Id { get; set; }

        public decimal Precio { get; set; }
        public String Descripcion { get; set; }

        public int IdGuiaRemision { get; set; }
        public GuiaRemision GuiaRemision { get; set; }
        public List<DetalleGastosServicio> DetalleGastosServicios { get; set; }
    }
}
