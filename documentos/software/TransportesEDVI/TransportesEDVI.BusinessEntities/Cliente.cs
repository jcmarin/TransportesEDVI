using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Cliente
    {
        public Cliente()
        {
            this.Contratoes = new List<Contrato>();
            this.Facturas = new List<Factura>();
            this.DetalleContratos = new List<DetalleContrato>();
        }

        public int Id { get; set; }
        public string RazonSocial { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Ruc { get; set; }
        public List<Contrato> Contratoes { get; set; }
        public List<Factura> Facturas { get; set; }
        public List<DetalleContrato> DetalleContratos { get; set; }
    }
}
