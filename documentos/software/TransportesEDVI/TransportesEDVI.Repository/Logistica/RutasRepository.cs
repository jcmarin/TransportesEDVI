using System.Data.Entity;
using System.Linq;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Logistica
{
    public class RutasRepository :MasterRepository,IRutasRepository
    {


        public System.Collections.Generic.IEnumerable<Ruta> GetRutaByCriterio(string criterio)
        {
            var query = from r in _Context.Rutas
                select r;

            if (!string.IsNullOrEmpty(criterio))
            {
                query = from r in query
                        where r.Origen.ToUpper().StartsWith(criterio.ToUpper()) ||
                              r.Destino.ToUpper().Contains(criterio.ToUpper())
                        select r;

            }
            return query;
        }

        public Ruta GetRutaById(int id)
        {
            return _Context.Rutas.Find(id);
        }

        public void AddRuta(Ruta ruta)
        {
            _Context.Rutas.Add(ruta);
            _Context.SaveChanges();
        }

        public void UpdateRuta(Ruta ruta)
        {
            _Context.Entry(ruta).State=EntityState.Modified;
            
            _Context.SaveChanges();
        }

        public void RemoveRuta(int id)
        {
            var existe = _Context.Rutas.Find(id);

            if (existe != null)
            {
                _Context.Rutas.Remove(existe);
                _Context.SaveChanges();
            }
        }
    }
}
