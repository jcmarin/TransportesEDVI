using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.Logistica
{
    public interface IRutaService
    {
        IEnumerable<Ruta> GetRutaByCriterio(string criterio);
        Ruta GetRutaById(Int32 id);
        void AddRuta(Ruta ruta);
        void UpdateRuta(Ruta ruta);
        void RemoveRuta(Int32 id);

    }
}
