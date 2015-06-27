using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Logistica
{
    public interface IGastosServicioRepository
    {
        IEnumerable<GastosDeServicio> GetGastosServicioByCriterio(string criterio);
        GastosDeServicio GetGastosServicioById(int id);
    }
}
