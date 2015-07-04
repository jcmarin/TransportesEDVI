using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Vehiculo
    {
        public Vehiculo()
        {
            this.DetalleGastMants = new List<DetalleGastMant>();
            this.Servicios = new List<Servicio>();
        }

        public int Id { get; set; }
        public string PlacaVehiculo { get; set; }
        public string Marca { get; set; }
        public string PlacaCarreta { get; set; }
        public string Modelo { get; set; }
        public string CestidicadoIncripcion { get; set; }
        public string ConfiguracionVehicular { get; set; }
        public DateTime Soat { get; set; }
        public DateTime RevicionTecnica { get; set; }
        public decimal CargaBruta { get; set; }
        public string Estado { get; set; }
        public List<DetalleGastMant> DetalleGastMants { get; set; }
        public List<Servicio> Servicios { get; set; }
    }
}
