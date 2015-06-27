using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class Empleado
    {
        public Empleado()
        {
            this.Servicios = new List<Servicio>();
        }

        public int Id { get; set; }
        public string Nombres { get; set; }
        public string ApPaterno { get; set; }
        public string ApMaterno { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Dni { get; set; }
        public string Categoria { get; set; }
        public decimal Sueldo { get; set; }
        public string NrCarnet { get; set; }
        public string Licencia { get; set; }
        public string Estado { get; set; }
        public int GuiaRemisionId { get; set; }
        public List<Servicio> Servicios { get; set; }
    }
}
