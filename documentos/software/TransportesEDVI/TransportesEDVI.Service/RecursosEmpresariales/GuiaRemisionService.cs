using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.Logistica;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Repository.RecursosEmpresariales;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public class GuiaRemisionService : IGuiaRemisionService
    {
        [Dependency]
        public IGuiaRemisionRepository GuiaRemisionRepository { get; set; }

        public GuiaRemision GetFromGuiaRemisionById(int id)
        {
            return GuiaRemisionRepository.GetFromGuiaRemisionById(id);
        }

        public GuiaRemision GetFromGuiaRemisionByNroGuia(string nroGuia)
        {
            return GuiaRemisionRepository.GetFromGuiaRemisionByNroGuia(nroGuia);
        }
    }
}
