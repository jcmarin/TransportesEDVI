using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleBoleta
    {
        public int IdBoletas { get; set; }
        public int IdServicio { get; set; }
        public string Descripcion { get; set; }
        public decimal Monto { get; set; }
        public decimal PrecioUnitario { get; set; }
        public Boleta Boleta { get; set; }
        public Servicio Servicio { get; set; }
    }
}
