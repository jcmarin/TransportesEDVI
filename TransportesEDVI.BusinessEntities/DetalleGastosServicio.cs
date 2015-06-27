using System;
using System.Collections.Generic;

namespace TransportesEDVI.BusinessEntities
{
    public class DetalleGastosServicio
    {
        public int IdGastosServicio { get; set; }
        public GastosDeServicio GastosDeServicio { get; set; }

        public int IdServicio { get; set; }
        public Servicio Servicio { get; set; }


        public Int32 Cantidad { get; set; }
        public decimal Costo { get; set; }
        public DateTime Fecha { get; set; }
        public string Observaciones { get; set; }

        public decimal Total
        {
            get
            {
                return Costo * Cantidad;
            }
        }


        public bool Equals(DetalleGastosServicio other)
        {
            if (object.ReferenceEquals(other, null)) return false;
            if (object.ReferenceEquals(this, other)) return true;

            return IdGastosServicio.Equals(other.IdGastosServicio) && IdServicio.Equals(other.IdServicio);
        }

        public override int GetHashCode()
        {
            return IdServicio.GetHashCode() * IdGastosServicio.GetHashCode();
        }

    }
}
