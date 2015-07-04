using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public interface IClienteService
    {
        IEnumerable<Cliente> GetFromClientes();
        IEnumerable<Cliente> GetAllClientesByDniRuc(string criterio);
        void DeleteCliente(int Id);
        Cliente getFromClienteById(Int32 id);
        Cliente getFromClienteByRuc(string Ruc);
        void addCliente(Cliente cliente);
        void updateCliente(Cliente cliente);

    }
}
