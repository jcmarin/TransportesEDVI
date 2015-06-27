using System;
using System.Data.Entity;
using System.Linq;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public class ClienteRepository:MasterRepository,IClienteRepository
    {

        public System.Collections.Generic.IEnumerable<Cliente> GetFromClientes()
        {
            return _Context.Clientes;
        }

        public System.Collections.Generic.IEnumerable<Cliente> GetAllClientesByDniRuc(string criterio)
        {
            var query = from c in _Context.Clientes
                        select c;
            if (!String.IsNullOrEmpty(criterio) && criterio != string.Empty)
            {
                query = from c in query
                        where c.Ruc.ToUpper().Contains(criterio.ToUpper())||
                        c.RazonSocial.ToUpper().Contains(criterio.ToUpper())
                        select c;
            }
            return query;
        }

        public void DeleteCliente(int Id)
        {
            var existe = _Context.Clientes.Find(Id);
            if (existe != null)
            {
                _Context.Clientes.Remove(existe);
                _Context.SaveChanges();
            }
        }

        public Cliente getFromClienteById(int id)
        {
            return _Context.Clientes.Find(id);
        }

        public void addCliente(Cliente cliente)
        {
            _Context.Clientes.Add(cliente);
            _Context.SaveChanges();
        }

        public void updateCliente(Cliente cliente)
        {
           _Context.Entry(cliente).State=EntityState.Modified;
            
            _Context.SaveChanges();
        }
    }
}
