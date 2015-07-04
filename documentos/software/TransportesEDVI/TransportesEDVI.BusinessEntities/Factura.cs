using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Factura
    {
        public Factura()
        {
            this.DetalleFacturas = new List<DetalleFactura>();
        }

        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string NroFactura { get; set; }
        public string Serie { get; set; }
        public string Estado { get; set; }
        public int IdCliente { get; set; }
        public int IdContrato { get; set; }
        public Cliente Cliente { get; set; }
        public Contrato Contrato { get; set; }
        public List<DetalleFactura> DetalleFacturas { get; set; }
    }
}
