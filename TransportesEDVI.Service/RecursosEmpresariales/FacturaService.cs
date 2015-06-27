using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.RecursosEmpresariales;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public class FacturaService:IFacturaService
    {
        [Dependency]
        public IFacturaRepository FacturaRepository { get; set; }

        public IEnumerable<BusinessEntities.Factura> GetFromFacturas()
        {
            return FacturaRepository.GetFromFacturas();
        }

        public IEnumerable<BusinessEntities.Factura> GetAllFacturaByNroFactura(string criterio)
        {
            return FacturaRepository.GetAllFacturaByNroFactura(criterio);
        }

        public void AddFactura(BusinessEntities.Factura factura)
        {
            FacturaRepository.AddFactura(factura);
        }

        public void UpdateFactura(BusinessEntities.Factura factura)
        {
            FacturaRepository.UpdateFactura(factura);
        }
    }
}
