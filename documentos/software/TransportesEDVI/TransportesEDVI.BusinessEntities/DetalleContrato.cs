using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleContrato
    {
        public DetalleContrato()
        {
            this.DetalleGuiaRemisions = new List<DetalleGuiaRemision>();
        }

        public int RutaId { get; set; }
        public int ContratoId { get; set; }
        public decimal CostoRuta { get; set; }
        public Contrato Contrato { get; set; }
        public Ruta Ruta { get; set; }
        public Cliente Cliente { get; set; }
        public List<DetalleGuiaRemision> DetalleGuiaRemisions { get; set; }
    }
}



