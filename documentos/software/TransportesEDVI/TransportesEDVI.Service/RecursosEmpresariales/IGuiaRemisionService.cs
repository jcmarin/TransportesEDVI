using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public interface IGuiaRemisionService
    {
        GuiaRemision GetFromGuiaRemisionById(Int32 id);
        GuiaRemision GetFromGuiaRemisionByNroGuia(string nroGuia);
    }
}
