using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Logistica
{
    public class GastosServicioRepository : MasterRepository, IGastosServicioRepository
    {
        public IEnumerable<GastosDeServicio> GetGastosServicioByCriterio(string criterio)
        {
            var query = from p in _Context.GastosDeServicios
                        select p;

            if (!string.IsNullOrEmpty(criterio))
            {
                query = from p in query
                        where p.Descripcion.ToUpper().Contains(criterio.ToUpper())
                        select p;
            }

            return query;
        }


        public GastosDeServicio GetGastosServicioById(int id)
        {
            return _Context.GastosDeServicios.Find(id);
        }
    }
}
