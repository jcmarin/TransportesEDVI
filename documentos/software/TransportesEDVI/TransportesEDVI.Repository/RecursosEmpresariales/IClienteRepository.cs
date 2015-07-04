using System;
using System.Collections.Generic;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public interface IClienteRepository
    {
        IEnumerable<Cliente> GetFromClientes();
        IEnumerable<Cliente> GetAllClientesByDniRuc(string criterio);
        Cliente getFromClienteByRuc(string Ruc);
        void DeleteCliente(int Id);
        Cliente getFromClienteById(Int32 id);
        void addCliente(Cliente cliente);
        void updateCliente(Cliente cliente);
    }
}
