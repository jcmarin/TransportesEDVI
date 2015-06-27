using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Contrato
    {
        public Contrato()
        {
            this.DetalleContratoes = new List<DetalleContrato>();
            this.Facturas = new List<Factura>();
        }

        public int Id { get; set; }
        public DateTime FechIniContrato { get; set; }
        public DateTime FechFinContrato { get; set; }
        public string Direccion { get; set; }
        public string Estado { get; set; }
        public string Numero { get; set; }
        public int IdCliente { get; set; }
        public decimal MontoXTonelada { get; set; }

        public Cliente Cliente { get; set; }
        public List<DetalleContrato> DetalleContratoes { get; set; }
        public List<Factura> Facturas { get; set; }
    }
}
