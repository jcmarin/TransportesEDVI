using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class GuiaRemision
    {
        public GuiaRemision()
        {
            this.DetalleGuiaRemisions = new List<DetalleGuiaRemision>();
            this.Servicios = new List<Servicio>();
            this.GastosServicio = new List<GastosDeServicio>();
        }

        public int Id { get; set; }
        public string NroGuias { get; set; }
        public decimal PesoTotal { get; set; }
        public string Estado { get; set; }
        public List<DetalleGuiaRemision> DetalleGuiaRemisions { get; set; }
        public List<Servicio> Servicios { get; set; }
        public List<GastosDeServicio> GastosServicio { get; set; }
    }
}
