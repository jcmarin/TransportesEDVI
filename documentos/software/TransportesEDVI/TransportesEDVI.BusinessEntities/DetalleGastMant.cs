using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleGastMant
    {
        public DateTime Fecha { get; set; }
        public int IdGastosMantenimiento { get; set; }
        public int IdVehiculo { get; set; }
        public decimal Total { get; set; }
        public GastosMantenimento GastosMantenimento { get; set; }
        public Vehiculo Vehiculo { get; set; }
    }
}
