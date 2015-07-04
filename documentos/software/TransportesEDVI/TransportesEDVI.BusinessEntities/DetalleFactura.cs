using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleFactura
    {
        public int IdFactura { get; set; }
        public int IdServicio { get; set; }
        public string Descripcion { get; set; }
        public decimal PrecioUnitario { get; set; }
        public Factura Factura { get; set; }
        public Servicio Servicio { get; set; }
    }
}
