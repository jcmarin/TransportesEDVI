using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.Repository.RecursosEmpresariales;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public class ClienteService:IClienteService
    {
        [Dependency]
        public IClienteRepository ClienteRepository { get; set; }

        public IEnumerable<BusinessEntities.Cliente> GetFromClientes()
        {
            return ClienteRepository.GetFromClientes();
        }

        public IEnumerable<BusinessEntities.Cliente> GetAllClientesByDniRuc(string criterio)
        {
            return ClienteRepository.GetAllClientesByDniRuc(criterio);
        }

        public void DeleteCliente(int Id)
        {
            ClienteRepository.DeleteCliente(Id);
        }

        public BusinessEntities.Cliente getFromClienteById(int id)
        {
            return ClienteRepository.getFromClienteById(id);
        }

        public void addCliente(BusinessEntities.Cliente cliente)
        {
            ClienteRepository.addCliente(cliente);
        }

        public void updateCliente(BusinessEntities.Cliente cliente)
        {
            ClienteRepository.updateCliente(cliente);
        }
        
        public BusinessEntities.Cliente getFromClienteByRuc(string Ruc)
        {
          return   ClienteRepository.getFromClienteByRuc(Ruc);
        }
    }
}
