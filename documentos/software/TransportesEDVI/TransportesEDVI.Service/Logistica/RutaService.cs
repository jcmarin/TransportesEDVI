using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.Logistica;

namespace TransportesEDVI.Service.Logistica
{
    public class RutaService:IRutaService
    {
        [Dependency]
        public IRutasRepository RutasRepository { get; set; }

        public IEnumerable<BusinessEntities.Ruta> GetRutaByCriterio(string criterio)
        {
            return RutasRepository.GetRutaByCriterio(criterio);
        }

        public BusinessEntities.Ruta GetRutaById(int id)
        {
            return RutasRepository.GetRutaById(id);
        }

        public void AddRuta(BusinessEntities.Ruta ruta)
        {
            RutasRepository.AddRuta(ruta);
        }

        public void UpdateRuta(BusinessEntities.Ruta ruta)
        {
            RutasRepository.UpdateRuta(ruta);
        }

        public void RemoveRuta(int id)
        {
            RutasRepository.RemoveRuta(id);

        }
    }
}
