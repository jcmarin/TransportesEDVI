using System;
using System.Collections.Generic;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Logistica
{
    public interface IRutasRepository
    {
        IEnumerable<Ruta> GetRutaByCriterio(string criterio);
        Ruta GetRutaById(Int32 id);
        void AddRuta(Ruta ruta);
        void UpdateRuta(Ruta ruta);
        void RemoveRuta(Int32 id);
    }
}
