using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public class FacturaRepository:MasterRepository,IFacturaRepository
    {
        public IEnumerable<BusinessEntities.Factura> GetFromFacturas()
        {
            return _Context.Facturas;
        }

        public IEnumerable<BusinessEntities.Factura> GetAllFacturaByNroFactura(string criterio)
        {
            var query = from c in _Context.Facturas
                        select c;
            if (!String.IsNullOrEmpty(criterio) && criterio != string.Empty)
            {
                query = from c in query
                        where c.NroFactura.Contains(criterio.ToUpper()) 
                        select c;
            }
            return query;
        }

        public void AddFactura(BusinessEntities.Factura factura)
        {
            _Context.Facturas.Add(factura);
            _Context.SaveChanges();
        }

        public void UpdateFactura(BusinessEntities.Factura factura)
        {
            _Context.Entry(factura).State = EntityState.Modified;

            _Context.SaveChanges();
        }
    }
}
