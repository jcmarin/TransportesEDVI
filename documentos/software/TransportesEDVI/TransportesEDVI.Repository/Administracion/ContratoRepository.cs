using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Administracion
{
    public class ContratoRepository:MasterRepository,IContratoRepository
    {
        public IEnumerable<Contrato> GetContratoByCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin)
        {
            var query = from r in _Context.Contratoes
                        select r;

            if (!string.IsNullOrEmpty(criterio))
            {
                query = from r in query
                        where r.Numero.ToUpper().StartsWith(criterio.ToUpper())
                        select r;

                if (fechaIni.HasValue && fechaFin.HasValue)
                {
                    fechaIni = DateTime.Parse(fechaIni.Value.ToShortDateString() + " 00:00:00");
                    fechaFin = DateTime.Parse(fechaFin.Value.ToShortDateString() + " 23:59:59");

                    query = from p in query
                            where p.FechIniContrato >= fechaIni && p.FechFinContrato <= fechaFin
                            select p;
                }

            }
            return query;
        }
        public Contrato GetContratoById(int id)
        {
            return _Context.Contratoes.Find(id);
        }

        public void AddContrato(Contrato contrato)
        {
            _Context.Contratoes.Add(contrato);
            _Context.SaveChanges();
        }

        public void UpdateContrato(Contrato contrato)
        {
            _Context.Entry(contrato).State = EntityState.Modified;

            _Context.SaveChanges();
        }

        public void RemoveContrato(int id)
        {
            var existe = _Context.Contratoes.Find(id);

            if (existe != null)
            {
                _Context.Contratoes.Remove(existe);
                _Context.SaveChanges();
            }
        }

        
    }
}
