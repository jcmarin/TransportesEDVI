using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.Administracion
{
    public interface IContratoService
    {
        IEnumerable<Contrato> GetContratoByCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin);
        Contrato GetContratoById(Int32 id);
        void AddContrato(Contrato contrato);
        void UpdateContrato(Contrato contrato);
        void RemoveContrato(Int32 id);
    }
}
