using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Repository.Logistica;
using Microsoft.Practices.Unity;
namespace TransportesEDVI.Service.Logistica
{
    public class GastosServicioService : IGastosServicioService
    {
        [Dependency]
        public IGastosServicioRepository GastosServicioRepository { get; set; }


        public IEnumerable<GastosDeServicio> GetGastosServicioByCriterio(string criterio)
        {
            return GastosServicioRepository.GetGastosServicioByCriterio(criterio);
        }

        public GastosDeServicio GetGastosServicioById(int id)
        {
            return GastosServicioRepository.GetGastosServicioById(id);
        }
    }
}
