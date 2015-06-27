using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.Administracion;
namespace TransportesEDVI.Service.Administracion
{
    public class ContratoService:IContratoService
    {
        [Dependency]
        public IContratoRepository ContratoRepository { get; set; }

        public IEnumerable<BusinessEntities.Contrato> GetContratoByCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin)
        {
            return ContratoRepository.GetContratoByCriterio(criterio, fechaIni, fechaFin);
        }

        public BusinessEntities.Contrato GetContratoById(int id)
        {
            return ContratoRepository.GetContratoById(id);
        }

        public void AddContrato(BusinessEntities.Contrato contrato)
        {
         ContratoRepository.AddContrato(contrato);
        }

        public void UpdateContrato(BusinessEntities.Contrato contrato)
        {
            ContratoRepository.UpdateContrato(contrato);
        }

        public void RemoveContrato(int id)
        {
          ContratoRepository.RemoveContrato(id);
        }

      
    }
}
