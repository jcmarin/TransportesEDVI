using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleGuiaRemision
    {
        public int IdGuiaRemision { get; set; }
        public int Item { get; set; }
        public decimal Peso { get; set; }
        public string GuiaRemitente { get; set; }
        public string Descripcion { get; set; }
        public int CantidadBultos { get; set; }
        public int IdContrato { get; set; }
        public int IdRuta { get; set; }
        public DetalleContrato DetalleContrato { get; set; }
        public GuiaRemision GuiaRemision { get; set; }
    }
}
