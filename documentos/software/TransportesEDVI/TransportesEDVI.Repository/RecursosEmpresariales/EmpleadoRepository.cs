using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public class EmpleadoRepository : MasterRepository, IEmpleadoRepository
    {
        public IEnumerable<Empleado> GetAllEmpleados()
        {
            return _Context.Empleados;
        }

        public IEnumerable<Empleado> GetEmpleadosByDni(string dni)
        {
            var query = from r in _Context.Empleados
                        select r;
            if (dni != "" && dni != null && dni != string.Empty)
            {
                query = from r in query
                        where r.Dni.ToUpper().Contains(dni.ToUpper()) ||
                                r.Dni.ToUpper().Contains(dni.ToUpper())
                        select r;
            }
            return query;
        }

        public Empleado GetEmpleadoById(Int32 id)
        {
            return _Context.Empleados.Find(id);
        }

        public void AddEmpleado(Empleado empleado)
        {
            _Context.Empleados.Add(empleado);
            _Context.SaveChanges();
        }

        public void UpdateEmpleado(Empleado empleado)
        {
            _Context.Entry(empleado).State = EntityState.Modified;
            _Context.SaveChanges();
        }

        public void DeleteEmpleado(int id)
        {
            var existe = _Context.Vehiculos.Find(id);
            if (existe != null)
            {
                _Context.Vehiculos.Remove(existe);
                _Context.SaveChanges();
            }
        }
    }
}
