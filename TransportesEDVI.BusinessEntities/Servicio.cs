using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Servicio
    {
        public Servicio()
        {
            this.DetalleBoletas = new List<DetalleBoleta>();
            this.DetalleFacturas = new List<DetalleFactura>();
            this.DetalleGastosServicios = new List<DetalleGastosServicio>();
        }

        public int Id { get; set; }
        public DateTime FechaEmision { get; set; }
        public DateTime FechaTraslado { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        public int IdEmpleado { get; set; }
        public int? IdVehiculo { get; set; }
        public int? IdGuiaRemision { get; set; }
        public List<DetalleBoleta> DetalleBoletas { get; set; }
        public List<DetalleFactura> DetalleFacturas { get; set; }
        public List<DetalleGastosServicio> DetalleGastosServicios { get; set; }
        public Decimal TotalGastosServicio { get; set; }
        public Empleado Empleado { get; set; }
        public GuiaRemision GuiaRemision { get; set; }
        public Vehiculo Vehiculo { get; set; }
    }
}
