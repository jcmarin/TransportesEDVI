using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.Logistica
{
    public interface IGastosServicioService
    {
        IEnumerable<GastosDeServicio> GetGastosServicioByCriterio(string criterio);
        GastosDeServicio GetGastosServicioById(Int32 id);
    }
}
