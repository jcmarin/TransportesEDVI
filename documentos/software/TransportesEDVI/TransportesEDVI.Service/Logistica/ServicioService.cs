using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.Logistica;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.Logistica
{
    public class ServicioService : IServicioService
    {
        [Dependency]
        public IServicioRepository ServicioRepository { get; set; }

        public Servicio GetFromServicioById(int id)
        {
            return ServicioRepository.GetFromServicioById(id);
        }

        public IEnumerable<Servicio> GetServicioByFechaAndCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin)
        {
            return ServicioRepository.GetServicioByFechaAndCriterio(criterio, fechaIni, fechaFin);
        }

        public void AddServicio(Servicio servicio)
        {
            ServicioRepository.AddServicio(servicio);
        }

        public void UpdateServicio(Servicio servicio)
        {
            ServicioRepository.UpdateServicio(servicio);
        }

        public void DeleteServicio(int id)
        {
            ServicioRepository.DeleteServicio(id);
        }
    }
}
