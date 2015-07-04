using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
   public interface IFacturaService
    {
        IEnumerable<Factura> GetFromFacturas();
        IEnumerable<Factura> GetAllFacturaByNroFactura(string criterio);
        void AddFactura(Factura factura);
        void UpdateFactura(Factura factura);
    }
}
