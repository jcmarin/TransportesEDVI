using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class GastosMantenimento
    {
        public GastosMantenimento()
        {
            this.DetalleGastMants = new List<DetalleGastMant>();
        }

        public int Id { get; set; }
        public decimal ConstoEngrace { get; set; }
        public decimal CostoLubricacion { get; set; }
        public decimal CostoNeumaticos { get; set; }
        public decimal CostoSuspencion { get; set; }
        public decimal CostoMotor { get; set; }
        public decimal CostoCarreta { get; set; }
        public decimal CostoSistemaElectrico { get; set; }
        public decimal OtrosGastos { get; set; }
        public decimal Total { get; set; }
        public List<DetalleGastMant> DetalleGastMants { get; set; }
    }
}
