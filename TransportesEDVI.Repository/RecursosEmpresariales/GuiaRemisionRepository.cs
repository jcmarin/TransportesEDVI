using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public class GuiaRemisionRepository : MasterRepository, IGuiaRemisionRepository
    {

        public GuiaRemision GetFromGuiaRemisionById(int id)
        {
            return _Context.GuiaRemisions.Find(id);
        }

        public GuiaRemision GetFromGuiaRemisionByNroGuia(string nroGuia)
        {
            var query = from c in _Context.GuiaRemisions
                        select c;
            if (!String.IsNullOrEmpty(nroGuia) && nroGuia != string.Empty)
            {
                query = from c in query
                        where c.NroGuias.ToUpper().Contains(nroGuia.ToUpper())
                        select c;
            }
            return query.SingleOrDefault();
        }
    }
}
