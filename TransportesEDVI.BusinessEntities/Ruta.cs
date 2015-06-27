using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Ruta
    {
        public Ruta()
        {
            this.DetalleContratoes = new List<DetalleContrato>();
        }

        public int Id { get; set; }
        public string Descripcion { get; set; }
        public string Distancia { get; set; }
        public string Origen { get; set; }
        public string Destino { get; set; }
        public List<DetalleContrato> DetalleContratoes { get; set; }

    }
}
